import 'package:flutter/material.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';
import 'package:random_cat_facts/presentation/widgets/fact/fact_card.dart';

class FactHistoryListWidget extends StatelessWidget {
  const FactHistoryListWidget({Key? key, required this.list}) : super(key: key);
  final List<FactModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      itemBuilder: (context, index) {
        return FactCard(
          factModel: list[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: list.length,
    );
  }
}
