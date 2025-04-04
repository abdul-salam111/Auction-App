import 'package:get/get.dart';

import '../controllers/additems_tocontainer_scanner_controller.dart';

class AdditemsTocontainerScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdditemsTocontainerScannerController>(
      () => AdditemsTocontainerScannerController(),
    );
  }
}
