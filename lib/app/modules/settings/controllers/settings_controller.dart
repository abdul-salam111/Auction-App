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
    var storedData = box.read(userinformation);

    if (storedData != null) {
      GetUserProfileInfo userProfile = GetUserProfileInfo.fromJson(storedData);
      fullNameController.value.text =
          "${userProfile.profile!.firstname} ${userProfile.profile!.lastname}";
      contactController.value.text =
          userProfile.profile!.phonenumber.toString();
      emailController.value.text = userProfile.profile!.email.toString();
      emiratesIDController.value.text =
          userProfile.profile!.emiratesId.toString();
    }
  }

  final fullNameController = TextEditingController().obs;
  final contactController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final emiratesIDController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
}
