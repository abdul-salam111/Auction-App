import 'package:auction_app/app/data/getModels/get_all_notifications.dart';
import 'package:auction_app/app/modules/modules.dart';

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
        getAllContainersModel,
        notifications);

    isloading.value = false;
  }

  //Get All containers and show in the dashboard it would be good to fetch here
  //as it does not need any token so we can access and pass to the next screen
  ContainerRepository containerRepository = ContainerRepository();
  late GetAllContainersModel getAllContainersModel;
  Future<void> getAllContainers() async {
    getAllContainersModel = await containerRepository.getAllContainers();
  }

  NotificationsRepo notificationsRepo = NotificationsRepo();
  List<GetAllNotifications> notifications = [];

  Future<void> getAllNotificationsMethod() async {
    notifications = await notificationsRepo.getAllNotifications();
  }

  @override
  void onInit() {
    super.onInit();
    getAllContainers();
    getAllNotificationsMethod();
  }

  @override
  void onClose() {
    super.onClose();
    useridController.value.dispose();
    passwordController.value.dispose();
  }
}
