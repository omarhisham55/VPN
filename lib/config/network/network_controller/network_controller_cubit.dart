import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';

part 'network_controller_state.dart';

class NetworkController extends Cubit<InternetStatus> {
  NetworkController() : super(InternetStatus(NetworkStatus.disconnected));

  void checkConnection() async {
    var connectionResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectionResult.last);
  }

  void _updateConnectivityStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const TextGlobal(
          'PLEASE CONNECT TO THE INTERNET',
          style: TextSizeState.titleMedium,
          color: NeutralColors.white,
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: NeutralColors.red,
        icon: const Icon(
          Icons.wifi_off,
          color: NeutralColors.white,
          size: 35,
        ),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED,
      );
      emit(InternetStatus(NetworkStatus.disconnected));
    } else {
      Get.closeCurrentSnackbar();
      emit(InternetStatus(NetworkStatus.connected));
    }
  }

  late StreamSubscription<List<ConnectivityResult>> _subscription;

  void trackConnectivityChange() {
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      _updateConnectivityStatus(event.last);
    });
  }

  void dispose() {
    _subscription.cancel();
  }
}
