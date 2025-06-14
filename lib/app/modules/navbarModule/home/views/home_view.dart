import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/modules/productsModule/addnewsparepart/bindings/addnewsparepart_binding.dart';
import 'package:auction_app/app/modules/productsModule/addnewsparepart/views/addnewsparepart_view.dart';

import '../../../productsModule/scan_product_details.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: screenPadding,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: crossAxisStart,
                  children: [
                    10.heightBox,
                    Row(
                      mainAxisAlignment: mainAxisSpaceBetween,
                      children: List.generate(2, (index) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              index == 0
                                  ? Get.toNamed(Routes.AUCTIONS)
                                  : Get.defaultDialog(
                                      title: 'Choose an Option',
                                      content: Column(
                                        children: [
                                          10.heightBox,
                                          SizedBox(
                                            width: context.width * 0.6,
                                            child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                              ),
                                              onPressed: () {
                                                Get.back();
                                                Get.toNamed(
                                                    Routes.ADDNEWVEHICLE);
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: AppColors.textColorWhite,
                                              ),
                                              label: Text(
                                                'Add New Vehicle',
                                                style: context.bodyMedium!
                                                    .copyWith(
                                                        color: AppColors
                                                            .backgroundColor),
                                              ),
                                            ),
                                          ),
                                          10.heightBox,
                                          SizedBox(
                                            width: context.width * 0.6,
                                            child: OutlinedButton.icon(
                                              style: OutlinedButton.styleFrom(
                                                side: BorderSide(
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                              onPressed: () {
                                                Get.back();

                                                Get.to(() => AddNewTruck());
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: AppColors.primaryColor,
                                              ),
                                              label: Text(
                                                'Add New Truck',
                                                style: context.bodyMedium!
                                                    .copyWith(
                                                        color: AppColors
                                                            .primaryColor),
                                              ),
                                            ),
                                          ),
                                          10.heightBox,
                                          SizedBox(
                                            width: context.width * 0.6,
                                            child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                              ),
                                              onPressed: () {
                                                Get.back(); // Close the dialog
                                                // Navigate to add product screen
                                                Get.to(
                                                    () => AddnewsparepartView(),
                                                    binding:
                                                        AddnewsparepartBinding());
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: AppColors.textColorWhite,
                                              ),
                                              label: Text(
                                                'Add Spare Part',
                                                style: context.bodyMedium!
                                                    .copyWith(
                                                        color: AppColors
                                                            .backgroundColor),
                                              ),
                                            ),
                                          ),
                                          10.heightBox,
                                          SizedBox(
                                            width: context.width * 0.6,
                                            child: OutlinedButton.icon(
                                              style: OutlinedButton.styleFrom(
                                                side: BorderSide(
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                              onPressed: () {
                                                Get.back();

                                                Get.to(
                                                    () => ScanProductDetails(),
                                                    arguments: false);
                                              },
                                              icon: Icon(
                                                Icons.qr_code_scanner,
                                                color: AppColors.primaryColor,
                                              ),
                                              label: Text(
                                                'Scan Product',
                                                style: context.bodyMedium!
                                                    .copyWith(
                                                        color: AppColors
                                                            .primaryColor),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                      radius: 10,
                                    );
                            },
                            child: Container(
                              height: context.height * 0.15,
                              margin: padding5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.borderColor, width: 1),
                                color: Color(0xffF7F9FB),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(controller.menuItems[index]['icon'],
                                      size: 40, color: Colors.black),
                                  10.heightBox,
                                  Text(controller.menuItems[index]['label'],
                                      style: context.isMobile
                                          ? context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)
                                          : context.bodyMedium!.copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    Row(
                      mainAxisAlignment: mainAxisSpaceBetween,
                      children: List.generate(3, (index) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              index == 0
                                  ? Get.toNamed(Routes.MANAGECUSTOMER)
                                  : index == 1
                                      ? Get.toNamed(Routes.MANAGECONTAINERS)
                                      : Get.to(() => ScanProductDetails(),
                                          arguments: true);
                            },
                            child: Container(
                              height: context.height * 0.15,
                              margin: padding5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.borderColor, width: 1),
                                color: Color(0xffF7F9FB),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(controller.menuItems[index + 2]['icon'],
                                      size: 30, color: Colors.black),
                                  10.heightBox,
                                  Text(controller.menuItems[index + 2]['label'],
                                      style: context.isMobile
                                          ? context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold)
                                          : context.bodyMedium!.copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    15.heightBox,
                    "Current Stock"
                        .text
                        .textStyle(context.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w900, fontSize: 16))
                        .start
                        .make(),
                    10.heightBox,
                    controller.getAllContainersModel.data!.isNotEmpty
                        ? Column(
                            children: List.generate(
                              controller.getAllContainersModel.data!.length > 1
                                  ? 3
                                  : controller
                                      .getAllContainersModel.data!.length,
                              (index) {
                                var data = controller
                                    .getAllContainersModel.data![index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Column(
                                    crossAxisAlignment: crossAxisStart,
                                    children: [
                                      Row(
                                        children: [
                                          "Container: ${data.containerNumber.toString()}"
                                              .text
                                              .textStyle(context.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold))
                                              .make(),
                                          Spacer(),
                                          "${data.noOfUnits} Items"
                                              .text
                                              .textStyle(context.displayLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold))
                                              .center
                                              .make()
                                              .box
                                              .width(context.width * 0.2)
                                              .p8
                                              .roundedSM
                                              .color(Color(0xffF7F9FB))
                                              .make()
                                        ],
                                      ),
                                      5.heightBox,
                                      Row(
                                        children: [
                                          "Last update: ${data.updatedAt!.toFriendlyDateTime()}"
                                              .text
                                              .color(
                                                  AppColors.textColorSecondary)
                                              .textStyle(context.displayLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w900))
                                              .make(),
                                          Spacer(),
                                          Icon(
                                            Iconsax.arrow_right_34,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                      .box
                                      .border(color: AppColors.borderColor)
                                      .roundedSM
                                      .p12
                                      .make(),
                                );
                              },
                            ),
                          )
                        : Center(
                            child: Text("Stock is not available"),
                          ),
                    15.heightBox,
                    "Recent Activity"
                        .text
                        .textStyle(context.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w900, fontSize: 16))
                        .start
                        .make(),
                    10.heightBox,
                    Column(
                      children: List.generate(
                          controller.notifications.length > 10
                              ? 10
                              : controller.notifications.length, (index) {
                        DateTime dateTime = DateTime.parse(controller
                            .notifications[index].createdAt!
                            .split("T")
                            .first);
                        String friendlyDateTime = dateTime.toFriendlyDateTime();
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Icon(Iconsax.notification)
                                  .box
                                  .roundedFull
                                  .p16
                                  .color(Color(0xffF4F6F9))
                                  .make(),
                              10.widthBox,
                              Column(
                                crossAxisAlignment: crossAxisStart,
                                children: [
                                  SizedBox(
                                    width: context.width * 0.5,
                                    child:
                                        "${controller.notifications[index].message}"
                                            .text
                                            .textStyle(context.displayLarge!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold))
                                            .make(),
                                  ),
                                  10.heightBox,
                                  friendlyDateTime.text
                                      .color(AppColors.textColorSecondary)
                                      .textStyle(context.displayLarge!.copyWith(
                                          fontWeight: FontWeight.w900))
                                      .make(),
                                  //10.heightBox,
                                  // "Container A-123"
                                  //     .text
                                  //     .color(AppColors.textColorSecondary)
                                  //     .textStyle(context.displayLarge!.copyWith(
                                  //         fontWeight: FontWeight.w900))
                                  //     .make(),
                                ],
                              ),
                            ],
                          )
                              .box
                              .border(color: AppColors.borderColor)
                              .roundedSM
                              .p12
                              .make(),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
