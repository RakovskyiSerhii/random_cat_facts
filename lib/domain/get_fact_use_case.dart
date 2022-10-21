import 'package:random_cat_facts/data/mapper/fact_dto_to_model_mapper.dart';
import 'package:random_cat_facts/data/mapper/fact_model_to_entity_mapper.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';
import 'package:random_cat_facts/data/network/repository/repository.dart';

class GetFactUseCase {
  final Repository _repository;
  final FactDtoToModelMapper _factDtoToModelMapper;
  final FactModelToEntityMapper _factModelToEntityMapper;

  GetFactUseCase(
    this._repository,
    this._factDtoToModelMapper,
    this._factModelToEntityMapper,
  );

  Future<FactModel> invoke() {
    return _repository
        .getFact()
        .then(_factDtoToModelMapper.map)
        .then((value) async {
      await _repository.saveFact(_factModelToEntityMapper.map(value));
      return value;
    });
  }
}
