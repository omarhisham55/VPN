import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vpn_demo/core/components/drawers/home_drawer.dart';
import 'package:vpn_demo/core/constants/snack_bars.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:vpn_demo/features/home/presentation/pages/mainDrawerPages/about_us.dart';
import 'package:vpn_demo/features/home/presentation/pages/mainDrawerPages/help.dart';
import 'package:vpn_demo/features/home/presentation/pages/mainDrawerPages/history.dart';
import 'package:vpn_demo/features/home/presentation/pages/mainDrawerPages/home_page.dart';
import 'package:vpn_demo/features/home/presentation/pages/mainDrawerPages/my_account.dart';
import 'package:vpn_demo/features/home/presentation/pages/mainDrawerPages/settings.dart';
import 'package:vpn_demo/features/home/presentation/pages/mainDrawerPages/share.dart';
import 'package:vpn_demo/features/home/presentation/pages/mainDrawerPages/speed_test.dart';

class HomePageManager extends StatelessWidget {
  const HomePageManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit manager = HomeCubit.get(context);
        manager.drawerCheck();
        return SlidingUpPanel(
          controller: manager.customPanelController,
          maxHeight: manager.panelHeight,
          minHeight: 0.0,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          backdropEnabled: true,
          
          panelBuilder: (sc) => _homeBuild(context, manager).values.toList()[0],
          body: HomeDrawer(
            scaffold: _homeBuild(context, manager).keys.toList()[0],
          ),
        );
      },
    );
  }

  Map<Scaffold, Widget> _homeBuild(BuildContext context, HomeCubit manager) {
    return switch (manager.drawerSelectedPage) {
      0 => {
          HomePageWidgets.homeScaffold(context, manager):
              HomePageWidgets.changeLanguagePanel()
        },
      1 => {
          SpeedTestWidgets.speedTest(context, manager):
              SpeedTestWidgets.historyPanel(context)
        },
      2 => {SharePageWidgets.share(context): Container()},
      3 => {HistoryWidgets.history(context, manager): Container()},
      4 => {
          MyAccountWidgets.myAccount(context, manager):
              MyAccountWidgets.editUserPanel(context, manager)
        },
      5 => {
          SettingsWidgets.settings(context):
              SettingsWidgets.settingsPanel(context)
        },
      6 => {HelpWidgets.help(context): Container()},
      7 => {AboutUsWidgets.aboutUs(context): Container()},
      int() => AppSnackBars.showSnackBar(
          context,
          'page not found',
          AnimatedSnackBarType.warning,
        ),
    };
  }
}
