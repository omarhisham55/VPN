import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text_fields/defualt_text_field.dart';

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
      prefixIcon: Icon(
        Icons.search,
        color: Theme.of(context).iconTheme.color,
      ),
      suffixIcon: Icon(
        Icons.tune_outlined,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
