import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/strings.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:vpn_demo/features/home/presentation/widgets/homeWidgets/connectionButtonWidgets/connected_info_item.dart';

class BottomConnectionInfo extends StatelessWidget {
  final HomeCubit manager;
  const BottomConnectionInfo({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: manager.isConnected &&
          manager.growingCircularContainerController == null,
      builder: (context) => connectedInfo(context),
      fallback: (context) => notConnectedInfo(context),
    );
  }

  Widget connectedInfo(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 46),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConnectedInfoItem(
            icon: Icons.file_download_outlined,
            text: '62.5 MB/s',
          ),
          ConnectedInfoItem(
            icon: Icons.file_upload_outlined,
            text: '41.2 MB/s',
          ),
        ],
      ),
    );
  }

  Widget notConnectedInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 46),
      child: Text(
        MainStrings.tapToConnect,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: NeutralColors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
