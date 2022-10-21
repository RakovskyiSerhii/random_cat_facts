import 'package:random_cat_facts/data/mapper/fact_entity_to_model_mapper.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';
import 'package:random_cat_facts/data/network/repository/repository.dart';

class GetLocalFactsUseCase {
  final Repository _repository;
  final FactEntityToModelMapper _mapper;

  GetLocalFactsUseCase(this._repository, this._mapper);

  List<FactModel> invoke() {
    final localFacts = _repository.getLocalFacts();
    return _mapper.mapList(localFacts);
  }
}
