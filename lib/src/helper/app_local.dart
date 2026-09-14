import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppLocal {
  static FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<void> saveDataLocal({
    required String key,
    required String value,
  }) async {
    await storage.write(key: key, value: value);
  }

  static Future<String> readDataLocal({required String key}) async {
    return await storage.read(key: key) ?? "";
  }

  static Future<void> deleteDataLocal({required String key}) async {
    await storage.delete(key: key);
  }
}
