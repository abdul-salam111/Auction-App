import 'package:auction_app/app/data/postModels/create_new_auction.dart';
import 'package:auction_app/app/modules/modules.dart';

class CreatenewauctionController extends GetxController {
  var isLoading = false.obs;
  final auctionnameController = TextEditingController().obs;
  final auctionaddressController = TextEditingController().obs;
  var status = false.obs;

  AuctionsRepository auctionsRepository = AuctionsRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final auctioncontroller = Get.put(AuctionsController());
  Future<void> createNewAuction() async {
    try {
      isLoading.value = true;
      bool istrue = await auctionsRepository.createNewAuctions(CreateNewAuction(
          auctionLocation: auctionaddressController.value.text.trim(),
          auctionName: auctionnameController.value.text.trim(),
          auctionStatus: status.value == true ? "1" : '0'));
      if (istrue) {
        Get.dialog(CustomSuccessDialog(
          title: 'Auction Added',
          message: "New Auction has been successfully added.",
          onConfirm: () {
            Get.back();
          },
          icon: "assets/icons/done.png",
        ));
        await auctioncontroller.getAllAuctions();
        auctionaddressController.value.clear();
        auctionnameController.value.clear();
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }
}
