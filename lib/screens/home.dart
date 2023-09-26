// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application/screens/data.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            child: TextButton(
                onPressed: () {
                  Get.to(MyData());
                },
                child: Text(
                  "Get Data",
                  style: TextStyle(fontSize: 30),
                )),
          ),
        ),
      ),
    );
  }
}
