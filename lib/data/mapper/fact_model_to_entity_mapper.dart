import 'package:random_cat_facts/data/local/entity/fact_entity.dart';
import 'package:random_cat_facts/data/mapper/base_mapper.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';

class FactModelToEntityMapper extends Mapper<FactModel, FactEntity> {
  @override
  FactEntity map(FactModel inModel) {
    return FactEntity(
      inModel.text,
      inModel.dateTime,
    );
  }
}
