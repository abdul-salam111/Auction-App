import '../../modules.dart';

class ChangepasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final currentPasswordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    currentPasswordController.value.dispose();
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
  }
}
