import 'dart:io';

import 'package:auction_app/app/data/getModels/get_containers_count.dart';
import 'package:auction_app/app/utils/utils.dart';
import 'package:excel/excel.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../modules.dart';

class ManagecontainersController extends GetxController {
  final FocusNode searchFocusNode = FocusNode();
  final RxList<ContainersData> data = <ContainersData>[].obs;
  final RxList<ContainersData> paginatedData = <ContainersData>[].obs;
  final RxInt currentPage = 1.obs;
  final int itemsPerPage = 10;
  final RxList<int> expandedRows = <int>[].obs;
  final RxList<ContainersData> filteredData = <ContainersData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllContainers();
  }

  void paginateData() {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;

    paginatedData.value =
        filteredData.sublist(start, end.clamp(0, filteredData.length));
  }

  void goToPage(int page) {
    currentPage.value = page;
    paginateData();
  }

  void toggleExpandRow(int id) {
    if (expandedRows.contains(id)) {
      expandedRows.remove(id);
    } else {
      expandedRows.add(id);
    }
    expandedRows.refresh();
  }

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

  void search(String query) {
    if (query.isEmpty) {
      filteredData.assignAll(data);
    } else {
      filteredData.value = data.where((item) {
        return item.containerNumber
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
    }
    currentPage.value = 1;
    paginateData();
  }

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
    for (var row in filteredData) {
      sheet.appendRow([
        TextCellValue(row.containerNumber.toString()),
        TextCellValue(row.blNumber.toString()),
        TextCellValue(row.createdAt!.toSimpleDate().toString()),
        TextCellValue(row.noOfUnits.toString()),
        TextCellValue(row.createdAt!.toSimpleDate().toString()),
        TextCellValue(row.status.toString()),
        TextCellValue(row.portOfLoading.toString()),
      ]);
    }

    var directory = await getApplicationDocumentsDirectory();
    String filePath = "${directory.path}/Containers.xlsx";
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    OpenFile.open(filePath);
  }

  ContainerRepository containerRepository = ContainerRepository();
  final getAllContainersModel = GetAllContainersModel().obs;
  final getcontainresCount = GetContainersCount().obs;
  var isLoading = false.obs;
  Future<void> getAllContainers() async {
    try {
      isLoading.value = true;
      getAllContainersModel.value =
          await containerRepository.getAllContainers();
      data.assignAll(getAllContainersModel.value.data!.map((e) => e).toList());
      filteredData.assignAll(data);
      getcontainresCount.value = await containerRepository.getContainersCount();
      paginateData();
      update();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future deleteContainer(String containerId) async {
    try {
      await containerRepository.deleteContainer(containerId);
      await getAllContainers();
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  @override
  void onClose() {
    searchFocusNode.dispose();
    data.clear();
    paginatedData.clear();
    filteredData.clear();
    expandedRows.clear();
    super.onClose();
  }
}
