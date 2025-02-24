import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/editcontainers_controller.dart';

class EditcontainersView extends GetView<EditcontainersController> {
  const EditcontainersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditcontainersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditcontainersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
