import 'package:auction_app/app/data/getModels/get_customer_details_by_contact.dart';
import 'package:auction_app/app/modules/modules.dart';

class AddnewbidController extends GetxController {
  final fullNameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  late String customerType;
  var filteredContacts = <Contacts>[].obs;
  var selectedPhoneNumber = "".obs;
  late String auctionId;
  void filterContacts(String query) {
    if (query.isEmpty) {
      filteredContacts.assignAll(customerContacts.value.data!);
    } else {
      filteredContacts.assignAll(
        customerContacts.value.data!.where((contact) =>
            contact.phoneNumber!.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    customerType = Get.arguments[0];
    if (customerType == '1') {
      await getAllcustomerContacts();
      filteredContacts.assignAll(customerContacts.value.data!);
    }
    auctionId = Get.arguments[1];
  }

  final auctionrepo = AuctionsRepository();
  final customerContacts = CustomerContacts().obs;

  var contactsLoading = false.obs;

  Future getAllcustomerContacts() async {
    try {
      contactsLoading.value = true;
      customerContacts.value = await auctionrepo.getAllContactsofCustomers();

      contactsLoading.value = false;
    } catch (e) {
      contactsLoading.value = false;

      throw Exception(e);
    }
  }

  final selectedCustomerDetails = GetCustomerDetailsByContactNumberModel().obs;
  Future getCustomerDetails() async {
    try {
      contactsLoading.value = true;
      selectedCustomerDetails.value = await auctionrepo
          .getCustomerDetailsByContactNumber(selectedPhoneNumber.value.trim());

      contactsLoading.value = false;
    } catch (e) {
      contactsLoading.value = false;

      throw Exception(e);
    }
  }

  final vehiclereportscontroller = Get.put(AuctionreportVehiclesController());
  var selectedItemType = ''.obs;
  var selectedId = ''.obs;

  final auctions = AddNewBid().obs;
  var isBidsUploading = false.obs;
  Future addnewBids() async {
    try {
      isBidsUploading.value = true;

      final istrue = await auctionrepo.sendCustomerDataToCart(AddNewBid(
        name: customerType == "1"
            ? selectedCustomerDetails.value.data!.name
            : fullNameController.value.text.trim(),
        contact: customerType == "1"
            ? selectedPhoneNumber.value
            : phoneController.value.text.trim(),
        parts: auctions.value.parts,
        vehicles: auctions.value.vehicles,
        auctionId: auctionId,
      ));
      await vehiclereportscontroller.getAllBidsofAuctions();
      if (istrue) {
        Get.dialog(CustomSuccessDialog(
          title: 'Bids Added',
          message: "New Bids has been successfully added.",
          onConfirm: () {
            Get.back();
          },
          icon: "assets/icons/done.png",
        ));
        isBidsUploading.value = false;
        phoneController.value.clear();
        fullNameController.value.clear();
        selectedPhoneNumber.value = "";
        auctions.value = AddNewBid();
      }
      isBidsUploading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
