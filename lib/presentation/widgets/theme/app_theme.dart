import 'package:flutter/material.dart';
import 'package:random_cat_facts/generated/assets/colors.gen.dart';

ThemeData get appTheme => ThemeData(
      colorSchemeSeed: ColorName.primaryColor,
      textTheme: TextTheme(
        bodyMedium: bodyTextStyle,
        titleMedium: titleTextStyle,
      ),
    );

TextStyle get bodyTextStyle => const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      color: Colors.black,
    );

TextStyle get titleTextStyle => const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Colors.white,
    );
