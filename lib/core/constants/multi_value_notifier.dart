import 'package:flutter/material.dart';

class CombinedValueNotifier extends ValueNotifier<List<bool>> {
  late final List<ValueNotifier<bool>> valueNotifiers = [];

  CombinedValueNotifier(List<ValueNotifier<bool>> valueNotifiers)
      : super(valueNotifiers.map((e) => e.value).toList()) {
    for (var value in valueNotifiers) {
      value.addListener(_update);
    }
  }
  void _update() {
    value = List<bool>.from(valueNotifiers.map((e) => e.value));
  }
}
