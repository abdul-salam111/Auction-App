import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ManagecustomerController extends GetxController {
  var selectedRows = <int>[].obs;
  var expandedRows = <int>[].obs;
  var selectAll = false.obs;

  var searchQuery = ''.obs;
  var data = <Map<String, dynamic>>[].obs;
  var filteredData = <Map<String, dynamic>>[].obs;
  var rowsPerPage = 7.obs;

  @override
  void onInit() {
    super.onInit();
    data.assignAll(List.generate(
      100,
      (index) => {
        'id': index,
        'mobile': '$index${9007868871}',
        'name': index == 0
            ? 'Linda Blair'
            : index == 1
                ? "Abdul Salam"
                : index == 2
                    ? "Moazzam"
                    : 'M. Islam Ali',
        'regDate': '2025-$index-07',
        'email': 'm.ism@gmail.com',
        'active': true,
      },
    ));
    filteredData.assignAll(data); 
  }

  void toggleSelectAll(bool? value) {
    if (value == null) return;
    selectAll(value);
    selectedRows.clear();
    if (value) {
      selectedRows.addAll(filteredData.map((e) => e['id']));
    }
  }

  void toggleRowSelection(int id) {
    selectedRows.contains(id) ? selectedRows.remove(id) : selectedRows.add(id);
    if (selectedRows.length == filteredData.length) {
      selectAll(true);
    } else {
      selectAll(false);
    }
  }

  void toggleExpandRow(int id) {
    expandedRows.contains(id) ? expandedRows.remove(id) : expandedRows.add(id);
    update();
  }

  void toggleActive(int id) {
    int index = filteredData.indexWhere((element) => element['id'] == id);
    filteredData[index]['active'] = !filteredData[index]['active'];
    update();
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    Get.snackbar('Copied', 'Data copied to clipboard');
  }

  void updateStatus(String id, bool newValue) {
    int index = filteredData
        .indexWhere((row) => row['id'].toString().trim() == id.trim());

    if (index != -1) {
      filteredData[index]['active'] = newValue;
      update();
    }
  }

  void deleteRow(String id) {
    filteredData.removeWhere((row) => row['id'].toString() == id);
    update(); // Notify UI of changes
  }

  void search(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      filteredData.assignAll(data); // Show all data if search query is empty
    } else {
      filteredData.assignAll(
        data.where((customer) =>
            customer['name']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            customer['mobile'].toString().contains(query) ||
            customer['email']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase())),
      );
    }

    update();
  }

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
        TextCellValue(row['id'].toString()),
        TextCellValue(row['mobile'] ?? ''),
        TextCellValue(row['name'] ?? ''),
        TextCellValue(row['regDate'] ?? ''),
        TextCellValue(row['email'] ?? ''),
        TextCellValue(row['active'] == true ? "Active" : "In Active"),
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
