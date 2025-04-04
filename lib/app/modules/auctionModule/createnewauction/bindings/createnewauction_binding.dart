import 'package:get/get.dart';

import '../controllers/createnewauction_controller.dart';

class CreatenewauctionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatenewauctionController>(
      () => CreatenewauctionController(),
    );
  }
}
