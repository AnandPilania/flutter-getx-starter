import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'HomeView is working ${controller.count.value}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
