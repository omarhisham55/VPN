import 'package:flutter/material.dart';
import 'package:vpn_demo/config/routes/home_routes.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/components/buttons/rounded_appbar_button.dart';
import 'package:vpn_demo/core/components/panel_header.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/card_location.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/change_location_button.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/change_location_panel.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/connectionButtonWidgets/connection_button.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/image_bg.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/time__ip.dart';

class HomePageWidgets {
  static Scaffold homeScaffold(BuildContext context, HomeCubit manager) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: homeAppbar(
        context: context,
        action: RoundedAppbarButton(
          icon: Image.asset(
            MainImages.premiumWhite,
            fit: BoxFit.fill,
            height: 50,
          ),
          onTap: () => AppNavigation.push(context, HomeRoutes.premium),
          backgroundColor: PrimaryColors.primary500,
        ),
      ),
      body: _homeBody(context, manager),
    );
  }

  static Widget _homeBody(BuildContext context, HomeCubit manager) {
    return Stack(
      children: [
        const ImageBg(),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              const CardLocation(),
              ChangeLocationButton(
                onTap: () => manager.openPanel(800),
              ),
              const ShowTimeAndIpAddress(),
              const ConnectionButton(),
            ],
          ),
        ),
      ],
    );
  }

  static Widget changeLanguagePanel(HomeCubit manager) {
    return SingleChildScrollView(
      controller: manager.locationPanelScrollController,
      child: const Padding(
        padding: EdgeInsets.all(22),
        child: Column(
          children: [
            PanelHeader(),
            ChangeLocationPanel(),
          ],
        ),
      ),
    );
  }
}
