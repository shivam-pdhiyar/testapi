import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'apiconstant.dart';

class HttpHandler {
  static String endPointUrl = APIEndPoints.endPoint;

  static Future<Map<String, String>> getHeaders() async {
    final String? token = pref!.getString("token");

    if (token != null) {
      debugPrint("Token -- '$token'");
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      };
    } else {
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  static Future<Map<String, dynamic>> getHttpMethod({@required String? url, headers}) async {
    var header = await getHeaders();
    debugPrint("Get URL -- '$endPointUrl$url'");
    debugPrint("Get Data -- 'null'");
    debugPrint("Get Header -- '$header'");
    http.Response response = await http.get(
      Uri.parse("$endPointUrl$url"),
      headers: headers ?? header,
    );
    debugPrint("Get Response Code -- '${response.statusCode}'");
    debugPrint("Get Response -- '${response.body}'");
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint("In Get '${response.statusCode}'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else {
      debugPrint("In Get 'else - ${response.statusCode}'");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }

  static Future<Map<String, dynamic>> postHttpMethod({@required String? url, Map<String, dynamic>? data}) async {
    var header = await getHeaders();
    debugPrint("Post URL -- '$endPointUrl$url'");
    debugPrint("Post Data -- '$data'");
    debugPrint("Post Header -- '$header'");
    http.Response response = await http.post(
      Uri.parse("$endPointUrl$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    debugPrint("Post Response Code -- '${response.statusCode}'");
    debugPrint("Post Response -- '${response.body}'");
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
    }  else {
      debugPrint("In Post 'else - ${response.statusCode}'");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }

  static Future<Map<String, dynamic>> patchHttpMethod({@required String? url, Map<String, dynamic>? data}) async {
    var header = await getHeaders();
    debugPrint("Patch URL -- '$endPointUrl$url'");
    debugPrint("Patch Data -- '$data'");
    debugPrint("Patch Header -- '$header'");
    http.Response response = await http.patch(
      Uri.parse("$endPointUrl$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    debugPrint("Patch Response Code -- '${response.statusCode}'");
    debugPrint("Patch Response -- '${response.body}'");
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint("In Patch '${response.statusCode}'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else {
      debugPrint("In Patch 'else - ${response.statusCode}'");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }

  static Future<Map<String, dynamic>> putHttpMethod({@required String? url, Map<String, dynamic>? data}) async {
    var header = await getHeaders();
    debugPrint("Put URL -- '$endPointUrl$url'");
    debugPrint("Put Data -- '$data'");
    debugPrint("Put Header -- '$header'");
    http.Response response = await http.put(
      Uri.parse("$endPointUrl$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    debugPrint("PUT Response code -- '${response.statusCode}'");
    debugPrint("PUT Response -- '${response.body}'");
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint("In Put '${response.statusCode}'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else {
      debugPrint("In Put 'else - ${response.statusCode}'");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }

  static Future<Map<String, dynamic>> deleteHttpMethod({@required String? url}) async {
    var header = await getHeaders();
    debugPrint("Delete URL -- '$endPointUrl$url'");
    debugPrint("Delete Data -- 'null'");
    debugPrint("Delete Header -- '$header'");
    http.Response response = await http.delete(
      Uri.parse("$endPointUrl$url"),
      headers: header,
    );
    debugPrint("Delete Response Code -- '${response.statusCode}'");
    debugPrint("Delete Response -- '${response.body}'");
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint("In Delete '${response.statusCode}'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    }  else {
      debugPrint("In Delete 'else - ${response.statusCode}'");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }
}
