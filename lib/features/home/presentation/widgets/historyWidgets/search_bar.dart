import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text_fields/defualt_text_field.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit.dart';

class HistorySearchBar extends StatelessWidget {
  const HistorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefualtTextField(
      hintText: 'Search',
      controller: HomeCubit.get(context).searchHistoryController,
      keyboardType: TextInputType.text,
      borderRadius: 10,
      prefixIcon: const Icon(
        Icons.search,
        color: NeutralColors.grey700,
      ),
      suffixIcon: const Icon(Icons.tune_outlined),
    );
  }
}
