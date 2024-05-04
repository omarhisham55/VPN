import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/components/buttons/premium_button.dart';
import 'package:vpn_demo/core/components/buttons/rounded_appbar_button.dart';
import 'package:vpn_demo/core/components/panel_header.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit.dart';
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
            color: PrimaryColors.primary500,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'username',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: NeutralColors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'email',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: NeutralColors.white),
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
        color: NeutralColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My ID  :  AH_28912',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Text(
            'My IP  :  116.108.85.23',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Text(
            'Type  :  Free',
            style: Theme.of(context).textTheme.bodyMedium,
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
        color: NeutralColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Devices',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: PrimaryColors.primary600),
                ),
              ),
              Text(
                '6/10',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: PrimaryColors.primary600),
              ),
            ],
          ),
          const Divider(),
          ...List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'iphone 15 pro',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: PrimaryColors.primary600),
                    ),
                  ),
                  Text(
                    'Connected',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: NeutralColors.green),
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
      color: NeutralColors.grey100,
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
