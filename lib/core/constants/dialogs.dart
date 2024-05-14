import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/buttons/filled_button_component.dart';
import 'package:vpn_demo/core/components/buttons/outlined_button_component.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/constants/navigation_constants.dart';
import 'package:vpn_demo/core/utils/strings.dart';

class AppDialogs {
  static disconnectDialog(BuildContext context, Function() onDisconnect) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          backgroundColor: Theme.of(context).dialogBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 16,
                        right: 16,
                      ),
                      child: TextGlobal(
                        MainStrings.disconnectDialogContent,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
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
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        title: Stack(
          children: [
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 16,
                  right: 16,
                ),
                child: TextGlobal(
                  MainStrings.disconnectDialogContent,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
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
