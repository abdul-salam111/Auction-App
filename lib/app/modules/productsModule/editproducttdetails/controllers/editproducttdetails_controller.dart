import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../modules.dart';

class EditproducttdetailsController extends GetxController {
  var selectedStatus = "In-stock".obs;

  final List<String> statusOptions = [
    'In-stock',
    'Out of stock',
    'Coming soon',
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
  final colorController = TextEditingController();
}
