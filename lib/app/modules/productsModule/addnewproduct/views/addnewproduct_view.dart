import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addnewproduct_controller.dart';

class AddnewproductView extends GetView<AddnewproductController> {
  const AddnewproductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddnewproductView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddnewproductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
