// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class MyNetwork {
  static final client = http.Client();

  static Future<DataListModel?> getDataList(
      String endpoint, String token) async {
    var response = await client.get(buildurl(endpoint), headers: {
      "Content-type": "application/json",
      "authorization": "Bearer $token",
    });
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      var dataList = decoded["results"];
      var list = json.encode(dataList);
      print(list);
      return dataListModelFromJson(list);
    }
    return null;
  }

  static Uri buildurl(String endpoint) {
    String host = "https://minaini.com:2053";
    final apipath = host + endpoint;
    return Uri.parse(apipath);
  }
}
