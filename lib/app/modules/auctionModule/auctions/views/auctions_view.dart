import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auctions_controller.dart';

class AuctionsView extends GetView<AuctionsController> {
  const AuctionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuctionsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuctionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
