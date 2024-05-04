import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/appbars/home_appbar.dart';
import 'package:vpn_demo/core/utils/colors.dart';
import 'package:vpn_demo/core/utils/images.dart';
import 'package:vpn_demo/features/home/presentation/cubit/home_cubit.dart';
import 'package:vpn_demo/features/home/presentation/widgets/historyWidgets/history_item.dart';
import 'package:vpn_demo/features/home/presentation/widgets/historyWidgets/search_bar.dart';

class HistoryWidgets {
  static Scaffold history(BuildContext context, HomeCubit manager) {
    return Scaffold(
      appBar: homeAppbar(context: context, title: 'History'),
      body: ConditionalBuilder(
        condition: true,
        builder: (context) => _historyList(context),
        fallback: (context) => _emptyHistoryList(context),
      ),
    );
  }

  static Widget _emptyHistoryList(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            MainImages.emptyList,
            width: 160,
          ),
          const SizedBox(height: 16),
          Text(
            'Empty History',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: PrimaryColors.primary400,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  static Widget _historyList(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const HistorySearchBar(),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => const HistoryItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            ),
          ],
        ),
      ),
    );
  }
}
