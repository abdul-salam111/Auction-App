import 'package:get/get.dart';

import '../controllers/customermanagement_controller.dart';

class CustomermanagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomermanagementController>(
      () => CustomermanagementController(),
    );
  }
}
