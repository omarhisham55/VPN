import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:vpn_demo/core/constants/apis/api_consumer.dart';
import 'package:vpn_demo/core/constants/apis/apis.dart';
import 'package:vpn_demo/core/constants/apis/app_interceptor.dart';
import 'package:vpn_demo/core/constants/apis/status_code.dart';
import 'package:vpn_demo/core/constants/error/exceptions.dart';
import 'package:vpn_demo/config/dpInjection/get_it_dpi.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
      // Don't trust any certificate just because their root cert is trusted.
      final HttpClient client =
          HttpClient(context: SecurityContext(withTrustedRoots: false));
      // You can test the intermediate / root cert here. We just ignore it.
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    });

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = true
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };

    client.interceptors.add(di.DependencyInjection.getIt<AppInterceptor>());
    if (kDebugMode) {
      client.interceptors.add(di.DependencyInjection.getIt<LogInterceptor>());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? parameters}) async {
    try {
      final response = await client.get(path, queryParameters: parameters);
      return _csvToJson(response);
      // return _handleResponseAsJson(jsonResponse);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  Map _csvToJson(response) {
    final csvString = response.toString().split('#')[1].replaceAll('*', '');
    final List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(csvString);
    final headers = rowsAsListOfValues[0];
    Map<int, Map<String, dynamic>> jsonData = {};

    for (int i = 1; i < rowsAsListOfValues.length - 1; i++) {
      Map<String, dynamic> dataMap = {};
      for (int j = 0; j < headers.length; j++) {
        dataMap[headers[j]] = rowsAsListOfValues[i][j];
      }
      jsonData[i] = dataMap;
    }

    return jsonData;
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? parameters,
      Map<String, dynamic>? body,
      bool formData = false}) async {
    try {
      final response = await client.post(
        path,
        queryParameters: parameters,
        data: formData ? FormData.fromMap(body!) : body,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? parameters, Map<String, dynamic>? body}) async {
    try {
      final response =
          await client.post(path, queryParameters: parameters, data: body);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> jsonResponse) {
    final responseJson = jsonDecode(jsonResponse.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        throw const BadRequestException();
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
      case DioExceptionType.unknown:
        throw const UnknownException();
    }
  }
}
