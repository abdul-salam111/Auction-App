import 'dart:io';
import 'package:excel/excel.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../../modules.dart';

class AuctionsController extends GetxController {
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

  // Status filter
  final RxString selectedStatus = 'All'.obs;

  // Filtered data based on status
  final RxList<Map<String, dynamic>> filteredData =
      <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    filterData();
  }

  // Fetch initial data for auctions
  void fetchData() {
    data.value = List.generate(
      50,
      (index) => {
        'id': index,
        'Auction Name': 'Auction $index',
        'Date': '2024-12-01',
        'Status': index % 3 == 0
            ? 'Active'
            : (index % 3 == 1 ? 'Upcoming' : 'Closed'),
        'Cars': '${index * 2}',
        'Location': 'Location $index'
      },
    );
  }

  // Filter data based on selected status
  void filterData() {
    if (selectedStatus.value.isEmpty) {
      filteredData.value = data;
    } else if (selectedStatus.value == "All") {
      filteredData.value = data;
    } else {
      filteredData.value =
          data.where((item) => item['Status'] == selectedStatus.value).toList();
    }
    currentPage.value = 1; // Reset to first page
    paginateData();
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
  void searchAuction(String query) {
    if (query.isEmpty) {
      filterData();
    } else {
      filteredData.value = data.where((item) {
        return item['Auction Name']
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
    var sheet = excel['Auctions'];

    // Add headers
    sheet.appendRow([
      TextCellValue("Auction Name"),
      TextCellValue("Date"),
      TextCellValue("Status"),
      TextCellValue("Cars"),
      TextCellValue("Location"),
    ]);

    // Add data rows
    for (var row in filteredData) {
      sheet.appendRow([
        TextCellValue(row['Auction Name'].toString()),
        TextCellValue(row['Date'] ?? ''),
        TextCellValue(row['Status'] ?? ''),
        TextCellValue(row['Cars'] ?? ''),
        TextCellValue(row['Location'] ?? ''),
      ]);
    }

    // Save file
    var directory = await getApplicationDocumentsDirectory();
    String filePath = "${directory.path}/Auctions.xlsx";
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    // Open the file
    OpenFile.open(filePath);
  }

  var selectedVehicle = "".obs;
//select vehicale type
  var isDropdownOpen = false.obs;
}
