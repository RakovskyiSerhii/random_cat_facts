import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  factory Failure.networkConnection() = _NetworkConnection;

  factory Failure.api({int? code, String? message}) = _Api;

  factory Failure.manual(String message) = _Manual;
  factory Failure.fatal() = _Fatal;
}
