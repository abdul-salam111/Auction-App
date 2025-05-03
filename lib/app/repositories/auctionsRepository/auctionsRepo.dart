import 'dart:convert';
import 'package:auction_app/app/data/getModels/get_customer_details_by_contact.dart';
import 'package:auction_app/app/data/postModels/addauctionwithNewCustomer.dart';
import 'package:auction_app/app/data/postModels/bid_won_by_customer.dart';
import 'package:auction_app/app/data/postModels/create_new_auction.dart';
import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/utils/utils.dart';
import 'package:http/http.dart' as http;

class AuctionsRepository {
  final apiService = NetworkServicesApi();

  //get all auctions
  Future<GetAllAuctions> getAllAuctions() async {
    try {
      final response = await apiService.getApi(AppUrls.getAllAuctions);
      return GetAllAuctions.fromJson(response);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  //create New Auctions
  Future<bool> createNewAuctions(CreateNewAuction createnewauction) async {
    try {
      await apiService.postApi(AppUrls.createNewAuction, createnewauction);

      return true;
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  //get all bids of a single auction
  Future<GetBidsOfAnAuction> getAllBidsofAnAuction(
      {required String auctionId}) async {
    try {
      final response =
          await apiService.getApi("${AppUrls.getBidsOfAnAuction}$auctionId");
      return GetBidsOfAnAuction.fromJson(response);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  //Win bid by customer this method is called on auction report vehicle screen
  //where there are bids and the highest one will win
  Future<bool> bidwonbycustomer(BidWonByCustomer bidwonbycustomer) async {
    final url = Uri.parse(AppUrls.bidWonByCustomer);
    var request = http.MultipartRequest("POST", url);
    request.fields['contact'] = bidwonbycustomer.contact.toString();
    request.fields['bid_amount'] = bidwonbycustomer.bidAmount.toString();
    request.fields[bidwonbycustomer.partId != null ? 'part_id' : 'chassis'] =
        bidwonbycustomer.partId != null
            ? bidwonbycustomer.partId.toString()
            : bidwonbycustomer.chassis.toString();
    request.headers['Content-Type'] = 'multipart/form-data';
    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        Get.dialog(CustomSuccessDialog(
          title: 'Congratulations',
          message: "$responseBody",
          onConfirm: () {
            Get.back();
          },
          icon: "assets/icons/done.png",
        ));
        return true;
      } else {
        var responseBody = jsonDecode(response.body);
        Get.dialog(CustomSuccessDialog(
          title: 'Error',
          message: "$responseBody",
          onConfirm: () {
            Get.back();
          },
          icon: "assets/icons/done.png",
        ));
        return false;
      }
    } catch (e) {
      return true;
    }
  }

  //get all contacts  of a customer
  Future<CustomerContacts> getAllContactsofCustomers() async {
    try {
      final response = await apiService.getApi(AppUrls.getAllcustomerContacts);
      return CustomerContacts.fromJson(response);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  //get details of customer through his contact
  Future<GetCustomerDetailsByContactNumberModel>
      getCustomerDetailsByContactNumber(String contact) async {
    final url = Uri.parse(AppUrls.fetchCustomerDetailsByPhoneNumber);

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "contact": contact,
      }),
    );

    if (response.statusCode == 200) {
      return GetCustomerDetailsByContactNumberModel.fromJson(
          jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  //add new bids to the auction
  Future<bool> sendCustomerDataToCart(AddNewBid addnewbid) async {
    final url = Uri.parse(AppUrls.addnewBids);

    var request = http.MultipartRequest('POST', url);

    // Add normal form fields
    request.fields['name'] = addnewbid.name.toString();
    request.fields['contact'] = addnewbid.contact.toString();
    request.fields['auction_id'] = addnewbid.auctionId.toString();

    // Ensure lists are not null before mapping
    request.fields['vehicles'] =
        jsonEncode((addnewbid.vehicles ?? []).map((v) => v.toJson()).toList());
    request.fields['parts'] =
        jsonEncode((addnewbid.parts ?? []).map((p) => p.toJson()).toList());

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print('Success: ${response.body}');
        return true;
      } else {
        print('Failed: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      return false;
    }
  }

  Future<bool> addnewBidsToAuctionWithNewCustomerRegisteration({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String status,
    required String auctionId,
    List<CustomerVehicle>? vehicles,
    List<CustomerPart>? parts,
  }) async {
    final url = Uri.parse(AppUrls.admin_signupuid_bidadding_customer);

    // Build JSON body
    final body = {
      "firstname": firstName,
      "lastname": lastName,
      "auction_id": auctionId,
      "phonenumber": phoneNumber,
      "role": "customer",
      "status": status,
      "address": "",
      "email": "",
      "emirates_id": "",
      "vehicles": (vehicles ?? []).map((v) => v.toJson()).toList(),
      "parts": (parts ?? []).map((p) => p.toJson()).toList(),
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print('Success: ${response.body}');
        return true;
      } else {
        print('Failed: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      return false;
    }
  }
}
