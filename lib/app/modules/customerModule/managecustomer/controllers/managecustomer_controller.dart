import 'dart:io';

import 'package:excel/excel.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../modules.dart';

class ManagecustomerController extends GetxController {
      final FocusNode searchFocusNode = FocusNode();

  final data = <UserData>[].obs;

  // Paginated data for the current page
  final paginatedData = <UserData>[].obs;
  
  // Filtered data based on status
  final filteredData = <UserData>[].obs;

  // Current page number
  final RxInt currentPage = 1.obs;

  // Number of items per page
  final int itemsPerPage = 10;

  // List to track expanded rows
  final RxList<int> expandedRows = <int>[].obs;
  var selectedRows = <int>[].obs;

  // Status filter
  final RxString selectedStatus = ''.obs;

  // Handle data pagination
  void paginateData() {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    paginatedData.value =
        filteredData.sublist(start, end.clamp(0, filteredData.length));
  }

  // Navigate to a specific page
  void goToPage(int page) {
    currentPage.value = page;
    paginateData();
  }

  // Toggle row expansion
  void toggleExpandRow(int id) {
    if (expandedRows.contains(id)) {
      expandedRows.remove(id);
    } else {
      expandedRows.add(id);
    }
    expandedRows.refresh();
  }

  // Build pagination UI
  Widget buildPagination() {
    int totalPages = (filteredData.length / itemsPerPage).ceil();
    List<Widget> pages = List.generate(totalPages, (index) {
      int page = index + 1;
      return InkWell(
        onTap: () => goToPage(page),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: currentPage.value == page
                ? AppColors.primaryColor
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$page',
              style: TextStyle(
                color: currentPage.value == page ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
    });

    return Row(
      mainAxisAlignment: mainAxisCenter,
      children: [
        IconButton(
          icon: Icon(Iconsax.arrow_square_left),
          onPressed: currentPage.value > 1
              ? () => goToPage(currentPage.value - 1)
              : null,
        ),
        ...pages,
        IconButton(
          icon: Icon(Iconsax.arrow_right),
          onPressed: currentPage.value < totalPages
              ? () => goToPage(currentPage.value + 1)
              : null,
        ),
      ],
    );
  }

  // Search functionality for auctions
  void search(String query) {
    if (query.isEmpty) {
      paginateData();
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

      currentPage.value = 1; // Reset to first page
      paginateData();
    }
  }

  //export and download excel File
  Future<void> downloadExcel() async {
    var excel = Excel.createExcel();
    var sheet = excel['Customers'];

    // Add headers
    sheet.appendRow([
      TextCellValue("Mobile No"),
      TextCellValue("Name"),
      TextCellValue("Reg.Date"),
      TextCellValue("Email"),
      TextCellValue("Status"),
    ]);

    // Add data rows
    for (var row in filteredData) {
      sheet.appendRow([
        TextCellValue(row.phonenumber.toString()),
        TextCellValue("${row.firstname} ${row.lastname}"),
        TextCellValue(row.createdOn!.toSimpleDate()),
        TextCellValue(row.email.toString()),
        TextCellValue(row.status == true ? "Active" : "InActive"),
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

  // Loading indicator
  var isLoading = false.obs;
  // Repository instance
  final CustomersRepository customersRepository = CustomersRepository();

  @override
  void onInit() async {
    super.onInit();
    await getAllSignupCustomers();
    paginateData();
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

  var selectAll = false.obs;
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

  var isRefreshLoading = false.obs;
  Future<void> refreshData() async {
    isRefreshLoading.value = true;
    await getAllSignupCustomers();
    isRefreshLoading.value = false;

  }
}
