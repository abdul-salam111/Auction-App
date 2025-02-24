import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customermanagement_controller.dart';

class CustomermanagementView extends GetView<CustomermanagementController> {
  const CustomermanagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomermanagementView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CustomermanagementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
