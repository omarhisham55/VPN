import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/components/buttons/rounded_appbar_button.dart';
import 'package:vpn_demo/core/components/panel_header.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:vpn_demo/features/home/presentation/widgets/speedTestWidgets/speedMeasuresWidgets/speed_mb_s_measure.dart';
import 'package:vpn_demo/features/home/presentation/widgets/speedTestWidgets/test_info.dart';

class SpeedTestWidgets {
  static Scaffold speedTest(BuildContext context, HomeCubit manager) {
    return Scaffold(
      appBar: homeAppbar(
        context: context,
        title: 'Speed Test',
        action: RoundedAppbarButton(
          icon: Icon(
            Icons.history,
            color: PrimaryColors.primary500,
          ),
          onTap: () => manager.openPanel(500),
        ),
      ),
      body: _speedTestBody(context),
    );
  }

  static Widget _speedTestBody(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          TestInfo(),
          SpeedMeasure(),
        ],
      ),
    );
  }

  static Widget historyPanel(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(22),
        child: Column(
          children: [
            PanelHeader(),
          ],
        ),
      ),
    );
  }
}
