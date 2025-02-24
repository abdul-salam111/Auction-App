import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/editproduct_controller.dart';

class EditproductView extends GetView<EditproductController> {
  const EditproductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditproductView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditproductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
