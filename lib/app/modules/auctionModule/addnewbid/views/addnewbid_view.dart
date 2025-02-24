import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addnewbid_controller.dart';

class AddnewbidView extends GetView<AddnewbidController> {
  const AddnewbidView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddnewbidView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddnewbidView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
