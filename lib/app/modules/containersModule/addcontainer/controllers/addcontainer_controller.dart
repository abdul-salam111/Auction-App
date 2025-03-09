import 'dart:io';

import 'package:auction_app/app/modules/modules.dart';
import 'package:image_picker/image_picker.dart';

class AddcontainerController extends GetxController {
  final shipperNameController = TextEditingController().obs;
  final shippingCompanyController = TextEditingController().obs;
  final bLNumberController = TextEditingController().obs;
  final containerNumberController = TextEditingController().obs;
  final sealNumberController = TextEditingController().obs;
  final grossWeightController = TextEditingController().obs;
  final portOfLoadingController = TextEditingController().obs;
  final portOfDischargeController = TextEditingController().obs;
  final numberOfUnitsController = TextEditingController().obs;

  var selectedStatus = "Arrived".obs;

  final ImagePicker _picker = ImagePicker();
  var selectedImages = <File>[].obs;

  // Pick images from gallery
  Future<void> pickImagesFromGallery() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null) {
      selectedImages.addAll(pickedFiles.map((e) => File(e.path)));
    }
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
}
