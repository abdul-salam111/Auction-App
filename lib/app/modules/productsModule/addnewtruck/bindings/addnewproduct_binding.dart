import 'package:get/get.dart';

import '../controllers/addnewproduct_controller.dart';

class AddnewproductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddnewproductController>(
      () => AddnewproductController(),
    );
  }
}
