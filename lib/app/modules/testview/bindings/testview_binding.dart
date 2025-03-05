import 'package:get/get.dart';

import '../controllers/testview_controller.dart';

class TestviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestviewController>(
      () => TestviewController(),
    );
  }
}
