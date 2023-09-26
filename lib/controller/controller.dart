// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application/class/network.dart';
import 'package:get/get.dart';

import '../model/data_model.dart';

class MyController extends GetxController {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  var data = <Result>[].obs;
  var pressed = false.obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    print(data.length);
    getData();
  }

  getData() async {
    pressed.value = true;
    var listData = await MyNetwork.getDataList("/r/departments",
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1ODM1MzkxLCJpYXQiOjE2OTU3NDg5OTEsImp0aSI6IjU2ZjQzYWIxYmRiMjRkZjNiNzMxNzEzN2MyMWRmMWQ3IiwidXNlcl9pZCI6Mn0.G1nT6_XsbVfGr1PwwVw1IeJGO5FKMftTSeT8emcc_fE");
    print(listData);
    if (listData != null) {
      data.value = data;
      pressed.value = false;
    }
  }
}
