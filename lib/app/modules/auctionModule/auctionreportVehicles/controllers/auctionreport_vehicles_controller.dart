import 'dart:io';
import 'package:auction_app/app/data/postModels/bid_won_by_customer.dart';
import 'package:auction_app/app/utils/utils.dart';
import 'package:excel/excel.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../../modules.dart';

class AuctionreportVehiclesController extends GetxController {
  //will pass this id based on which to bring bids of that auction
  late String auctionId;
  final FocusNode searchFocusNode = FocusNode();
  // Data list to store all auction items
  final data = <Bid>[].obs;

  // Paginated data for the current page
  final paginatedData = <Bid>[].obs;

  // Current page number
  final RxInt currentPage = 1.obs;

  // Number of items per page
  final int itemsPerPage = 10;

  // List to track expanded rows
  final RxList<int> expandedRows = <int>[].obs;

  // Status filter
  final RxString selectedStatus = 'All'.obs;

  // Filtered data based on status
  final filteredData = <Bid>[].obs;

  @override
  void onInit() async {
    super.onInit();
    auctionId = Get.arguments;
    await getAllBidsofAuctions();
    paginateData();
  }

  var isLoading = false.obs;
  final auctionrepo = AuctionsRepository();
  // Fetch initial data for auctions
  Future<void> getAllBidsofAuctions() async {
    try {
      isLoading.value = true;
      final response =
          await auctionrepo.getAllBidsofAnAuction(auctionId: auctionId);
      data.value = response.bids!.map((e) => e).toList();
      filteredData.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      print('Error fetching customers: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Filter data based on selected status
  void filterData() {
    filteredData.value = data;

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
        return item.vehicle
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            item.sparepart
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
      TextCellValue("Name"),
      TextCellValue("Contact"),
      TextCellValue("Vehicle Name"),
      TextCellValue("Created On"),
      TextCellValue("Bid Amount"),
      TextCellValue("Chassis/Id"),
    ]);

    for (var row in filteredData) {
      sheet.appendRow([
        TextCellValue(row.name.toString()),
        TextCellValue(row.phoneNumber.toString()),
        TextCellValue(row.vehicle != null
            ? row.vehicle.toString()
            : row.sparepart.toString()),
        TextCellValue(row.createdAt!.toSimpleDate()),
        TextCellValue(row.bidAmount.toString()),
        TextCellValue(row.vehicleChassis != null
            ? row.vehicleChassis.toString()
            : row.sparepartId.toString()),
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

  //bid won by customer
  Future bidwonBycustomer(BidWonByCustomer bidwonbycustomer) async {
    try {
      await auctionrepo.bidwonbycustomer(bidwonbycustomer);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    searchFocusNode.dispose();
  }
}
