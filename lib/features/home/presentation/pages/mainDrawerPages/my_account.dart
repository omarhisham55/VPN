import 'package:flutter/material.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/components/buttons/premium_button.dart';
import 'package:vpn_demo/core/components/buttons/rounded_appbar_button.dart';
import 'package:vpn_demo/core/components/panel_header.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:vpn_demo/features/home/presentation/widgets/myAccountWidgets/edit_user_form.dart';

class MyAccountWidgets {
  static Scaffold myAccount(BuildContext context, HomeCubit manager) {
    return Scaffold(
      appBar: homeAppbar(
        context: context,
        title: 'My Account',
        action: RoundedAppbarButton(
          icon: const Icon(
            Icons.tune_outlined,
          ),
          onTap: () => manager.openPanel(500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  _userInfo(context),
                  const SizedBox(height: 22),
                  _userAddress(context),
                  const SizedBox(height: 22),
                  _userDevices(context),
                ],
              ),
            ),
            PremiumButton(
              text: 'Go to Premium',
              onPressed: () {},
              textColor: NeutralColors.white,
              buttonColor: SecondaryColors.secondary500,
              icon: Image.asset(
                MainImages.premiumWhite,
                height: 25,
              ),
            ),
            const SizedBox(height: 12),
            PremiumButton(
              text: 'Sign Out',
              onPressed: () {},
              textColor: NeutralColors.red,
              buttonColor:
                  ThemeController.isDarkTheme ? NeutralColors.lightBlack : null,
              icon: const Icon(
                Icons.logout,
                color: NeutralColors.red,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _userInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: PrimaryColors.primary500,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextGlobal(
            'username',
            color: NeutralColors.white,
          ),
          SizedBox(height: 8),
          TextGlobal(
            'email',
            style: TextSizeState.bodyMedium,
            color: NeutralColors.white,
          ),
        ],
      ),
    );
  }

  static Widget _userAddress(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ThemeController.isDarkTheme
            ? NeutralColors.lightBlack
            : NeutralColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextGlobal(
            'My ID  :  AH_28912',
            style: TextSizeState.bodyMedium,
          ),
          SizedBox(height: 12),
          TextGlobal(
            'My IP  :  116.108.85.23',
            style: TextSizeState.bodyMedium,
          ),
          SizedBox(height: 12),
          TextGlobal(
            'Type  :  Free',
            style: TextSizeState.bodyMedium,
          ),
        ],
      ),
    );
  }

  static Widget _userDevices(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ThemeController.isDarkTheme
            ? NeutralColors.lightBlack
            : NeutralColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Expanded(
                child: TextGlobal(
                  'Devices',
                  style: TextSizeState.bodyMedium,
                  fontWeight: FontWeight.bold,
                  color: PrimaryColors.primary600,
                ),
              ),
              TextGlobal(
                '6/10',
                style: TextSizeState.bodyMedium,
                color: PrimaryColors.primary600,
              ),
            ],
          ),
          const Divider(),
          ...List.generate(
            4,
            (index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextGlobal(
                      'iphone 15 pro',
                      style: TextSizeState.bodyMedium,
                      color: PrimaryColors.primary600,
                    ),
                  ),
                  TextGlobal(
                    'Connected',
                    style: TextSizeState.bodyMedium,
                    color: NeutralColors.green,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget editUserPanel(BuildContext context, HomeCubit manager) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const PanelHeader(),
            EditUserForm(manager: manager),
          ],
        ),
      ),
    );
  }
}
