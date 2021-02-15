import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static String IS_BOARDING_DONE = 'isBoardingDone';
  static String PROFILE_INFO = 'profile_info';
  static String TOKEN = 'token';
  static String IS_TERMS_ACCEPTED = 'IS_TERMS_ACCEPTED';

  static hasKey(String key, SharedPreferences sharedPreferences) async {
    SharedPreferences prefs;
    if (sharedPreferences != null) {
      prefs = sharedPreferences;
    } else
      prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static clearSharedPrefsData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static clearSharedPrefsDataWOOnBoard() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    SharedPrefs.addBoolToSF(
        SharedPrefs.IS_BOARDING_DONE, true);
  }

  static getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  static getStringValuesSF(String key, SharedPreferences sharedPreferences) async {
    SharedPreferences prefs;
    if (sharedPreferences != null) {
      prefs = sharedPreferences;
    } else
      prefs = await SharedPreferences.getInstance();

    //Return String
    String stringValue = prefs.getString(key);
    return stringValue;
  }

  static getBoolValuesSF(String key, SharedPreferences sharedPreferences) async {
    SharedPreferences prefs;
    if (sharedPreferences != null) {
      prefs = sharedPreferences;
    } else
      prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool(key);
    return boolValue;
  }

  static getIntValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt(key);
    return intValue;
  }

  static getDoubleValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double doubleValue = prefs.getDouble(key);
    return doubleValue;
  }

  static addStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static addIntToSF(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static addDoubleToSF(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }
}
