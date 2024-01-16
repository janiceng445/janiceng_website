import 'package:flutter/widgets.dart';

enum ScreenSize { small, medium, large }

class ScreenCalculation {
  ScreenSize getSize(Size screenSize) {
    double screenWidth = screenSize.width;

    if (screenWidth < 600) {
      return ScreenSize.small;
    } else if (screenWidth < 960) {
      return ScreenSize.medium;
    } else {
      return ScreenSize.large;
    }
  }
}
