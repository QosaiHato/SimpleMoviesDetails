// app_theme.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
    ),
    textTheme: TextTheme(
      titleLarge: AppTextStyles.titleTextStyle, // Use your custom titleTextStyle
      titleSmall: AppTextStyles.subtitleTextStyle, // Use your custom subtitleTextStyle
      // You can define and use other custom text styles here as needed
    ),
    // Define other theme properties as needed
  );
}
