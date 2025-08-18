import 'package:flutter/material.dart';

enum TestSlice {
  coffe,
  te,
  milkshake,
  lemonade
}

extension TestSliceExtension on TestSlice {
  String get name {
    switch (this) {
      case TestSlice.coffe:
        return "Café";
      case TestSlice.te:
        return "Té";
      case TestSlice.milkshake:
        return "Licuado";
      case TestSlice.lemonade:
        return "Limonada";
    }
  }

  Color get color {
    switch (this) {
      case TestSlice.coffe:
        return Colors.red.withAlpha(50);
      case TestSlice.te:
        return Colors.yellow.withAlpha(90);
      case TestSlice.milkshake:
        return Colors.amber.withAlpha(50);
      case TestSlice.lemonade:
        return Colors.indigo.withAlpha(70);
    }
  }
}