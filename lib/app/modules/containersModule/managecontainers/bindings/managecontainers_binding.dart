import 'package:get/get.dart';

import '../controllers/managecontainers_controller.dart';

class ManagecontainersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagecontainersController>(
      () => ManagecontainersController(),
    );
  }
}
