import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.properties = const <dynamic>[]]);

  final List<dynamic> properties;

  @override
  List<Object?> get props => [properties];
}

class ServerFailure extends Failure {
  final String? message;
  ServerFailure({this.message}) : super(message != null ? [message] : const []);
}

class CacheFailure extends Failure {
  final String? message;
  CacheFailure({this.message}) : super(message != null ? [message] : const []);
}

class InvalidCredentialsFailure extends Failure {
  InvalidCredentialsFailure({String? message}) : super(message != null ? [message] : const ['Invalid credentials']);
}

class UserInactiveFailure extends Failure {
  UserInactiveFailure({String? message}) : super(message != null ? [message] : const ['User is inactive']);
}

class DataIntegrityFailure extends Failure {
  DataIntegrityFailure({String? message}) : super(message != null ? [message] : const ['Data integrity issue']);
}
