import 'package:cmovies/utils/app_colors.dart';
import 'package:cmovies/utils/app_theme.dart';
import 'package:cmovies/utils/validators.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isEmail;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isEmail = false,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: validator ??
          (value) {
            if (isEmail) {
              return Validators.validateEmail(value);
            } else if (isPassword) {
              return Validators.validatePassword(value);
            }
            return null;
          },
    );
  }
}
