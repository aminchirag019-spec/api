

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  http.Client? httpClient = http.Client();

  Future<dynamic> postLogin({required String baseurl,required String endPoint,required Map<String,dynamic> postBody}) async{
    dynamic getResponse;
    String getUrl;

      getUrl = "$baseurl$endPoint";

      try {
        var response =await httpClient?.post(Uri.parse(baseurl),body: jsonEncode(postBody),
        headers: {
          "content-type" : "application/json",
        });
        getResponse =await apiResponse(response!);
      }

  }
}