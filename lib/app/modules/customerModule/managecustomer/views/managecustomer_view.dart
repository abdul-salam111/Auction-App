import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/managecustomer_controller.dart';

class ManagecustomerView extends GetView<ManagecustomerController> {
  const ManagecustomerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManagecustomerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManagecustomerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
