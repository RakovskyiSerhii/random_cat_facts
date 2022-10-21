import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';
import 'package:random_cat_facts/presentation/blocs/fact/fact_event.dart';

part 'fact_state.freezed.dart';

@freezed
class FactState with _$FactState {
  FactState._();

  factory FactState({
    FactModel? factModel,
    FactEvent? event,
  }) = _FactState;

  bool get isLoading => factModel == null;
}
