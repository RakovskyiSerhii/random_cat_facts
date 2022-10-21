import 'package:flutter/material.dart';
import 'package:random_cat_facts/core/utils/date/date_format.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';
import 'package:random_cat_facts/presentation/widgets/cat_image_widget.dart';
import 'package:random_cat_facts/presentation/widgets/theme/app_theme.dart';

class FactWidget extends StatelessWidget {
  const FactWidget({Key? key, required this.factModel}) : super(key: key);
  final FactModel factModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormatter.factFormat.format(factModel.dateTime),
          style: bodyTextStyle.copyWith(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 5),
        Text(factModel.text, style: bodyTextStyle),
        const SizedBox(height: 20),
        const CatImageWidget(),
        const SizedBox(height: 20),
      ],
    );
  }
}
