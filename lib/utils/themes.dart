

import 'package:flutter/material.dart';
import 'package:test_project/utils/color_manager.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: ColorManager.whiteColor,
    buttonTheme: const ButtonThemeData(buttonColor: ColorManager.blueColor),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: ColorManager.blackColor,
    buttonTheme: const ButtonThemeData(buttonColor: ColorManager.blueColor),
  );
}