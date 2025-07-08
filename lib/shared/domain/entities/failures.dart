import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.properties = const <dynamic>[]]);

  final List<dynamic> properties;

  @override
  List<Object?> get props => [properties];
}

class ServerFailure extends Failure {
  final String? message;
  // Removed const from constructor because message is not always const.
  ServerFailure({this.message}) : super(message != null ? [message] : const []);
}

class CacheFailure extends Failure {
  final String? message;
  // Removed const from constructor because message is not always const.
  CacheFailure({this.message}) : super(message != null ? [message] : const []);
}
