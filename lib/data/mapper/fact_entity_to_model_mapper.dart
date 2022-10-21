import 'package:random_cat_facts/data/local/entity/fact_entity.dart';
import 'package:random_cat_facts/data/mapper/base_mapper.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';

class FactEntityToModelMapper extends BaseMapper<FactEntity, FactModel> {
  @override
  FactModel map(FactEntity inModel) {
    return FactModel(
      text: inModel.text,
      dateTime: inModel.date,
    );
  }
}
