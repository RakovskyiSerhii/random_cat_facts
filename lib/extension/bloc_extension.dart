import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat_facts/presentation/blocs/fact/fact_cubit.dart';
import 'package:random_cat_facts/presentation/blocs/history/fact_history_cubit.dart';

extension BlocExtension on BuildContext {
  FactCubit get factCubit => BlocProvider.of(this);

  FactHistoryCubit get factHistoryCubit => BlocProvider.of(this);
}
