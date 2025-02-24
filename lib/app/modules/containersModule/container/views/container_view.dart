import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/container_controller.dart';

class ContainerView extends GetView<ContainerController> {
  const ContainerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContainerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ContainerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
