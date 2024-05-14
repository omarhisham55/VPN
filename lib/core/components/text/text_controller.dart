import 'package:flutter/material.dart';

enum TextSizeState {
  displayLarge,
  headlineLarge,
  titleLarge,
  bodyLarge,
  displayMedium,
  headlineMedium,
  titleMedium,
  bodyMedium,
  displaySmall,
  headlineSmall,
  titleSmall,
  bodySmall,
}

TextStyle getTextStyle(BuildContext context, TextSizeState textSizeState) {
  switch (textSizeState) {
    case TextSizeState.displayLarge:
      return Theme.of(context).textTheme.displayLarge!;
    case TextSizeState.headlineLarge:
      return Theme.of(context).textTheme.headlineLarge!;
    case TextSizeState.titleLarge:
      return Theme.of(context).textTheme.titleLarge!;
    case TextSizeState.bodyLarge:
      return Theme.of(context).textTheme.bodyLarge!;
    case TextSizeState.displayMedium:
      return Theme.of(context).textTheme.displayMedium!;
    case TextSizeState.headlineMedium:
      return Theme.of(context).textTheme.headlineMedium!;
    case TextSizeState.titleMedium:
      return Theme.of(context).textTheme.titleMedium!;
    case TextSizeState.bodyMedium:
      return Theme.of(context).textTheme.bodyMedium!;
    case TextSizeState.displaySmall:
      return Theme.of(context).textTheme.displaySmall!;
    case TextSizeState.headlineSmall:
      return Theme.of(context).textTheme.headlineSmall!;
    case TextSizeState.titleSmall:
      return Theme.of(context).textTheme.titleSmall!;
    case TextSizeState.bodySmall:
      return Theme.of(context).textTheme.bodySmall!;
  }
}

class TextGlobal extends StatelessWidget {
  final String text;
  final TextSizeState? style;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? startSpacing;
  const TextGlobal(
    this.text, {
    super.key,
    this.style = TextSizeState.bodyLarge,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.startSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: startSpacing!),
      child: Text(
        text,
        style: getTextStyle(context, style!).copyWith(
          color: color,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
