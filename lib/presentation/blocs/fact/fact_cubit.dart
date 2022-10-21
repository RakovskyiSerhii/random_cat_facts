import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:random_cat_facts/core/failure/failure.dart';
import 'package:random_cat_facts/core/utils/failure_utils/failure_mixin.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';
import 'package:random_cat_facts/domain/get_fact_use_case.dart';
import 'package:random_cat_facts/presentation/blocs/fact/fact_event.dart';
import 'package:random_cat_facts/presentation/blocs/fact/fact_state.dart';

class FactCubit extends Cubit<FactState> with FailureMixin {
  final GetFactUseCase _getFactUseCase = GetIt.instance.get();

  FactCubit() : super(FactState()) {
    getNextFact(forceLoad: true);
  }

  void getNextFact({bool forceLoad = false}) {
    if (!forceLoad && state.isLoading) return;
    emit(state.copyWith(factModel: null));
    Future.delayed(const Duration(milliseconds: 500), () {
      _getFactUseCase.invoke().then(_updateFact).catchError(handleFailure);
    });
  }

  void _updateFact(FactModel model) {
    emit(state.copyWith(factModel: model));
  }

  @override
  void processFailure(Failure failure) {
    print(failure);
    failure.map(
      networkConnection: (value) =>
          emit(state.copyWith(event: FactEvent.noConnection())),
      api: (value) =>
          emit(state.copyWith(event: FactEvent.error(error: value.message))),
      manual: (value) =>
          emit(state.copyWith(event: FactEvent.error(error: value.message))),
      fatal: (value) => emit(state.copyWith(event: FactEvent.error())),
    );
  }
}
