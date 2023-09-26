import 'package:flutter/material.dart';
import 'package:flutter_application/controller/controller.dart';
import 'package:get/get.dart';

class MyData extends GetView<MyController> {
  const MyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyController myController = Get.put(MyController());
    return Scaffold(
      body: Obx(() => myController.pressed.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myController.data.length,
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomLeft: Radius.circular(24)),
                        child: Image.network(
                          myController.data[index].results[index].image
                              .toString(),
                          fit: BoxFit.cover,
                          width: 143,
                          height: 134,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(myController.data[index].results[index].id
                          .toString()),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(myController.data[index].results[index].name),
                    ],
                  )))),
    );
  }
}
