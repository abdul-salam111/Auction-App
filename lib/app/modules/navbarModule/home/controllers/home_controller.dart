import '../../../modules.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Iconsax.judge, 'label': "Auction Management"},
    {'icon': Iconsax.box, 'label': "Update Stock"},
    {'icon': Iconsax.user_add, 'label': "Add Customer"},
    {'icon': Iconsax.archive_add, 'label': "Add Container"},
    {'icon': Iconsax.edit, 'label': "Update Sale"},
  ];

  late GetAllContainersModel getAllContainersModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllContainersModel = Get.arguments;

  }
}
