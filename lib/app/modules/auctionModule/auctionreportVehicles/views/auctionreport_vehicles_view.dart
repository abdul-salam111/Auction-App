import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auctionreport_vehicles_controller.dart';

class AuctionreportVehiclesView
    extends GetView<AuctionreportVehiclesController> {
  const AuctionreportVehiclesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuctionreportVehiclesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuctionreportVehiclesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
