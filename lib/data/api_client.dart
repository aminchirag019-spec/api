

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  http.Client? httpClient = http.Client();

  Future<dynamic> postLogin({required String baseurl,required String endPoint,required Map<String,dynamic> postBody}) async{
    dynamic getResponse;
    String getUrl;

      getUrl = "$baseurl$endPoint";

      try {
        var response =await httpClient?.post(Uri.parse(getUrl),body: jsonEncode(postBody),
        headers: {
          "content-type" : "application/json",
        });
        getResponse =await apiResponse(response!);
        return getResponse;
      }
      on SocketException {
        throw FetchDataException("no internet");
    }

  }

  Future<dynamic> getProfile({required String baseUrl,required String endPoint,required String token}) async {
    dynamic getResponse;
    String  getUrl = "$baseUrl$endPoint";
    print("token in getProfile Method$token");
    print("getProfile Url $getUrl");

    try{
      var response =await httpClient?.get(Uri.parse(getUrl), headers: {
        "Content-Type": "application/json",
        "Authorization":token
      },);
      getResponse = await apiResponse(response!);
      print("Printed Profile  Body ::::$getResponse");
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return getResponse;
  }

  Future<dynamic> getProducts({ required String baseUrl , required String endPoint})
  async {
    String  getUrl = "$baseUrl$endPoint";
    print("PRODUCT URL => $getUrl");
    try {
      final response = await httpClient?.get(Uri.parse(getUrl),
        headers: {
          "Content-Type": "application/json",
        },
    );
      return await apiResponse(response!);
    }on SocketException {
      throw FetchDataException("No internet");
    }
  }

  Future<dynamic> getProductsDetails ({required String baseUrl,required String endPoint})
  async {
    String  getUrl = "$baseUrl$endPoint";

    try {
      final response = await httpClient?.get(Uri.parse(getUrl),
      headers:  {
        "Content-Type":"application/json",
      },
      );
      return await apiResponse(response!);
    }
    on FetchDataException {
      throw FetchDataException("No internet");
    }

  }


  Future<dynamic> addToCart ({required String baseUrl, required String endpoint,required Map<String,dynamic> body})
  async {
    String getUrl = "$baseUrl$endpoint";
    try {
      final response = await http.post(Uri.parse(getUrl),
          headers: {
            "Content-Type":"application/json",
          },
          body: jsonEncode(body)
      );
      return await apiResponse(response);
    }
    on FetchDataException {
      throw FetchDataException("NO InterNet");
    }

  }

  Future<dynamic> allCarts ({required String baseUrl, required String endpoint,})
  async {
    String getUrl = "$baseUrl$endpoint";
    try {
      final response = await http.get(Uri.parse(getUrl),
      headers: {
        "Content-Type":"application/json",
      },
      );
      return await apiResponse(response);
    } on FetchDataException {
      throw FetchDataException("NO InterNet");
    }
  }


  Future<dynamic> deleteCart ({required String baseUrl, required String endpoint})
  async {
    String getUrl = "$baseUrl$endpoint";
    try {
      final response = await http.delete(Uri.parse(getUrl),
      headers: {
        "Content-Type":"application/json",
      }
      );
      return await apiResponse(response);
    } catch (e) {
      throw FetchDataException("not deleted");
    }
  }
 }

Future<dynamic> apiResponse(http.Response response) async{
  dynamic responseJson;
  String? message;

  try {
    responseJson=response.body.isNotEmpty?json.decode(response.body) : null;
    if(responseJson is Map<String,dynamic>) {
      message= (responseJson['message'] ?? responseJson["data"] ?? "something went wrong").toString();
    }
    else {
      message="something went wrong";
    }
  }
  on FormatException {
    throw FetchDataException(
        "Unable to process the server response. (Invalid format or unexpected content)");
  }
  catch (e) {
   throw FetchDataException(e.toString());
  }

  switch (response.statusCode) {
    case 200:
       print("200 Success");
       return responseJson ?? {};

    case 400:
      Fluttertoast.showToast(msg: "Invalid Credentials...");
      throw ServerValidationError(message);

    case 401:
      print("APi error 401");
      throw UnAuthorizedException(message);
    case 201:
      return jsonDecode(response.body);

    case 404:
      Fluttertoast.showToast(msg: "API ERROR [404]");
      throw DoesNotExistException(message);

    case 422:
      Fluttertoast.showToast(msg: "API ERROR [422]");
      throw ServerValidationError(message);

    case 500:
      Fluttertoast.showToast(msg: "API ERROR [500]");
      throw FetchDataException(message);

      case 503:
     Fluttertoast.showToast(msg: "API ERROR [503]");
  throw UnderMaintenanceError(message);

  default:
  Fluttertoast.showToast(
  msg: "API ERROR [${response.statusCode.toString()}]");
  throw FetchDataException(
  message,
  );
  }
}


class CustomException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  CustomException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix:$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message, "");
}

class UnAuthorizedException extends CustomException {
  UnAuthorizedException([String? message]) : super(message, "");
}

class DoesNotExistException extends CustomException {
  DoesNotExistException([String? message]) : super(message, "");
}

class ServerValidationError extends CustomException {
  ServerValidationError([String? message]) : super(message, "");
}

class UnderMaintenanceError extends CustomException {
  UnderMaintenanceError([String? message]) : super(message, "");
}
