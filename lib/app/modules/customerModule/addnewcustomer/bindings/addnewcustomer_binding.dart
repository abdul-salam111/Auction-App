import 'package:get/get.dart';

import '../controllers/addnewcustomer_controller.dart';

class AddnewcustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddnewcustomerController>(
      () => AddnewcustomerController(),
    );
  }
}
