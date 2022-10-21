import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:random_cat_facts/domain/clear_local_storage_use_case.dart';
import 'package:random_cat_facts/domain/get_local_facts_use_case.dart';
import 'package:random_cat_facts/presentation/blocs/history/fact_history_state.dart';

class FactHistoryCubit extends Cubit<FactHistoryState> {
  final GetLocalFactsUseCase _getLocalFactsUseCase = GetIt.I.get();
  final ClearLocalStorageUseCase _clearLocalStorageUseCase = GetIt.I.get();

  FactHistoryCubit() : super(FactHistoryState()) {
    getHistory();
  }

  void getHistory() {
    Future.delayed(Duration(milliseconds: 500), () {
      final localFacts = _getLocalFactsUseCase.invoke();
      emit(state.copyWith(history: localFacts));
    });
  }

  void cleanStorage() {
    emit(state.copyWith(history: null));
    _clearLocalStorageUseCase.invoke().then((value) => getHistory());
  }
}
