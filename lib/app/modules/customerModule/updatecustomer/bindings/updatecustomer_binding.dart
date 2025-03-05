import 'package:get/get.dart';

import '../controllers/updatecustomer_controller.dart';

class UpdatecustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatecustomerController>(
      () => UpdatecustomerController(),
    );
  }
}
