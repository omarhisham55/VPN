import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/components/buttons/outlined_button_component.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/strings.dart';

class AppDialogs {
  static disconnectDialog(BuildContext context, Function() onDisconnect) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          backgroundColor: NeutralColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 16,
                        right: 16,
                      ),
                      child: Text(
                        MainStrings.disconnectDialogContent,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => AppNavigation.pop(context),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefualtOutlinedAppButton(
                  text: MainStrings.cancel,
                  onPressed: () => AppNavigation.pop(context),
                ),
                DefualtAppButton(
                  text: MainStrings.disconnect,
                  onPressed: onDisconnect,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  static deleteHistoryItem(BuildContext context, Widget deletedItem) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        backgroundColor: NeutralColors.white,
        title: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 16,
                  right: 16,
                ),
                child: Text(
                  MainStrings.disconnectDialogContent,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => AppNavigation.pop(context),
                child: const Icon(Icons.close),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            deletedItem,
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: DefualtOutlinedAppButton(
                  text: MainStrings.cancel,
                  onPressed: () => AppNavigation.pop(context),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: DefualtAppButton(
                  text: MainStrings.delete,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
