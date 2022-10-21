import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';

part 'fact_history_state.freezed.dart';

@freezed
class FactHistoryState with _$FactHistoryState {
  FactHistoryState._();

  factory FactHistoryState({
    List<FactModel>? history,
  }) = _FactHistoryState;

  bool get isLoading => history == null;
}
