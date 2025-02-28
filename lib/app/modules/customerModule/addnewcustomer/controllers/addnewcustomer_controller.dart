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
}
