import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_demo/config/network/network_controller.dart';
import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
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
}
