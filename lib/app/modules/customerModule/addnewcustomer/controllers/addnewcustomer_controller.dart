import 'package:auction_app/app/modules/modules.dart';

class AddnewcustomerController extends GetxController {
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
  Future<void> addCustomerByAdmin() async {
    try {
      isloading.value = true;
      await customersRepository.addCustomerByAdmin(AddCustomerByAdminModel(
        firstname: firstNameController.value.text.trim(),
        lastname: lastNameController.value.text.trim(),
        address: addressController.value.text.trim(),
        email: emailController.value.text.trim(),
        role: "Customer",
        status: status.value.toString(),
        phonenumber: contactNumberController.value.text.trim(),
        emiratesId: emairatesIDController.value.text.trim(),
      ));
      await managecustomerController.getAllSignupCustomers();

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
  onClose() {
    firstNameController.value.dispose();
    lastNameController.value.dispose();
    contactNumberController.value.dispose();
    emailController.value.dispose();
    emairatesIDController.value.dispose();
    addressController.value.dispose();
    super.onClose();
  }
}
