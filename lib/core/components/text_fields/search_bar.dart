import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text_fields/defualt_text_field.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class DefualtSearchBar extends StatelessWidget {
  final TextEditingController controller;
  const DefualtSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return DefualtTextField(
      hintText: 'Search',
      controller: controller,
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
