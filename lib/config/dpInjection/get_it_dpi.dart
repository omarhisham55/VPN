import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_demo/config/network/network_controller/network_controller_cubit.dart';
import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
import 'package:vpn_demo/core/constants/apis/api_consumer.dart';
import 'package:vpn_demo/core/constants/apis/app_interceptor.dart';
import 'package:vpn_demo/core/constants/apis/dio_consumer.dart';
import 'package:vpn_demo/features/home/data/datasources/vpn_datasource.dart';
import 'package:vpn_demo/features/home/data/repositories/vpn_repo_impl.dart';
import 'package:vpn_demo/features/home/domain/repositories/vpn_repo.dart';
import 'package:vpn_demo/features/home/domain/usecases/vpn_usecase.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';
// import 'package:injectable/injectable.dart';

class DependencyInjection {
  static final getIt = GetIt.instance;
// @InjectableInit(
//   initializerName: 'init',
//   preferRelativeImports: true,
//   asExtension: true,
// )
// void configurationDependencied() => getIt.init();
  static Future<void> init() async {
    _networkInit();
    _sharedPreferencesInit();
    _dioInit();
    _vpnInit();
    _cubitInit();
  }

  static void _cubitInit() {
    getIt.registerFactory(() => HomeCubit(vpnGetServersUsercase: getIt()));
  }

  static Future<void> _sharedPreferencesInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);
    getIt.registerLazySingleton(
      () => AppSharedPreference(sharedPreferences: sharedPreferences),
    );
  }

  static void _networkInit() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }

  static void _dioInit() {
    getIt.registerLazySingleton(() => Dio());
    getIt
        .registerLazySingleton<ApiConsumer>(() => DioConsumer(client: getIt()));

    getIt.registerLazySingleton(() => AppInterceptor());
    getIt.registerLazySingleton(() => LogInterceptor(
          request: false,
          requestHeader: false,
          requestBody: false,
          responseBody: false,
          responseHeader: false,
          error: true,
        ));
  }

  static void _vpnInit() {
    getIt.registerLazySingleton<VpnRepo>(
        () => VpnRepoImpl(vpnDatasource: getIt()));
    getIt.registerLazySingleton<VpnDatasource>(
        () => VpnDatasourceImpl(apiConsumer: getIt()));
    getIt.registerLazySingleton(() => VpnGetServersUsercase(vpnRepo: getIt()));
  }
}
