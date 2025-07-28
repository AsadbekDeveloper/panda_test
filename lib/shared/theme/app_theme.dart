import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panda_test/shared/colors/colors.dart';

class AppTheme {
  static const _defaultFontFamily = 'Gilroy';

  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 72,
        ),
        headlineMedium: const TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        headlineSmall: const TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        bodyMedium: const TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
        bodySmall: const TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        labelMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: AppColors.grey,
        ),
      ).apply(bodyColor: AppColors.black, displayColor: AppColors.black),
    );
  }
}
