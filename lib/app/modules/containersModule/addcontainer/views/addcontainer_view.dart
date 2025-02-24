import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addcontainer_controller.dart';

class AddcontainerView extends GetView<AddcontainerController> {
  const AddcontainerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddcontainerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddcontainerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
