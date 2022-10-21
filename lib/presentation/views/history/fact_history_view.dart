import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat_facts/extension/bloc_extension.dart';
import 'package:random_cat_facts/extension/context_extension.dart';
import 'package:random_cat_facts/generated/assets/assets.gen.dart';
import 'package:random_cat_facts/presentation/blocs/history/fact_history_cubit.dart';
import 'package:random_cat_facts/presentation/blocs/history/fact_history_state.dart';
import 'package:random_cat_facts/presentation/views/history/fact_history_empty_widget.dart';
import 'package:random_cat_facts/presentation/widgets/fact/fact_history_list_widget.dart';

class FactHistoryView extends StatelessWidget {
  const FactHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FactHistoryCubit(),
      child: BlocBuilder<FactHistoryCubit, FactHistoryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.localizations.factHistory),
              actions: [
                IconButton(
                    onPressed: context.factHistoryCubit.cleanStorage,
                    icon: const Icon(
                      CupertinoIcons.trash,
                      color: Colors.red,
                    ))
              ],
            ),
            body: _defineState(context, state),
          );
        },
      ),
    );
  }

  Widget _defineState(BuildContext context, FactHistoryState state) {
    if (state.isLoading) {
      return Center(child: Assets.lottie.catLoader.lottie());
    }
    if (state.history!.isEmpty) {
      return FactHistoryEmptyWidget(callback: () {
        context.popRoute(true);
      });
    }
    return FactHistoryListWidget(list: state.history!);
  }
}
