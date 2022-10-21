import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_event.freezed.dart';

@freezed
class FactEvent with _$FactEvent {
  factory FactEvent.noConnection() = _NoConnection;

  factory FactEvent.error({String? error}) = _Error;
}
