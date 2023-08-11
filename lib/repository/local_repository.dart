import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  static LocalRepository? _instance;
  static SharedPreferences? _preferences;

  LocalRepository._internal();

  static Future<LocalRepository> get instance async {
    _instance ??= LocalRepository._internal();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  setRoundUpValue(int amount) {
    return _preferences!.setInt(SharedPrefKeys.roundUpValue, amount);
  }

  getRoundUpValue() {
    var amount = (_preferences!.getInt(SharedPrefKeys.roundUpValue) ?? 10);
    return amount;
  }

  setUserId(String userId) {
    return _preferences!.setString(SharedPrefKeys.userId, userId);
  }

  getUserId() {
    var userId = (_preferences!.getString(SharedPrefKeys.userId) ?? "");
    return userId;
  }
}

/// Add keys which will be used in
class SharedPrefKeys {
  SharedPrefKeys._();
  static const String roundUpValue = "roundUpValue";
  static const String userId = "userId";
}
