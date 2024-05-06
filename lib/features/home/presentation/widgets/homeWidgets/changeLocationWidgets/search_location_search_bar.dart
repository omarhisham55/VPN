import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text_fields/search_bar.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit/home_cubit.dart';

class SearchBarLoaction extends StatelessWidget {
  const SearchBarLoaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: DefualtSearchBar(
        controller: HomeCubit.get(context).searchLocationController,
      ),
    );
  }
}
