import 'package:flutter/material.dart';
import 'package:random_cat_facts/generated/assets/colors.gen.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.child,
    required this.callback,
  }) : super(key: key);

  final Widget child;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: ColorName.primaryColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: callback,
        child: Container(
          alignment: Alignment.center,
          height: 60,
          child: child,
        ),
      ),
    );
  }
}
