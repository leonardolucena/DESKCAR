import 'package:deskcar/core/errors/app_failure.dart';

abstract final class FailureMessageMapper {
  static String message(AppFailure failure) {
    return switch (failure) {
      ValidationFailure(:final fieldErrors) when fieldErrors.isNotEmpty =>
        fieldErrors.values.first,
      final AppFailure failure => failure.message,
    };
  }
}
