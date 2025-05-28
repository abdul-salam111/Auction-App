import 'package:auction_app/app/data/postModels/update_status.dart';
import 'package:auction_app/app/repositories/products_repository/products_rep.dart';

import '../../../modules.dart';

class EditproductController extends GetxController {
  final soldPriceController = TextEditingController().obs;
  final recievedPriceController = TextEditingController().obs;
  final remainingPriceController = TextEditingController().obs;
  late String chasisnumber;
  late String partId;

  //form key
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    soldPriceController.value.text = Get.arguments[0];
    recievedPriceController.value.text = Get.arguments[1];
    remainingPriceController.value.text = Get.arguments[2];
    chasisnumber = Get.arguments[3];
    productClassification.value = Get.arguments[4];
    partId = Get.arguments[5];
  }

  var productClassification = "".obs;
  ProductsRepository productsRepository = ProductsRepository();
  var isloading = false.obs;
  Future updateProductStatus() async {
    try {
      isloading.value = true;
  
      bool isTrue = await productsRepository.updateProductStatus(
        updateStatus: UpdateStatus(
          partId: (productClassification.value != "vehicle" &&
                  productClassification.value != "truck")
              ? partId
              : "",
          chassisNo: (productClassification.value == "vehicle" ||
                  productClassification.value == "truck")
              ? chasisnumber
              : "",
          recievedAmount: double.parse(recievedPriceController.value.text),
          balanceAmount: double.parse(remainingPriceController.value.text),
          soldPrice: double.parse(soldPriceController.value.text),
          status: "Outofstock",
        ),
      );
      if (isTrue) {
        Get.dialog(CustomSuccessDialog(
            title: "Updated",
            message: "Updated Successfully",
            onConfirm: () {
              Get.back();
              Get.back();
            },
            icon: "assets/icons/done.png"));
      }

      isloading.value = false;
    } catch (e) {
      isloading.value = false;
      throw Exception(e);
    }
  }
}
