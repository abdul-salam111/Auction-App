import 'package:get/get.dart';

import '../controllers/managecustomer_controller.dart';

class ManagecustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagecustomerController>(
      () => ManagecustomerController(),
    );
  }
}
