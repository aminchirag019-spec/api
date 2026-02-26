
import 'dart:convert';

import 'package:api_learning/models/add_to_cart.dart';
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

  static Future<void> saveCart(int userId, List<AddToCart> cart) async {
    final prefs = await SharedPreferences.getInstance();

    final cartJson = cart.map((e) => e.toJson()).toList();

    await prefs.setString(
      "cart_$userId",
      jsonEncode(cartJson),
    );
  }

  // 🔹 Load Cart (per user)
  static Future<List<AddToCart>> loadCart(int userId) async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString("cart_$userId");

    if (data == null) return [];

    final decoded = jsonDecode(data);

    return (decoded as List)
        .map((e) => AddToCart.fromJson(e))
        .toList();
  }

  // 🔹 Clear Cart (on logout if needed)
  static Future<void> clearCart(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("cart_$userId");
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