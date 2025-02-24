import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/managecontainers_controller.dart';

class ManagecontainersView extends GetView<ManagecontainersController> {
  const ManagecontainersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManagecontainersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManagecontainersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
