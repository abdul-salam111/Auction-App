import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/repositories/products_repository/products_rep.dart';

class ProductdetailsController extends GetxController {
  var isupdateSalesScreen = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isupdateSalesScreen.value = Get.arguments;
  }

  var selectedStatus = "Instock".obs;

  final List<String> statusOptions = [
    'Intransit',
    'Outofstock',
    'Instock',
  ];

  final List<String> statusOptions1 = [
    'Instock',
    'Intransit',
  ];

  var currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  var carImages = <String>[].obs;
  var itemId = ''.obs;
  var chasisnumber = ''.obs;
  var name = ''.obs;
  var model = ''.obs;
  var totatlPrice = ''.obs;
  var color = ''.obs;
  var make = ''.obs;
  var year = ''.obs;
  var fueltype = ''.obs;
  var transmission = ''.obs;
  var condition = ''.obs;
  var mileage = ''.obs;
  var soldPrice = ''.obs;

  var description = ''.obs;
  var recievedAmount = ''.obs;
  var balanceAmount = ''.obs;
  var classificaction = ''.obs;
  var category = ''.obs;

  ProductsRepository productsRepository = ProductsRepository();
  Future deleteCar(String id) async {
    try {
      await productsRepository.deleteCar(id);
    } catch (e) {
      print(e);
    }
  }

  Future deleteTruck(String id) async {
    try {
      await productsRepository.deleteCar(id);
    } catch (e) {
      print(e);
    }
  }

  Future deleteSparePart(String id) async {
    try {
      await productsRepository.deleteSparePart(id);
    } catch (e) {
      print(e);
    }
  }
}
