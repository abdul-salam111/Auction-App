import '../../modules/modules.dart';
import '../../utils/utils.dart';

class CustomersRepository {
  final apiService = NetworkServicesApi();

  Future<GetAllSignupCustomersModel> getAllSignupCustomers() async {
    try {
      final response = await apiService.getApi(AppUrls.getallsignupcustomers);
      return GetAllSignupCustomersModel.fromJson(response);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  Future<bool> deleteIndividualCustomer(String customerId) async {
    try {
      await apiService.deleteApi(
          "${AppUrls.deleteSingleCustomer}$customerId", customerId);
      return true;
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      return false;
    }
  }

  Future<GetIndividualCustomerWonBids> getIndividualCustomerWonBids(
      String userId) async {
    try {
      final response = await apiService
          .getApi("${AppUrls.getIndividualCustomerWonbids}$userId");

      return GetIndividualCustomerWonBids.fromJson(response);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  Future<void> addCustomerByAdmin(
      AddCustomerByAdminModel addCustomerByAdmin) async {
    try {
      await apiService.postApi(AppUrls.addCustomerByAdmin, addCustomerByAdmin);
      Get.dialog(CustomSuccessDialog(
        title: 'Customer Added',
        message: "New Customer has been successfully added.",
        onConfirm: () {
          Get.back();
        },
        icon: "assets/icons/contact.png",
      ));
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  Future<bool> deleteWonBidofCustomerByAdmin({
    required String chassisno,
    required String customerId,
  }) async {
    try {
      await apiService.deleteApi(
          "${AppUrls.deleteWonBidsOfCustomerByAdmin}$customerId",
          {"chassis_no": chassisno});
      return true;
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      return false;
    }
  }

  Future<bool> updateCustomerByAdmin(
      UpdateCustomerByAdmin updateCustomerByAdmin, String customerId) async {
    try {
      await apiService.updateApi(
          "${AppUrls.updateCustomerByAdmin}$customerId", updateCustomerByAdmin);
      
      return true;
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      return false;
    }
  }
}
