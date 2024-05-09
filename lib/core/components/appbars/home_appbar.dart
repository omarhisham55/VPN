import 'package:flutter/material.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';

AppBar homeAppbar({
  required BuildContext context,
  String? title,
  Widget? action,
}) =>
    AppBar(
      backgroundColor: Colors.transparent,
      leading: Container(
        margin: const EdgeInsets.only(left: 12),
        child: ElevatedButton(
          onPressed: () =>
              HomeCubit.get(context).drawerController.toggleDrawer(),
          style: ButtonStyle(
            shape: const MaterialStatePropertyAll(CircleBorder()),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(4)),
            backgroundColor: MaterialStatePropertyAll(
              ThemeController.isDarkTheme
                  ? NeutralColors.grey900
                  : NeutralColors.white,
            ),
            iconColor: const MaterialStatePropertyAll(PrimaryColors.primary500),
            elevation: const MaterialStatePropertyAll(5),
          ),
          child: const Icon(Icons.menu),
        ),
      ),
      centerTitle: true,
      title: title == null
          ? Image.asset(
              MainImages.logo,
              fit: BoxFit.fill,
              height: 60,
            )
          : Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: PrimaryColors.primary400,
                    fontWeight: FontWeight.bold,
                  ),
            ),
      actions: [action ?? Container()],
    );

AppBar settingsAppbar(BuildContext context, String title) {
  return AppBar(
    leading: Container(
      margin: const EdgeInsets.only(left: 12),
      child: ElevatedButton(
        onPressed: () => AppNavigation.pop(context),
        style: const ButtonStyle(
          shape: MaterialStatePropertyAll(CircleBorder()),
          padding: MaterialStatePropertyAll(EdgeInsets.all(4)),
          backgroundColor: MaterialStatePropertyAll(NeutralColors.white),
          iconColor: MaterialStatePropertyAll(PrimaryColors.primary500),
          elevation: MaterialStatePropertyAll(5),
        ),
        child: const Icon(Icons.chevron_left),
      ),
    ),
    title: Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: PrimaryColors.primary400,
            fontWeight: FontWeight.bold,
          ),
    ),
    centerTitle: true,
  );
}
