import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addnewcustomer_controller.dart';

class AddnewcustomerView extends GetView<AddnewcustomerController> {
  const AddnewcustomerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddnewcustomerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddnewcustomerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
