import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';
import 'package:random_cat_facts/extension/bloc_extension.dart';
import 'package:random_cat_facts/extension/context_extension.dart';
import 'package:random_cat_facts/generated/assets/assets.gen.dart';
import 'package:random_cat_facts/presentation/blocs/fact/fact_cubit.dart';
import 'package:random_cat_facts/presentation/blocs/fact/fact_state.dart';
import 'package:random_cat_facts/presentation/widgets/buttons/app_text_button.dart';
import 'package:random_cat_facts/presentation/widgets/fact_widget.dart';

class FactView extends StatelessWidget {
  const FactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FactCubit(),
      child: BlocBuilder<FactCubit, FactState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.localizations.randomFact),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.history,
                      color: Colors.white,
                    )),
              ],
            ),
            body: DecoratedBox(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: state.isLoading
                              ? Center(child: Assets.lottie.catLoader.lottie())
                              : _buildFact(
                                  context,
                                  state.factModel!,
                                )),
                    ),
                    AppTextButton(
                      text: context.localizations.anotherFact,
                      callback: context.factCubit.getNextFact,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFact(BuildContext context, FactModel model) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: p1.maxHeight),
          child: SingleChildScrollView(
            child: FactWidget(
              factModel: model,
            ),
          ),
        );
      },
    );
  }
}
