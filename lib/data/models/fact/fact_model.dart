import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_model.freezed.dart';

@freezed
class FactModel with _$FactModel {
  factory FactModel({
    required String text,
    required DateTime dateTime,
  }) = _FactModel;
}
