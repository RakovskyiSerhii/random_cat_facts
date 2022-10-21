import 'package:hive/hive.dart';

part 'fact_entity.g.dart';

@HiveType(typeId: 0)
class FactEntity extends HiveObject {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final DateTime date;

  FactEntity(this.text, this.date);
}
