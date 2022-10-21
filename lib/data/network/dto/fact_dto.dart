import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_dto.freezed.dart';
part 'fact_dto.g.dart';

@freezed
class FactDto with _$FactDto {
  factory FactDto({
    required String fact,
  }) = _FactDto;

  factory FactDto.fromJson(Map<String, dynamic> json) =>
      _$FactDtoFromJson(json);
}
