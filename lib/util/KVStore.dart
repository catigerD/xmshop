import 'package:shared_preferences/shared_preferences.dart';

abstract class KVValue {
  String toKVString();
}

typedef KVValueParser = KVValue Function(String kvString);

class KVStore {
  static Future<bool> put<T>(String key, T value) async {
    final sp = await SharedPreferences.getInstance();
    if (value is bool) {
      return await sp.setBool(key, value);
    }
    if (value is int) {
      return await sp.setInt(key, value);
    }
    if (value is double) {
      return await sp.setDouble(key, value);
    }
    if (value is String) {
      return await sp.setString(key, value);
    }
    if (value is List<String>) {
      return await sp.setStringList(key, value);
    }

    throw UnsupportedError("不支持的数据类型");
  }

  static Future<bool> putObj(String key, KVValue? value) async {
    final sp = await SharedPreferences.getInstance();
    if (value == null) {
      return await sp.remove(key);
    }
    return await sp.setString(key, value.toKVString());
  }

  static Future<KVValue?> getObj(
      String key, KVValue? defaultValue, KVValueParser parser) async {
    final sp = await SharedPreferences.getInstance();
    final kvString = await sp.getString(key);
    if (kvString == null) {
      return defaultValue;
    }

    return parser.call(kvString);
  }

  static Future<T?> get<T>(String key, T? defaultValue) async {
    final sp = await SharedPreferences.getInstance();
    if (T == bool) {
      return (sp.getBool(key) ?? defaultValue ?? false) as T;
    }
    if (T == int) {
      return (sp.getInt(key) ?? defaultValue ?? 0) as T;
    }
    if (T == double) {
      return (sp.getDouble(key) ?? defaultValue ?? 0.0) as T;
    }
    if (T == String) {
      (sp.getString(key) ?? defaultValue) as T?;
    }
    if (T == List<String>) {
      return (sp.getStringList(key) ?? defaultValue) as T?;
    }

    throw UnsupportedError("不支持的数据类型");
  }

  static Future<bool> clear(String key) async {
    final sp = await SharedPreferences.getInstance();
    return await sp.remove(key);
  }

  static Future<bool> clearAll() async {
    final sp = await SharedPreferences.getInstance();
    return await sp.clear();
  }
}
