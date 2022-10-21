import 'package:flutter/material.dart';
import 'package:random_cat_facts/presentation/widgets/buttons/app_button.dart';
import 'package:random_cat_facts/presentation/widgets/theme/app_theme.dart';

class AppTextButton extends AppButton {
  AppTextButton({
    required String text,
    required VoidCallback callback,
    super.key,
  }) : super(
            callback: callback,
            child: Text(
              text,
              style: titleTextStyle,
            ));
}
