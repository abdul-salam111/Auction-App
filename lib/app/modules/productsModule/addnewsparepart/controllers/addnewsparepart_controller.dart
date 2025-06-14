import 'dart:io';

import 'package:auction_app/app/data/getModels/get_parts_data.dart';
import 'package:auction_app/app/data/postModels/add_new_sparepart.dart';
import 'package:auction_app/app/repositories/products_repository/products_rep.dart';
import 'package:image_picker/image_picker.dart';

import '../../../modules.dart';

class AddnewsparepartController extends GetxController {
  final partNumberController = TextEditingController();
  final partNamecontroller = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final supplierController = TextEditingController();

  final formKey = GlobalKey<FormState>();
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

  var selectedCategory = "".obs;
  var selectedMake = "".obs;
  var selectedModel = "".obs;
  var selectedCondition = "Select".obs;
  var selectedStatus = "".obs;
  var featuredProduct = "".obs;

  final getAllSparePartsDataModel = GetSparePartsData().obs;
  //get all car data //including models body type etc..
  Future<void> getSparePartsData() async {
    getAllSparePartsDataModel.value =
        await productsRepository.getAllSparePartsData();

    categoriesList.addAll(
      getAllSparePartsDataModel.value.data!
          .map((e) => e.category ?? "")
          .where((e) => e.isNotEmpty)
          .toSet(),
    );

    makeList.addAll(
      getAllSparePartsDataModel.value.data!
          .map((e) => e.make ?? "")
          .where((e) => e.isNotEmpty)
          .toSet(),
    );

    partModels.addAll(
      getAllSparePartsDataModel.value.data!
          .map((e) => e.model ?? "")
          .where((e) => e.isNotEmpty)
          .toSet(),
    );
  }

  ProductsRepository productsRepository = ProductsRepository();
  var isloading = false.obs;
  Future<void> addNewPart() async {
    try {
      isloading.value = true;
      bool isAdded = await productsRepository.addNewPart(
          AddNewPart(
            partId: partNamecontroller.text.toString(),
            name: partNamecontroller.text.toString(),
            category: selectedCategory.value,
            make: selectedMake.value,
            model: selectedModel.value,
            conditionReport: selectedCondition.value,
            status: selectedStatus.value,
            feature: featuredProduct.value,
            price: double.parse(priceController.text),
            supplier: supplierController.text,
            description: descriptionController.text,
            isClear: true,
            reportStatus: "draft",
            fkContainerId: 1,
            fkVehicleId: 1,
            recievedAmount: 0.0,
            balanceAmount: 0.0,
            soldPrice: 0.0,
          ),
          selectedImages);
      isloading.value = false;
      if (isAdded) {
        Get.dialog(
          CustomSuccessDialog(
              title: "Part Added!",
              message: "The Part is Added Successfully!",
              onConfirm: () async {
                Get.back();
                Get.back();
              },
              icon: "assets/icons/done.png"),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSparePartsData();
  }

  final List<String> categoriesList = [];

  List<String> makeList = [];

  final List<String> partModels = [];
}
