import 'package:flutter/material.dart';
import 'package:vpn_demo/core/components/text/text_controller.dart';
import 'package:vpn_demo/core/components/text_fields/defualt_text_field.dart';

class TextFieldLabeled extends StatelessWidget {
  final String labelName;
  final DefualtTextField textField;
  const TextFieldLabeled({
    super.key,
    required this.labelName,
    required this.textField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextGlobal(
          labelName,
          style: TextSizeState.titleMedium,
        ),
        const SizedBox(height: 8),
        textField,
      ],
    );
  }
}
