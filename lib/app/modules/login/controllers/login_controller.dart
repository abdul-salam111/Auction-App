import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/repositories/containerRepo/container_repository.dart';

class LoginController extends GetxController {
  final useridController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  var isloading = false.obs; //for showing loader

//login users
  AuthRepository authRepository = AuthRepository();

  Future<void> loginUserByUID() async {
    isloading.value = true;
    await authRepository.loginUserByUID(
        LoginByUidModel(
            uid: useridController.value.text.trim(),
            password: passwordController.value.text.trim()),
        getAllContainersModel); 

    isloading.value = false;
  }

  //Get All containers and show in the dashboard it would be good to fetch here
  //as it does not need any token so we can access and pass to the next screen
  ContainerRepository containerRepository = ContainerRepository();
  late GetAllContainersModel getAllContainersModel;
  Future<void> getAllContainers() async {
    getAllContainersModel = await containerRepository.getAllContainers();
  }

  @override
  void onInit() {
    super.onInit();
    getAllContainers();
  }

  @override
  void onClose() {
    super.onClose();
    useridController.value.dispose();
    passwordController.value.dispose();
  }
}
