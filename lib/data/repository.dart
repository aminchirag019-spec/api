
import 'dart:convert';

import 'package:api_learning/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthRepository {

  Future<bool> login(Map<String,dynamic> body) async{
    final response = await http.post(
      Uri.parse("https://dummyjson.com/auth/login"),
      body: body);
  if (response.statusCode == 200) {
   Text("success");
   return true;
  }else {
    throw Exception("Login Failed");
  }

  }
}