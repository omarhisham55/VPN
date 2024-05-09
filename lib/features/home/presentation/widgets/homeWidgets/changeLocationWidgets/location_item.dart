import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          fallback: (context) => Text(
            'No Locations Available',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      },
    );
  }

  Widget _loactionItem(BuildContext context, VpnInfo model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(color: NeutralColors.grey500),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset(MainImages.logo, width: 60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.countryLongName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  model.speed.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const Icon(Icons.signal_cellular_alt_sharp),
        ],
      ),
    );
  }
}
