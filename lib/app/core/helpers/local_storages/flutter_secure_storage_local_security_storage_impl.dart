import 'package:cuidapet_mobile/app/core/helpers/local_storages/local_security_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageLocalSecurityStorageImpl
    implements LocalSecurityStorage {
  FlutterSecureStorage get _instance => FlutterSecureStorage();
  @override
  Future<void> clean() => _instance.deleteAll();

  @override
  Future<bool> contains(String key) => _instance.containsKey(key: key);

  @override
  Future<String?> read(String key) => _instance.read(key: key);

  @override
  Future<void> remove(String key) => _instance.delete(key: key);

  @override
  Future<void> write(String key, String value) =>
      _instance.write(key: key, value: value);
}
