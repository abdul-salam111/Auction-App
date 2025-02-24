import 'package:get/get.dart';

import '../controllers/auctionreport_vehicles_controller.dart';

class AuctionreportVehiclesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuctionreportVehiclesController>(
      () => AuctionreportVehiclesController(),
    );
  }
}
