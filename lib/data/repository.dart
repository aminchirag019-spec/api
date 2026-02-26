import 'dart:convert';

import 'package:api_learning/data/api_client.dart';
import 'package:api_learning/models/add_to_cart.dart' hide Products;
import 'package:api_learning/models/delete_cart.dart' hide Products;
import 'package:api_learning/models/get_all_carts.dart' hide Products;
import 'package:api_learning/models/get_product_details.dart';
import 'package:api_learning/models/models.dart';
import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:api_learning/screens/DashboardScreen/dashboard.dart';
import 'package:api_learning/session/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/auth_model.dart';
import '../models/get_products.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository(this.apiClient);

  Future<LoginModel> login({required Map<String, dynamic> body}) async {
    final response = await apiClient.postLogin(
      baseurl: ApiBaseUrl.baseUrl,
      endPoint: ApiEndpoints.login,
      postBody: body,
    );
    LoginModel loginModel = LoginModel.fromJson(response);

    return loginModel;
  }

  Future<ProfileModel> profile() async {
    final token = await SharedPref.getAccessToken();

    if (token == null || token.isEmpty) {
      throw Exception("Token is missing");
    }

    final response = await ApiClient().getProfile(
      baseUrl: ApiBaseUrl.baseUrl,
      endPoint: ApiEndpoints.getProfile,
      token: token,
    );

    print("PROFILE RESPONSE => $response");

    final profileModel = ProfileModel.fromJson(response);
    return profileModel;
  }

  Future<GetProducts> products() async {
    final response = await ApiClient().getProducts(
      baseUrl: ApiBaseUrl.baseUrl,
      endPoint: ApiEndpoints.getProducts,
    );

    return GetProducts.fromJson(response);
  }

  Future<Products> productDetails(int id) async {
    final response = await ApiClient().getProductsDetails(
      baseUrl: ApiBaseUrl.baseUrl,
      endPoint: ApiEndpoints.getProductDetails(id),
    );

    return Products.fromJson(response);
  }

  Future<AddToCart> addToCart({
    required int userId,
    required int productId,
    required int quantity,
  }) async {
    final response = await ApiClient().addToCart(
      baseUrl: ApiBaseUrl.baseUrl,
      endpoint: ApiEndpoints.addToCart,
      body: {
        "userId": userId,
        "products": [
          {"id": productId, "quantity": quantity},
        ],
      },
    );
    return AddToCart.fromJson(response);
  }

  Future<AllCarts> allCarts() async {
    try {
      final response = await ApiClient().allCarts(
        baseUrl: ApiBaseUrl.baseUrl,
        endpoint: ApiEndpoints.allCarts,
      );
      print("RAW RESPONSE: $response");

      return AllCarts.fromJson(response);
    } catch (e) {
      print("PARSE ERROR: $e");
      rethrow;
    }
  }

  Future<DeleteCart> deleteCart(int id) async {
    try {
      final response = await ApiClient().deleteCart(
          baseUrl: ApiBaseUrl.baseUrl,
          endpoint:  "${ApiEndpoints.deleteCart}/$id",
      );
      print("RAW RESPONSE: $response");

      return DeleteCart.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
