class ServerException implements Exception {}

class CacheException implements Exception {
  final String? message;
  CacheException({this.message});
}

class DataIntegrityException implements Exception {
  final String? message;
  DataIntegrityException({this.message});
}

class NotFoundException implements Exception {
  final String? message;
  NotFoundException({this.message});
}

class DuplicateEntryException implements Exception {
  final String? message;
  DuplicateEntryException({this.message});
}