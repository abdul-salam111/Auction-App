import '../../modules.dart';

class SettingsController extends GetxController {
  var isFingerprintEnabled = false.obs;

  void toggleFingerprint(bool value) {
    isFingerprintEnabled.value = value;
    box.write(enableFingerPrint, isFingerprintEnabled.value);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isFingerprintEnabled.value =
        (box.read(enableFingerPrint) != null && box.read(enableFingerPrint));
  }

  final fullNameController = TextEditingController().obs;
  final contactController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final emiratesIDController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

}
