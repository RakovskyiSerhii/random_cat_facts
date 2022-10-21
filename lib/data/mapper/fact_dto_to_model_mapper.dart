import 'package:random_cat_facts/core/utils/date/date_format.dart';
import 'package:random_cat_facts/core/utils/date/date_generator.dart';
import 'package:random_cat_facts/data/mapper/base_mapper.dart';
import 'package:random_cat_facts/data/models/fact/fact_model.dart';
import 'package:random_cat_facts/data/network/dto/fact_dto.dart';

class FactDtoToModelMapper extends Mapper<FactDto, FactModel> {
  @override
  FactModel map(FactDto inModel) {
    final date = DateGenerator.generate();

    /// api with facts and dates I never founded.
    /// So I decided to generate string date by myself.
    final emulatedApiDate = DateFormatter.apiFormat.parse(date);
    return FactModel(
      text: inModel.fact,
      dateTime: emulatedApiDate,
    );
  }
}
