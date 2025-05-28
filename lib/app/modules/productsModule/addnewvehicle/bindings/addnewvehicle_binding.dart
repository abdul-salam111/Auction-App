import 'package:get/get.dart';

import '../controllers/addnewvehicle_controller.dart';

class AddnewvehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddnewvehicleController>(
      () => AddnewvehicleController(),
    );
  }
}
