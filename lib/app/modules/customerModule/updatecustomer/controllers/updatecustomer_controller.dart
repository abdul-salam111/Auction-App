import 'package:auction_app/app/modules/modules.dart';

class UpdatecustomerController extends GetxController {
  late UserData userData;
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final contactNumberController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final emairatesIDController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  var status = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isloading = false.obs;
  CustomersRepository customersRepository = CustomersRepository();
  final managecustomerController = Get.put(ManagecustomerController());
  final customerManagement = Get.put(CustomermanagementController());

  Future<void> updateCustomerByAdmin() async {
    try {
      isloading.value = true;
      await customersRepository.updateCustomerByAdmin(
          UpdateCustomerByAdmin(
            firstname: firstNameController.value.text.trim(),
            lastname: lastNameController.value.text.trim(),
            address: addressController.value.text.trim(),
            email: emailController.value.text.trim(),
            mfaEnabled: userData.mfaEnabled.toString(),
            status: status.value.toString(),
            mobilenumber: contactNumberController.value.text.trim(),
            emiratesId: emairatesIDController.value.text.trim(),
          ),
          userData.id.toString());

      //to update data in the user profile in previous screen just update the parameter
      customerManagement.userData = UserData(
        firstname: firstNameController.value.text.trim(),
        lastname: lastNameController.value.text.trim(),
        address: addressController.value.text.trim(),
        email: emailController.value.text.trim(),
        mfaEnabled: userData.mfaEnabled.toString(),
        status: status.value,
        phonenumber: contactNumberController.value.text.trim(),
        emiratesId: emairatesIDController.value.text.trim(),
        createdOn: userData.createdOn,
      );

      customerManagement
          .update(); //update the controller to show changs in the UI of customer mgt

      await managecustomerController.getAllSignupCustomers(); //get all customer again to show change in the main table of customr 
      Get.snackbar("Customre Updated", "The customer is updated successfully");
      firstNameController.value.clear();
      lastNameController.value.clear();
      emailController.value.clear();
      contactNumberController.value.clear();
      emairatesIDController.value.clear();
      addressController.value.clear();
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userData = Get.arguments;
    firstNameController.value.text = userData.firstname.toString();
    lastNameController.value.text = userData.lastname.toString();
    emailController.value.text = userData.email.toString();
    contactNumberController.value.text = userData.phonenumber.toString();
    emairatesIDController.value.text = userData.emiratesId.toString();
    addressController.value.text = userData.address.toString();
    status.value = userData.status!;
  }
}
