import 'package:get/get.dart';

import '../controllers/addnewbid_controller.dart';

class AddnewbidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddnewbidController>(
      () => AddnewbidController(),
    );
  }
}
