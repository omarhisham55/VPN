import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_demo/config/theme/theme_manager.dart';
import 'package:vpn_demo/core/utils/colors.dart';

class DefualtTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscure;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderRadius;
  final String? initialValue;
  const DefualtTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.isObscure = false,
    required this.keyboardType,
    this.onChanged,
    this.validator,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.prefixIcon,
    this.borderRadius = 10,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isObscure!,
        onChanged: onChanged,
        validator: validator,
        initialValue: initialValue,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: NeutralColors.grey700),
          fillColor: ThemeController.isDarkTheme
              ? NeutralColors.grey900
              : NeutralColors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: NeutralColors.grey500),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: NeutralColors.red),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        inputFormatters: inputFormatters,
        textAlign: textAlign!,
      ),
    );
  }
}
