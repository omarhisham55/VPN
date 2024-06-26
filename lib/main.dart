import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:vpn_demo/config/dpInjection/get_it_dpi.dart';
import 'package:vpn_demo/config/network/network_controller/network_controller_cubit.dart';
import 'package:vpn_demo/config/routes/routes.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/bloc_observer.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:vpn_demo/features/home/presentation/cubit/settings_cubit/settings_cubit.dart';
import 'package:vpn_demo/features/onBoarding/presentation/cubit/onboarding_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NetworkController()),
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (context) => AuthenticationCubit()),
        BlocProvider(
          create: (context) => DependencyInjection.getIt<HomeCubit>(),
        ),
        BlocProvider(
            create: (context) => DependencyInjection.getIt<SettingsCubit>()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return GetMaterialApp(
            title: MainStrings.appName,
            theme: ThemeController.mainTheme,
            onGenerateRoute: OnGenerateRoute.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
