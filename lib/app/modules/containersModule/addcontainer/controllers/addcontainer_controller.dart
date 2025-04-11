import 'dart:io';

import 'package:auction_app/app/data/postModels/add_new_container.dart';
import 'package:auction_app/app/modules/modules.dart';
import 'package:image_picker/image_picker.dart';

class AddcontainerController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final shipperNameController = TextEditingController().obs;
  final shippingCompanyController = TextEditingController().obs;
  final bLNumberController = TextEditingController().obs;
  final containerNumberController = TextEditingController().obs;
  final sealNumberController = TextEditingController().obs;
  final grossWeightController = TextEditingController().obs;
  final portOfLoadingController = TextEditingController().obs;
  final portOfDischargeController = TextEditingController().obs;
  final numberOfUnitsController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;

  var selectedStatus = "Arrived".obs;

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

  final FocusNode formFocusNode = FocusNode();

  var selectedItemType = ''.obs;
  final itemsInContainer = AddNewContainer().obs;
  var isContainerUploading = false.obs;
  final manageContinercontroller = Get.put(ManagecontainersController());
  final containerRepo = ContainerRepository();
  Future createNewContainer() async {
    try {
      isContainerUploading.value = true;
      bool isTrue = await containerRepo.addNewContainer(AddNewContainer(
        shipper: shipperNameController.value.text.toString(),
        shippingCompany: shippingCompanyController.value.text.toString(),
        blNumber: bLNumberController.value.text.toString(),
        containerNumber: containerNumberController.value.text.toString(),
        sealNumber: sealNumberController.value.text.toString(),
        grossWeight: grossWeightController.value.text.toString(),
        portOfDischarge: portOfDischargeController.value.text.toString(),
        portOfLoading: portOfLoadingController.value.text.toString(),
        vehicles: itemsInContainer.value.vehicles,
        status: selectedStatus.value,
        parts: itemsInContainer.value.parts,
        noOfUnits: numberOfUnitsController.value.text.toString(),
        images: selectedImages.map((e) => e.path).toList(),
        description: descriptionController.value.text.toString(),
      ));
      if (isTrue) {
        Get.dialog(CustomSuccessDialog(
          title: 'Container Added',
          message: "New Container has been successfully added.",
          onConfirm: () {
            Get.back();
          },
          icon: "assets/icons/done.png",
        ));
        isContainerUploading.value = false;

        await manageContinercontroller.getAllContainers();
        shipperNameController.value.clear();
        shippingCompanyController.value.clear();
        bLNumberController.value.clear();
        containerNumberController.value.clear();
        sealNumberController.value.clear();
        grossWeightController.value.clear();
        portOfDischargeController.value.clear();
        portOfLoadingController.value.clear();
        descriptionController.value.clear();

        selectedImages.clear();

        itemsInContainer.value.parts?.clear();
        itemsInContainer.value.vehicles?.clear();
      }
      isContainerUploading.value = false;
    } catch (e) {
      print(e);
      isContainerUploading.value = false;
    }
  }

  @override
  void onClose() {
    shipperNameController.value.dispose();
    shippingCompanyController.value.dispose();
    bLNumberController.value.dispose();
    containerNumberController.value.dispose();
    sealNumberController.value.dispose();
    grossWeightController.value.dispose();
    portOfLoadingController.value.dispose();
    portOfDischargeController.value.dispose();
    numberOfUnitsController.value.dispose();
    descriptionController.value.dispose();
    formFocusNode.dispose();
    selectedImages.clear();
    itemsInContainer.value.parts?.clear();
    itemsInContainer.value.vehicles?.clear();
    selectedStatus.value = "Arrived";
    selectedItemType.value = '';
    itemsInContainer.value = AddNewContainer();
    isContainerUploading.value = false;
    selectedImages.clear();
    super.onClose();
  }
}
