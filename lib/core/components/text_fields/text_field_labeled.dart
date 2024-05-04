import 'package:flutter/material.dart';
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
        Text(
          labelName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        textField,
      ],
    );
  }
}
