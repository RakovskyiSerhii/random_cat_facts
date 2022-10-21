import 'package:flutter/material.dart';
import 'package:random_cat_facts/core/utils/date/date_format.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';

class FactCard extends StatelessWidget {
  const FactCard({Key? key, required this.factModel}) : super(key: key);
  final FactModel factModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 6,
              spreadRadius: .1,
              color: Colors.black.withOpacity(.3))
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormatter.factFormat.format(factModel.dateTime)),
          Text(
            factModel.text,
          )
        ],
      ),
    );
  }
}
