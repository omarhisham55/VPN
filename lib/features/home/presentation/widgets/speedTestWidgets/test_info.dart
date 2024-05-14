import 'package:flutter/material.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class TestInfo extends StatelessWidget {
  const TestInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _testItem(
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.file_download_outlined,
                    color: SecondaryColors.secondary400,
                  ),
                  SizedBox(width: 8),
                  Column(
                    children: [
                      TextGlobal(
                        'Download',
                        style: TextSizeState.titleMedium,
                      ),
                      SizedBox(height: 14),
                      TextGlobal(
                        '---',
                        style: TextSizeState.titleMedium,
                        color: PrimaryColors.primary500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _testItem(
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.file_upload_outlined,
                    color: SecondaryColors.secondary400,
                  ),
                  SizedBox(width: 8),
                  Column(
                    children: [
                      TextGlobal(
                        'Upload',
                        style: TextSizeState.titleMedium,
                      ),
                      SizedBox(height: 14),
                      TextGlobal(
                        '---',
                        style: TextSizeState.titleMedium,
                        color: PrimaryColors.primary500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            _testItem(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextGlobal(
                          'Ping',
                          style: TextSizeState.bodyMedium,
                        ),
                        SizedBox(height: 14),
                        TextGlobal(
                          '--',
                          style: TextSizeState.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextGlobal(
                          'Jitter',
                          style: TextSizeState.bodyMedium,
                        ),
                        SizedBox(height: 14),
                        TextGlobal(
                          '--',
                          style: TextSizeState.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextGlobal(
                          'Loss',
                          style: TextSizeState.bodyMedium,
                        ),
                        SizedBox(height: 14),
                        TextGlobal(
                          '--',
                          style: TextSizeState.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _testItem({required Widget child}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ThemeController.isDarkTheme
              ? NeutralColors.lightBlack
              : NeutralColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
