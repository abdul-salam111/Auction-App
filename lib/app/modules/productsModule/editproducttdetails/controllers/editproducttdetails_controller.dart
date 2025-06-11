import 'dart:io';

import 'package:auction_app/app/data/postModels/update_part_model.dart';
import 'package:auction_app/app/data/postModels/update_vehicle.dart';
import 'package:auction_app/app/repositories/products_repository/products_rep.dart';
import 'package:image_picker/image_picker.dart';

import '../../../modules.dart';

class EditproducttdetailsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    itemIdController.text = Get.arguments[0];
    chassisnumberController.text = Get.arguments[1];
    itemnameController.text = Get.arguments[2];
    modelController.text = Get.arguments[3];
    totalpriceController.text = Get.arguments[4];
    colorController.text = Get.arguments[5];
    makeController.text = Get.arguments[6];
    yearController.text = Get.arguments[7];
    fueltypeController.text = Get.arguments[8];
    transmissionController.text = Get.arguments[9];
    conditionController.text = Get.arguments[10];
    mileageController.text = Get.arguments[11];
    soldPriceController.text = Get.arguments[12];
    selectedStatus.value = Get.arguments[13];
    descriptionController.text = Get.arguments[14];
    recievedAmountController.text = Get.arguments[15];
    balanceAmountController.text = Get.arguments[16];
    classificationType = Get.arguments[17];
    categoryController.text = Get.arguments[18];
  }

  var selectedStatus = "Instock".obs;

  final List<String> statusOptions = [
    'Instock',
    'Outofstock',
    'Intransit',
  ];

  final ImagePicker _picker = ImagePicker();
  var selectedImages = <File>[].obs;

  // Pick images from gallery
  Future<void> pickImagesFromGallery() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();
    selectedImages.addAll(pickedFiles.map((e) => File(e.path)));
  }

  // Pick image from camera
  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImages.add(File(pickedFile.path));
    }
  }

  // Remove image from the list
  void removeImage(int index) {
    selectedImages.removeAt(index);
  }

  //form key
  final formKey = GlobalKey<FormState>();
  final itemIdController = TextEditingController();
  final chassisnumberController = TextEditingController();
  final itemnameController = TextEditingController();
  final modelController = TextEditingController();
  final totalpriceController = TextEditingController();
  final colorController = TextEditingController();
  final makeController = TextEditingController();
  final yearController = TextEditingController();
  final fueltypeController = TextEditingController();
  final transmissionController = TextEditingController();
  final conditionController = TextEditingController();
  final mileageController = TextEditingController();
  final soldPriceController = TextEditingController();
  final statusController = TextEditingController();
  final descriptionController = TextEditingController();
  final recievedAmountController = TextEditingController();
  final balanceAmountController = TextEditingController();
  final categoryController = TextEditingController();

  var classificationType = "";

  ProductsRepository productsRepository = ProductsRepository();

  var isLoading = false.obs;
  Future updateCarDetails() async {
    try {
      isLoading.value = true;
      bool isTrue = await productsRepository.updateCar(
          selectedImages,
          itemIdController.text,
          UpdateVehicleModel(
            chassisNumber: chassisnumberController.text,
            name: itemnameController.text,
            color: colorController.text,
            make: makeController.text,
            model: modelController.text,
            year: yearController.text,
            fuel: fueltypeController.text,
            status: selectedStatus.value,
            transmission: transmissionController.text,
            condition: conditionController.text,
            price: totalpriceController.text,
            mileage: mileageController.text,
            description: descriptionController.text,
            totalPrice: totalpriceController.text,
            recievedAmount: recievedAmountController.text,
            balanceAmount: balanceAmountController.text,
            soldPrice: soldPriceController.text,
          ));
      if (isTrue) {
        Get.dialog(CustomSuccessDialog(
            title: "Updated",
            message: "Car Updated Successfully",
            onConfirm: () {
              Get.back();
              Get.back();
            },
            icon: "assets/icons/done.png"));
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }

  Future updateTruck() async {
    try {
      isLoading.value = true;
      bool isTrue = await productsRepository.updateTruck(
          selectedImages,
          itemIdController.text,
          UpdateVehicleModel(
            status: selectedStatus.value,
            chassisNumber: chassisnumberController.text,
            name: itemnameController.text,
            color: colorController.text,
            make: makeController.text,
            model: modelController.text,
            year: yearController.text,
            fuel: fueltypeController.text,
            transmission: transmissionController.text,
            condition: conditionController.text,
            price: totalpriceController.text,
            mileage: mileageController.text,
            description: descriptionController.text,
            totalPrice: totalpriceController.text,
            recievedAmount: recievedAmountController.text,
            balanceAmount: balanceAmountController.text,
            soldPrice: soldPriceController.text,
          ));
      if (isTrue) {
        Get.dialog(CustomSuccessDialog(
            title: "Updated",
            message: "Truck Updated Successfully",
            onConfirm: () {
              Get.back();
              Get.back();
            },
            icon: "assets/icons/done.png"));
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }

  Future updatePart() async {
    try {
      isLoading.value = true;

      bool isTrue = await productsRepository.updatePart(
          selectedImages,
          itemIdController.text,
          UpdatePartModel(
            status: selectedStatus.value,
            category: categoryController.text.toString(),
            partId: itemIdController.text.toString(),
            name: itemnameController.text,
            make: makeController.text,
            model: modelController.text,
            condition: conditionController.text,
            price: totalpriceController.text,
            
          ));
      if (isTrue) {
        Get.dialog(CustomSuccessDialog(
            title: "Updated",
            message: "Part Updated Successfully",
            onConfirm: () {
              Get.back();
              Get.back();
            },
            icon: "assets/icons/done.png"));
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }
}
