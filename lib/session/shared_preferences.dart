
import 'dart:convert';

import 'package:api_learning/models/models.dart';
import 'package:api_learning/session/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_model.dart';

class SharedPref{

  static Future<void> saveLoginModel(LoginModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      PrefKeys.loginModel,
      jsonEncode(model.toJson()),
    );
  }


  static Future<LoginModel?> getLoginModel () async {
    final prefs = await SharedPreferences.getInstance();
    final data =prefs.getString(PrefKeys.loginModel);

    if (data == null) return null;
    return LoginModel.fromJson(jsonDecode(data));
}

static Future<void> clearLogin () async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(PrefKeys.loginModel);
    await prefs.remove(PrefKeys.isLoggedIn);
}

static Future<String?> getAccessToken() async {
    final model = await getLoginModel();
    return model?.accessToken;
}

static Future<String?> getUserName() async {
    final model = await getLoginModel();
    return model?.username;
}
}