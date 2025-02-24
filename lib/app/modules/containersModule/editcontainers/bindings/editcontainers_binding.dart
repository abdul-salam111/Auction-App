import 'package:get/get.dart';

import '../controllers/editcontainers_controller.dart';

class EditcontainersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditcontainersController>(
      () => EditcontainersController(),
    );
  }
}
