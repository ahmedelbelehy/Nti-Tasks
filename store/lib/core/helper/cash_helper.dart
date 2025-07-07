import 'package:shared_preferences/shared_preferences.dart';

class CashSharedHelper {
  SharedPreferences? sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveData({required String key, required String value}) async {
    return await sharedPreferences?.setString(key, value);
  }

  getData({required String key}) {
    return sharedPreferences?.getString(key);
  }
}