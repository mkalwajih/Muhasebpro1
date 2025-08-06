class ServerException implements Exception {}

class CacheException implements Exception {}

class DataIntegrityException implements Exception {
  final String? message;
  DataIntegrityException({this.message});
}
