import 'package:auction_app/app/modules/barcodescanner.dart';
import 'package:auction_app/app/modules/modules.dart';

import '../controllers/additems_tocontainer_scanner_controller.dart';

class AdditemsTocontainerScannerView
    extends GetView<AdditemsTocontainerScannerController> {
  const AdditemsTocontainerScannerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: screenPadding,
          child: Column(
            children: [
              20.heightBox,
              Row(
                mainAxisAlignment: mainAxisSpaceBetween,
                children: [
                  BackTitleRow(title: "Add Products"),
                  RoundButton(
                    backgroundColor: AppColors.secondaryColor,
                    radius: 5,
                    text: "Next",
                    onPressed: () {
                      Get.toNamed(Routes.ADDITEMS_TOCONTAINER_SCANNER);
                    },
                    fontsize: 12,
                    padding: 0,
                  ).box.height(30).make(),
                ],
              ),
              HeightBox(context.height * 0.3),
              Column(
                children: [
                  Text(
                    "Add Products",
                    style: context.headlineSmall,
                  ),
                  10.heightBox,
                  Text(
                    "Scan the car barcode by your phone to add a new car here.",
                    textAlign: textAlignCenter,
                    style: context.bodyMedium!
                        .copyWith(color: AppColors.textColorSecondary),
                  ),
                  10.heightBox,
                  RoundButton(
                      radius: 10,
                      fontsize: 14,
                      icon: Iconsax.scan,
                      backgroundColor: AppColors.primaryColor,
                      text: "Scan Now",
                      onPressed: () async {
                        try {
                          Get.to(() => BarcodeScannerScreen());
                        } catch (e) {
                          print(e);
                        }
                      }).box.width(context.width * 0.4).make(),
                ],
              )
            ],
          ),
        ));
  }
}
