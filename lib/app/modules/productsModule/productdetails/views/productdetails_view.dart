import 'package:auction_app/app/modules/modules.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductdetailsView extends GetView<ProductdetailsController> {
  ProductdetailsView({super.key});
  @override
  final controller = Get.put(ProductdetailsController());
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: screenPadding,
            child: Column(
              crossAxisAlignment: crossAxisStart,
              children: [
                20.heightBox,
                Row(
                  children: [
                    BackTitleRow(title: "Product Details"),
                    Spacer(),
                    !controller.isupdateSalesScreen.value
                        ? GestureDetector(
                            onTap: () {
                              if (controller.classificaction.value ==
                                  "vehicle") {
                                Get.dialog(
                                  DeletePopup(
                                      title: "Delete Car",
                                      message:
                                          "Are you sure you want to delete this car?",
                                      onConfirm: () async {
                                        await controller
                                            .deleteCar(controller.itemId.value);
                                        Get.back();
                                        Get.back();
                                      },
                                      icon: "assets/icons/delete.png"),
                                );
                              } else if (controller.classificaction.value ==
                                  "truck") {
                                Get.dialog(
                                  DeletePopup(
                                      title: "Delete Truck",
                                      message:
                                          "Are you sure you want to delete this Truck?",
                                      onConfirm: () async {
                                        await controller.deleteTruck(
                                            controller.itemId.value);
                                        Get.back();
                                        Get.back();
                                      },
                                      icon: "assets/icons/delete.png"),
                                );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.errorColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Iconsax.trash,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    // 5.widthBox,
                    // !controller.isupdateSalesScreen.value
                    //     ? GestureDetector(
                    //         onTap: () {
                    //           Get.to(() => AddNewTruck());
                    //         },
                    //         child: Container(
                    //           padding: const EdgeInsets.all(8),
                    //           decoration: BoxDecoration(
                    //             color: AppColors.primaryColor,
                    //             borderRadius: BorderRadius.circular(8),
                    //           ),
                    //           child: const Icon(
                    //             Iconsax.add,
                    //             color: AppColors.textColorWhite,
                    //             size: 15,
                    //           ),
                    //         ),
                    //       )
                    //     : SizedBox.shrink(),
                    5.widthBox,
                    // Container(
                    //     padding: const EdgeInsets.all(8),
                    //     decoration: BoxDecoration(
                    //       color: AppColors.secondaryColor,
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     child: Text(
                    //         controller.status.value == "Outofstock"
                    //             ? "Sold"
                    //             : "In Stock",
                    //         style: context.bodySmall!.copyWith(
                    //             color: AppColors.textColorWhite,
                    //             fontSize: 12))),
                    5.widthBox,
                    !controller.isupdateSalesScreen.value
                        ? GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.EDITPRODUCTTDETAILS,
                                  arguments: [
                                    controller.itemId.value,
                                    controller.chasisnumber.value,
                                    controller.name.value,
                                    controller.model.value,
                                    controller.totatlPrice.value,
                                    controller.category.value,
                                    controller.color.value,
                                    controller.make.value,
                                    controller.year.value,
                                    controller.fueltype.value,
                                    controller.transmission.value,
                                    controller.condition.value,
                                    controller.mileage.value,
                                    controller.soldPrice.value,
                                    controller.status.value,
                                    controller.description.value,
                                    controller.recievedAmount.value,
                                    controller.balanceAmount.value,
                                    controller.classificaction.value,
                                    controller.category.value,
                                  ]);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text("Edit",
                                    style: context.bodySmall!.copyWith(
                                        color: AppColors.textColorWhite,
                                        fontSize: 12))),
                          )
                        : SizedBox.shrink(),
                    controller.isupdateSalesScreen.value
                        ? double.parse(controller.balanceAmount.value) >= 0
                            ? GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.EDITPRODUCT, arguments: [
                                    controller.soldPrice.value,
                                    controller.recievedAmount.value,
                                    controller.balanceAmount.value,
                                    controller.chasisnumber.value,
                                    controller.classificaction.value,
                                    controller.itemId.value,
                                  ]);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: defaultPadding,
                                  child: Text(
                                    "Update recieved Amount",
                                    style: context.displayMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              )
                            : SizedBox.shrink()
                        : SizedBox.shrink()
                  ],
                ),
                10.heightBox,
                Text('Status', style: context.bodyMedium),
                const SizedBox(height: 8),
                controller.isupdateSalesScreen.value != true
                    ? Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: controller.selectedStatus.value,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_rounded),
                                    iconSize: 24,
                                    elevation: 2,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    dropdownColor: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    onChanged: (String? newValue) {
                                      controller.selectedStatus.value =
                                          newValue!;
                                      if (controller.selectedStatus.value ==
                                          "Outofstock") {
                                        Get.toNamed(Routes.EDITPRODUCT,
                                            arguments: [
                                              controller.soldPrice.value,
                                              controller.recievedAmount.value,
                                              controller.balanceAmount.value,
                                              controller.chasisnumber.value,
                                              controller.classificaction.value,
                                              controller.itemId.value
                                            ]);
                                      }
                                    },
                                    items: controller.statusOptions
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          5.widthBox,
                          ElevatedButton(
                            onPressed: () {
                              // Get.to(() => ScanProductDetails());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3166F5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.gavel_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Text('Add to Live Auction',
                                    style: context.bodyMedium!.copyWith(
                                        color: AppColors.backgroundColor)),
                              ],
                            ),
                          )
                        ],
                      )
                    : SizedBox.shrink(),
                !controller.isupdateSalesScreen.value != true
                    ? Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Sold in AED ${controller.soldPrice.value}",
                          style: context.bodyMedium!.copyWith(
                            color: AppColors.textColorWhite,
                            fontSize: 14,
                          ),
                        )),
                      )
                    : SizedBox.shrink(),
                !controller.isupdateSalesScreen.value != true
                    ? 10.heightBox
                    : SizedBox.shrink(),
                !controller.isupdateSalesScreen.value != true
                    ? Row(
                        children: [
                          Expanded(
                              child: Container(
                            padding: defaultPadding,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: AppColors.borderColor)),
                            child: Column(
                              crossAxisAlignment: crossAxisStart,
                              children: [
                                Image.asset(
                                  "assets/icons/moneygreen.png",
                                  width: 30,
                                  height: 30,
                                ),
                                10.heightBox,
                                Text(
                                  "Recieved Amount",
                                  style: context.bodySmall,
                                ),
                                5.heightBox,
                                Text(
                                  "AED ${controller.recievedAmount.value}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          )),
                          10.widthBox,
                          Expanded(
                              child: Container(
                            padding: defaultPadding,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: AppColors.borderColor)),
                            child: Column(
                              crossAxisAlignment: crossAxisStart,
                              children: [
                                Image.asset(
                                  "assets/icons/moneyyello.png",
                                  height: 30,
                                  width: 30,
                                ),
                                10.heightBox,
                                Text(
                                  "Balance Amount",
                                  style: context.bodySmall,
                                ),
                                5.heightBox,
                                Text(
                                  "AED ${controller.balanceAmount.value}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ))
                        ],
                      )
                    : SizedBox.shrink(),
                10.heightBox,
                Stack(
                  alignment: bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0.0),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: controller.carImages.length,
                        onPageChanged: controller.onPageChanged,
                        itemBuilder: (context, index) {
                          return Image.network(
                            controller.carImages[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: controller.carImages.length,
                          effect: WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            activeDotColor: Colors.white,
                            dotColor: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                5.heightBox,
                DetailsBoxes(
                  firstheading: "Item ID",
                  firstsubheading: controller.itemId.value,
                  secondheading:
                      (controller.classificaction.value == "vehicle" ||
                              controller.classificaction.value == "truck")
                          ? "Chassis No"
                          : "Name",
                  secondsubheading:
                      (controller.classificaction.value == "vehicle" ||
                              controller.classificaction.value == "truck")
                          ? controller.chasisnumber.value
                          : controller.name.value,
                ),
                5.heightBox,
                DetailsBoxes(
                  firstheading:
                      (controller.classificaction.value == "vehicle" ||
                              controller.classificaction.value == "truck")
                          ? "Item Name"
                          : "Category",
                  firstsubheading:
                      (controller.classificaction.value == "vehicle" ||
                              controller.classificaction.value == "truck")
                          ? controller.name.value
                          : controller.category.value,
                  secondheading:
                      (controller.classificaction.value == "vehicle" ||
                              controller.classificaction.value == "truck")
                          ? "Color"
                          : "Make",
                  secondsubheading:
                      (controller.classificaction.value == "vehicle" ||
                              controller.classificaction.value == "truck")
                          ? controller.color.value
                          : controller.make.value,
                ),
                5.heightBox,
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: DetailsBoxes(
                        firstheading:
                            (controller.classificaction.value == "vehicle" ||
                                    controller.classificaction.value == "truck")
                                ? "Make"
                                : "Condition",
                        firstsubheading:
                            (controller.classificaction.value == "vehicle" ||
                                    controller.classificaction.value == "truck")
                                ? controller.make.value
                                : controller.condition.value,
                        secondheading: "Model",
                        secondsubheading: controller.model.value,
                      ),
                    ),
                    5.widthBox,
                    (controller.classificaction.value == "vehicle" ||
                            controller.classificaction.value == "truck")
                        ? Expanded(
                            flex: 1,
                            child: Container(
                              padding: padding10,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: crossAxisStart,
                                children: [
                                  Text(
                                    "Year",
                                    style: context.bodySmall!
                                        .copyWith(fontSize: 14),
                                  ),
                                  Text(
                                    controller.year.value,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
                5.heightBox,
                (controller.classificaction.value == "vehicle" ||
                        controller.classificaction.value == "truck")
                    ? DetailsBoxes(
                        firstheading: "Fuel Type",
                        firstsubheading: controller.fueltype.value,
                        secondheading: "Transmission",
                        secondsubheading: controller.transmission.value,
                      )
                    : SizedBox.shrink(),
                5.heightBox,
                (controller.classificaction.value == "vehicle" ||
                        controller.classificaction.value == "truck")
                    ? Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: DetailsBoxes(
                              firstheading: "Conditioned",
                              firstsubheading: controller.condition.value,
                              secondheading: "Price",
                              secondsubheading:
                                  "AED ${controller.totatlPrice.value}",
                            ),
                          ),
                          5.widthBox,
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: padding10,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: crossAxisStart,
                                children: [
                                  Text(
                                    "Milage",
                                    style: context.bodySmall!
                                        .copyWith(fontSize: 14),
                                  ),
                                  Text(
                                    "${controller.mileage.value} Km",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                5.heightBox,
                (controller.classificaction.value == "vehicle" ||
                        controller.classificaction.value == "truck")
                    ? Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: padding10,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: crossAxisStart,
                                children: [
                                  Text(
                                    "Description",
                                    style: context.bodySmall,
                                  ),
                                  Text(
                                    controller.description.value,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                10.heightBox
              ],
            ),
          ),
        ));
  }
}
