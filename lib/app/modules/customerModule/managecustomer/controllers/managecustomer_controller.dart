import 'dart:io';
import 'package:auction_app/app/data/getModels/get_all_signup_customers.dart';
import 'package:auction_app/app/repositories/respository.dart';
import 'package:auction_app/app/res/res.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class ManagecustomerController extends GetxController {
  // Loading indicator
  var isLoading = false.obs;

  // Repository instance
  final CustomersRepository customersRepository = CustomersRepository();

  // Data handling
  var data = <UserData>[].obs;
  var filteredData = <UserData>[].obs;
  var searchQuery = ''.obs;

  // Pagination
  var rowsPerPage = 7.obs;

  // Row selection and expansion
  var selectedRows = <int>[].obs;
  var expandedRows = <int>[].obs;
  var selectAll = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllSignupCustomers();
  }

  // Fetching all signed-up customers
  Future<void> getAllSignupCustomers() async {
    try {
      isLoading.value = true;
      final response = await customersRepository.getAllSignupCustomers();
      data.value = response.data!.map((e) => e).toList();
      filteredData.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      print('Error fetching customers: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // delete a customer by id
  Future<void> deleteCustomerById(String customerID) async {
    try {
      final isDeleted =
          await customersRepository.deleteIndividualCustomer(customerID);

      if (isDeleted) {
        Get.snackbar(
            "Customer Deleted", "The customer is deleted successfully");
        await getAllSignupCustomers();
      }
    } catch (e) {
      print('Error fetching customers: $e');
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  // Selection controls
  void toggleSelectAll(bool? value) {
    if (value == null) return;
    selectAll(value);
    selectedRows.clear();
    if (value) {
      selectedRows.addAll(filteredData.map((e) => e.id!));
    }
  }

  void toggleRowSelection(int id) {
    selectedRows.contains(id) ? selectedRows.remove(id) : selectedRows.add(id);
    selectAll(selectedRows.length == filteredData.length);
  }

  void toggleExpandRow(int id) {
    expandedRows.contains(id) ? expandedRows.remove(id) : expandedRows.add(id);
    update();
  }

  // Data manipulation
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    Get.snackbar('Copied', 'Data copied to clipboard');
  }

  void deleteRow(String id) {
    filteredData.removeWhere((row) => row.id.toString() == id);
    update(); // Notify UI of changes
  }

// Search functionality
  void search(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredData.assignAll(data);
    } else {
      filteredData.assignAll(
        data.where((customer) =>
            (customer.firstname! + customer.lastname!)
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            customer.phonenumber.toString().contains(query) ||
            customer.email
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase())),
      );
    }

    update();
  }

//export and download excel File
  Future<void> downloadExcel() async {
    var excel = Excel.createExcel();
    var sheet = excel['Customers'];

    // Add headers
    sheet.appendRow([
      TextCellValue("User Id"),
      TextCellValue("Mobile No"),
      TextCellValue("Name"),
      TextCellValue("Reg. Date"),
      TextCellValue("Email"),
      TextCellValue("Status"),
    ]);

    // Add data rows
    for (var row in filteredData) {
      sheet.appendRow([
        TextCellValue(row.id.toString()),
        TextCellValue(row.phonenumber ?? ''),
        TextCellValue(row.firstname.toString() + row.lastname.toString()),
        TextCellValue(row.createdOn!.toFriendlyDateTime()),
        TextCellValue(row.email ?? ''),
        TextCellValue(row.status == true ? "Active" : "In Active"),
      ]);
    }

    // Save file
    var directory = await getApplicationDocumentsDirectory();
    String filePath = "${directory.path}/Customers.xlsx";
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    // Open the file
    OpenFile.open(filePath);
  }
}
