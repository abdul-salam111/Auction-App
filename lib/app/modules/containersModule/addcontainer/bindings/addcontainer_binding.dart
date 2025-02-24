import 'package:get/get.dart';

import '../controllers/addcontainer_controller.dart';

class AddcontainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddcontainerController>(
      () => AddcontainerController(),
    );
  }
}
