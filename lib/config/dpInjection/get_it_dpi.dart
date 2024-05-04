import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_demo/config/sharedPreferences/shared_preferences_controller.dart';
// import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;
// @InjectableInit(
//   initializerName: 'init',
//   preferRelativeImports: true,
//   asExtension: true,
// )
// void configurationDependencied() => getIt.init();
Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(
    () => AppSharedPreference(sharedPreferences: sharedPreferences),
  );
}
