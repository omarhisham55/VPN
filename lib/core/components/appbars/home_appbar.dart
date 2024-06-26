import 'package:flutter/material.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
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
          : TextGlobal(
              title,
              style: TextSizeState.headlineMedium,
              color: PrimaryColors.primary400,
              fontWeight: FontWeight.bold,
            ),
      actions: [action ?? Container()],
    );

AppBar extraPageAppbar(
  BuildContext context,
  String title, {
  Color? backgroundColor,
  Color? iconColor,
  Color? textColor = PrimaryColors.primary400,
  double? elevation = 0,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    leading: Container(
      margin: const EdgeInsets.only(left: 12),
      child: ElevatedButton(
        onPressed: () => AppNavigation.pop(context),
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(CircleBorder()),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(4)),
          backgroundColor: MaterialStatePropertyAll(
            iconColor ??
                (ThemeController.isDarkTheme
                    ? NeutralColors.grey900
                    : NeutralColors.white),
          ),
          iconColor: const MaterialStatePropertyAll(PrimaryColors.primary500),
          elevation: MaterialStatePropertyAll(elevation),
        ),
        child: const Icon(Icons.chevron_left),
      ),
    ),
    title: TextGlobal(
      title,
      style: TextSizeState.headlineMedium,
      color: textColor,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
  );
}
