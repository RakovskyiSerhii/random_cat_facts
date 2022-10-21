import 'package:hive/hive.dart';
import 'package:random_cat_facts/core/invokable/invokable.dart';
import 'package:random_cat_facts/data/local/entity/fact_entity.dart';
import 'package:random_cat_facts/data/network/api/cat_api.dart';
import 'package:random_cat_facts/data/network/dto/fact_dto.dart';
import 'package:random_cat_facts/data/network/repository/base_repository.dart';

class Repository extends BaseRepository with Invokable {
  final CatApi _api;
  final Box<FactEntity> _factBox;

  Repository(this._api, this._factBox);

  Future<FactDto> getFact() => invokeRequest(_api.getFact);

  Future<int> saveFact(FactEntity factEntity) {
    return _factBox.add(factEntity);
  }

  List<FactEntity> getLocalFacts() {
    return _factBox.values.toList();
  }

  Future clearStorage() {
    return _factBox.clear();
  }
}
