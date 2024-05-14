import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/features/home/domain/entities/vpn_info.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit manager = HomeCubit.get(context);
        List<VpnInfo> servers = manager.servers;
        return ConditionalBuilder(
          condition: manager.servers.isNotEmpty,
          builder: (context) => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                _loactionItem(context, servers[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: servers.length,
          ),
          fallback: (context) => const TextGlobal(
            'No Locations Available',
            style: TextSizeState.titleMedium,
          ),
        );
      },
    );
  }

  Widget _loactionItem(BuildContext context, VpnInfo model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        border: ThemeController.isDarkTheme
            ? null
            : Border.all(color: NeutralColors.grey500),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(MainImages.logo, width: 60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextGlobal(
                  model.countryLongName,
                ),
                TextGlobal(
                  model.speed.toString(),
                  style: TextSizeState.bodyMedium,
                ),
              ],
            ),
          ),
          Image.asset(
            SignalImages.signal(SignalConnectionState.weak),
            fit: BoxFit.cover,
            height: 26,
          ),
        ],
      ),
    );
  }
}
