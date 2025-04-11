import 'dart:io';

import 'package:excel/excel.dart';
import 'package:image_picker/image_picker.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../data/postModels/add_new_container.dart' as container;
import '../../../../data/postModels/add_new_container.dart';
import '../../../modules.dart';

class EditcontainersController extends GetxController {
  final shipperNameController = TextEditingController().obs;
  final shippingCompanyController = TextEditingController().obs;
  final bLNumberController = TextEditingController().obs;
  final containerNumberController = TextEditingController().obs;
  final sealNumberController = TextEditingController().obs;
  final grossWeightController = TextEditingController().obs;
  final portOfLoadingController = TextEditingController().obs;
  final portOfDischargeController = TextEditingController().obs;
  final numberOfUnitsController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  late String containerId;

  // Data list to store all auction items
  final data = <Item>[].obs;

  // Paginated data for the current page
  final paginatedData = <Item>[].obs;

  // Current page number
  final RxInt currentPage = 1.obs;

  // Number of items per page
  final int itemsPerPage = 10;

  // List to track expanded rows
  final RxList<int> expandedRows = <int>[].obs;

  // Filtered data based on status
  final filteredData = <Item>[].obs;

  var selectedImages = <File>[].obs;
  var uploadedImages = <dynamic>[].obs;
  @override
  void onInit() async {
    super.onInit();
    containerId = Get.arguments;
    await getSingleContainerDetails();
    shipperNameController.value.text =
        containerDetails.value.data!.first.container!.shipper.toString();
    shippingCompanyController.value.text = containerDetails
        .value.data!.first.container!.shippingCompany
        .toString();
    shippingCompanyController.value.text = containerDetails
        .value.data!.first.container!.shippingCompany
        .toString();
    bLNumberController.value.text =
        containerDetails.value.data!.first.container!.blNumber.toString();
    containerNumberController.value.text = containerDetails
        .value.data!.first.container!.containerNumber
        .toString();
    sealNumberController.value.text =
        containerDetails.value.data!.first.container!.sealNumber.toString();
    grossWeightController.value.text =
        containerDetails.value.data!.first.container!.grossWeight.toString();
    portOfLoadingController.value.text =
        containerDetails.value.data!.first.container!.portOfLoading.toString();
    portOfDischargeController.value.text = containerDetails
        .value.data!.first.container!.portOfDischarge
        .toString();
    numberOfUnitsController.value.text =
        containerDetails.value.data!.first.container!.noOfUnits.toString();
    descriptionController.value.text =
        containerDetails.value.data!.first.container!.description.toString();
    selectedStatus.value =
        containerDetails.value.data!.first.container!.status.toString();
    uploadedImages.value = containerDetails.value.data!.first.images!;
    final items = containerDetails.value.data?.first.items;

    if (items != null) {
      itemsInContainer.value.vehicles ??= [];
      itemsInContainer.value.parts ??= [];

      // Filter and assign vehicles
      itemsInContainer.value.vehicles!.assignAll(
        items
            .where((e) => e.type?.toLowerCase() != "spareparts")
            .map((e) => container.Vehicle(
                  chassisNumber: e.chassisNumber,
                  make: e.make,
                  model: e.model,
                  year: e.year,
                  color: e.color,
                ))
            .toList(),
      );

      // Filter and assign parts
      itemsInContainer.value.parts!.assignAll(
        items
            .where((e) => e.type?.toLowerCase() == "spareparts")
            .map((e) => container.Part(
                  id: e.id.toString(),
                  make: e.make,
                  model: e.model,
                  name: e.make,
                ))
            .toList(),
      );
    } else {
      debugPrint("Items are null!");
    }

    currentPage.value = 1;
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
      currentPage.value = 1;
      paginateData();
    } else {
      filteredData.value = data.where((item) {
        return item.toString().toLowerCase().contains(query.toLowerCase());
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
    // for (var row in filteredData) {
    //   sheet.appendRow([
    //     TextCellValue(row['Auction Name'].toString()),
    //     TextCellValue(row['Date'] ?? ''),
    //     TextCellValue(row['Status'] ?? ''),
    //     TextCellValue(row['Cars'] ?? ''),
    //     TextCellValue(row['Location'] ?? ''),
    //   ]);
    // }

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
  final ImagePicker _picker = ImagePicker();
  final containerrepo = ContainerRepository();
  final containerDetails = FetchSingleContainerDetails().obs;
  var gettingContainers = false.obs;

  //get single container Details
  Future<void> getSingleContainerDetails() async {
    try {
      containerDetails.value =
          await containerrepo.getSingleContainerDetails(containerId);
      data.value = containerDetails.value.data!.first.items!.toList();
      filteredData.assignAll(data);
    } catch (e) {
      print(e);
    }
  }

  // Pick images from gallery
  Future<void> pickImagesFromGallery() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();
    selectedImages.addAll(pickedFiles.map((e) => File(e.path)));
  }

  // Pick image from camera
  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImages.add(File(pickedFile.path));
    }
  }

  // Remove image from the list
  void removeImage(int index) {
    selectedImages.removeAt(index);
  }

  var selectedItemType = ''.obs;
  var selectedStatus = "Arrived".obs;

  final itemsInContainer = AddNewContainer().obs;
  var isContainerUploading = false.obs;
  final manageContinercontroller = Get.put(ManagecontainersController());
  final containerRepo = ContainerRepository();
  Future updateContainerDetails() async {
    try {
      isContainerUploading.value = true;
      bool isTrue = await containerRepo.updateContainerDetails(
          AddNewContainer(
            shipper: shipperNameController.value.text.toString(),
            shippingCompany: shippingCompanyController.value.text.toString(),
            blNumber: bLNumberController.value.text.toString(),
            containerNumber: containerNumberController.value.text.toString(),
            sealNumber: sealNumberController.value.text.toString(),
            grossWeight: grossWeightController.value.text.toString(),
            portOfDischarge: portOfDischargeController.value.text.toString(),
            portOfLoading: portOfLoadingController.value.text.toString(),
            vehicles: itemsInContainer.value.vehicles,
            status: selectedStatus.value,
            parts: itemsInContainer.value.parts,
            noOfUnits: numberOfUnitsController.value.text.toString(),
            images: selectedImages.map((e) => e.path).toList(),
            description: descriptionController.value.text.toString(),
          ),
          containerId);
      if (isTrue) {
        Get.dialog(CustomSuccessDialog(
          title: 'Container updated',
          message: "New Container has been successfully updated.",
          onConfirm: () {
            Get.back();
          },
          icon: "assets/icons/done.png",
        ));
        isContainerUploading.value = false;

        await manageContinercontroller.getAllContainers();
      }

      isContainerUploading.value = false;
    } catch (e) {
      print(e);
      isContainerUploading.value = false;
    }
  }

  @override
  onClose() {
    super.onClose();
    shipperNameController.value.dispose();
    shippingCompanyController.value.dispose();
    bLNumberController.value.dispose();
    containerNumberController.value.dispose();
    sealNumberController.value.dispose();
    grossWeightController.value.dispose();
    portOfLoadingController.value.dispose();
    portOfDischargeController.value.dispose();
    numberOfUnitsController.value.dispose();
    descriptionController.value.dispose();
  }
}
