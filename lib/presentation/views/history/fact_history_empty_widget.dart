import 'package:flutter/material.dart';
import 'package:random_cat_facts/extension/context_extension.dart';
import 'package:random_cat_facts/generated/assets/assets.gen.dart';
import 'package:random_cat_facts/presentation/widgets/buttons/app_text_button.dart';
import 'package:random_cat_facts/presentation/widgets/theme/app_theme.dart';

class FactHistoryEmptyWidget extends StatelessWidget {
  const FactHistoryEmptyWidget({Key? key, required this.callback})
      : super(key: key);

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.lottie.catLooking.lottie(),
            const SizedBox(height: 16),
            Text(
              context.localizations.noSavedFacts,
              style: titleTextStyle.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 30),
            AppTextButton(
              text: context.localizations.getNewFact,
              callback: callback,
            )
          ],
        ),
      ),
    );
  }
}
