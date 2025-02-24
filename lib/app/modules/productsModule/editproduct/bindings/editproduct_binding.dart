import 'package:get/get.dart';

import '../controllers/editproduct_controller.dart';

class EditproductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditproductController>(
      () => EditproductController(),
    );
  }
}
