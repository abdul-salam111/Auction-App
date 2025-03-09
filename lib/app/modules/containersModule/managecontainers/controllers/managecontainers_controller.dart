import 'dart:io';

import 'package:excel/excel.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../modules.dart';

class ManagecontainersController extends GetxController {
  final FocusNode searchFocusNode = FocusNode();
  // Data list to store all auction items
  final RxList<Map<String, dynamic>> data = <Map<String, dynamic>>[].obs;

  // Paginated data for the current page
  final RxList<Map<String, dynamic>> paginatedData =
      <Map<String, dynamic>>[].obs;

  // Current page number
  final RxInt currentPage = 1.obs;

  // Number of items per page
  final int itemsPerPage = 10;

  // List to track expanded rows
  final RxList<int> expandedRows = <int>[].obs;

  // Filtered data based on status
  final RxList<Map<String, dynamic>> filteredData =
      <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchData();
    currentPage.value = 1;
    paginateData();
  }

  // Fetch initial data for auctions
  void fetchData() {
    data.value = List.generate(
      50,
      (index) => {
        'id': index,
        'Container No': index,
        'BL No': 'Auction $index',
        'Arrival Date': '2024-12-01',
        'Cars': index,
        'Est Arrival Date': '2025-12-01',
        "Status": "Arrived",
        "Location": "Location $index"
      },
    );
    filteredData.assignAll(data);
  }

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
      filteredData.assignAll(data);
      paginateData();
    } else {
      filteredData.value = data.where((item) {
        return item['BL No']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();

      currentPage.value = 1;
      paginateData();
    }
  }

  //export and download excel File
  Future<void> downloadExcel() async {
    var excel = Excel.createExcel();
    var sheet = excel['Containers'];

    sheet.appendRow([
      TextCellValue("Container No"),
      TextCellValue("BL No"),
      TextCellValue("Arrival Date"),
      TextCellValue("No of Cars"),
      TextCellValue("Est Arrival Date"),
      TextCellValue("Status"),
      TextCellValue("Location"),
    ]);
    // Add data rows
    for (var row in filteredData) {
      sheet.appendRow([
        TextCellValue(row['Container No'].toString()),
        TextCellValue(row['BL No'].toString()),
        TextCellValue(row['Arrival Date'].toString()),
        TextCellValue(row['Cars'].toString()),
        TextCellValue(row['Est Arrival Date'].toString()),
        TextCellValue(row['Status'].toString()),
        TextCellValue(row['Location'].toString()),
      ]);
    }

    // Save file
    var directory = await getApplicationDocumentsDirectory();
    String filePath = "${directory.path}/Containers.xlsx";
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    // Open the file
    OpenFile.open(filePath);
  }
}
