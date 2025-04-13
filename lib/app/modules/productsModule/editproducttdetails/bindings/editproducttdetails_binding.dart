import 'package:get/get.dart';

import '../controllers/editproducttdetails_controller.dart';

class EditproducttdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditproducttdetailsController>(
      () => EditproducttdetailsController(),
    );
  }
}
