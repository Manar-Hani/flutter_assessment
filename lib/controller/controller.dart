import 'package:flutter/material.dart';
import 'package:flutter_application/class/network.dart';
import 'package:get/get.dart';

import '../model/data_model.dart';

class MyController extends GetxController {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  var data = <DataListModel>[].obs;
  var pressed = false.obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    pressed.value = true;
    var response = await MyNetwork.get("/r/departments",
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1ODI5NDI2LCJpYXQiOjE2OTU3NDMwMjYsImp0aSI6IjI4Yzk1YTYwOGE2MzQwYjZhMzE4ZWJiNGY");
    // ignore: avoid_print
    print(response);
    if (response != null) {
      pressed.value = false;
    }
  }
}
