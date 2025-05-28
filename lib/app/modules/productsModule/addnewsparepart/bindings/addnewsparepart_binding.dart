import 'package:get/get.dart';

import '../controllers/addnewsparepart_controller.dart';

class AddnewsparepartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddnewsparepartController>(
      () => AddnewsparepartController(),
    );
  }
}
