import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text_fields/search_bar.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';

class HistorySearchBar extends StatelessWidget {
  const HistorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefualtSearchBar(
      controller: HomeCubit.get(context).searchHistoryController,
    );
  }
}
