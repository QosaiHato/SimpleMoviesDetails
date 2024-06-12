import 'package:cmovies/utils/app_text_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cmovies/firebase_options.dart';
import 'package:cmovies/ui/views/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge:
              AppTextStyles.titleTextStyle, // Apply titleTextStyle to headline6
          titleSmall: AppTextStyles
              .subtitleTextStyle, // Apply subtitleTextStyle to subtitle1
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen()));
}
