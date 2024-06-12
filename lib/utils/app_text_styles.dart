// app_text_styles.dart

import 'package:cmovies/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 20,
    fontFamily: "IM Fell English SC",
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 38, 38, 38),
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );
}
