sealed class AppFailure implements Exception {
  const AppFailure(this.message);

  final String message;

  @override
  String toString() => message;
}

final class ValidationFailure extends AppFailure {
  const ValidationFailure({
    required String message,
    this.fieldErrors = const {},
  }) : super(message);

  final Map<String, String> fieldErrors;
}

final class NotFoundFailure extends AppFailure {
  const NotFoundFailure([
    super.message = 'Registro não encontrado.',
  ]);
}

final class CacheFailure extends AppFailure {
  const CacheFailure([
    super.message = 'Não foi possível acessar os dados locais.',
  ]);
}

final class UnknownFailure extends AppFailure {
  const UnknownFailure([
    super.message = 'Ocorreu um erro inesperado. Tente novamente.',
  ]);
}
