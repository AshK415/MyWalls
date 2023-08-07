import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure implements Exception {
  const Failure._();

  /// Expected value is null or empty
  const factory Failure.empty() = _EmptyFailure;

  /// Represent 401 error
  const factory Failure.unauthorized() = _UnauthorizedFailure;

  /// Represents 400 error
  const factory Failure.badRequest() = _BadRequestFailure;
}
