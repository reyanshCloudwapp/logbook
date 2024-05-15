
import 'package:get_storage/get_storage.dart';

class SharedPre {
  static final SharedPre _sharedPre = SharedPre._internal();

  factory SharedPre() {
    return _sharedPre;
  }

  SharedPre._internal();

  //shared keys
  static const isLogin = 'isLogin';
  static const username = 'username';

  static Future<void> setValue(String key, dynamic value) async {
    final storage = GetStorage();
    return storage.write(key, value);
  }

  static Future<String> getStringValue(String key) async {
    final storage = GetStorage();
    return storage.read<String>(key) ?? '';
  }

  static getBoolValue(String key, {bool defaultValue = false}) async {
    final storage = GetStorage();
    return storage.read<bool>(key) ?? false;
  }

  static getIntValue(String key, {int defaultValue = -1}) async {
    final storage = GetStorage();
    return storage.read<int>(key) ?? -1;
  }

  static Future<void> clearAll() async {
    return GetStorage().erase();
  }

  /// call this method like this
  ///var data= sp.getObj('key);
  ///Login loginData= Logindata.fromjson(data);
  static Future<Map<String, dynamic>> getObjs(String key) async {
    final prefs = GetStorage();
    return prefs.read(key);
  }
}
