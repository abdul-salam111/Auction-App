import 'package:get/get.dart';

import '../controllers/container_controller.dart';

class ContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContainerController>(
      () => ContainerController(),
    );
  }
}
