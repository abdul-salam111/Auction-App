import 'package:auction_app/app/modules/modules.dart';
import 'package:get/get.dart';

class CustomermanagementController extends GetxController {
  var selectedIndex = 0.obs;
  var filteredData = <Map<String, dynamic>>[].obs;
  var rowsPerPage = 7.obs;
  var selectedRows = <int>[].obs;
  var data = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data.assignAll(List.generate(
      100,
      (index) => {
        'Product': 'Toyota Corolla',
        'Chassis No': '1245897',
        'Total': 'AED 607',
        'Date': '12 Dec 2023',
        'Status': 'Pending',
      },
    ));
    filteredData.assignAll(data);
  }

  var fromDate = DateTime.now().obs;
  var toDate = DateTime.now().obs;

  Future<void> pickDate(bool isFromDate, BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate ? fromDate.value : toDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      isFromDate ? fromDate.value = picked : toDate.value = picked;
    }
  }
}
