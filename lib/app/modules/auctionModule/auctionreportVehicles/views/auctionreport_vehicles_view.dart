import 'package:auction_app/app/data/postModels/bid_won_by_customer.dart';
import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/utils/utils.dart';
import 'package:flutter/foundation.dart';

class AuctionreportVehiclesView
    extends GetView<AuctionreportVehiclesController> {
  const AuctionreportVehiclesView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.searchFocusNode.unfocus();
      },
      child: Scaffold(
          appBar: CustomAppBar(),
          body: Padding(
            padding: screenPadding,
            child: Column(
              children: [
                HeightBox(context.height * 0.03),
                Row(
                  children: [
                    5.widthBox,
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      ),
                    ),
                    5.widthBox,
                    Text(
                      "Auction Report - Vehicles",
                      style: context.displayLarge!
                          .copyWith(fontWeight: FontWeight.w900, fontSize: 14),
                    ),
                    10.widthBox,
                    Icon(
                      Iconsax.import,
                      color: AppColors.backgroundColor,
                    )
                        .box
                        .p4
                        .color(context.primaryColor)
                        .roundedSM
                        .make()
                        .onTap(() async {
                      //await controller.downloadExcel();
                    }),
                    5.widthBox,
                    Expanded(
                      child: TextField(
                        focusNode: controller.searchFocusNode,
                        cursorHeight: 15,
                        onChanged: (value) => controller.searchAuction(value),
                        style: context.displayLarge!.copyWith(fontSize: 14),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          prefixIconConstraints:
                              BoxConstraints(minWidth: 25, minHeight: 25),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: AppColors.borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: AppColors.borderColor),
                          ),
                          hintText: "Search",
                          prefixIcon: Icon(Iconsax.search_normal, size: 15),
                          hintStyle:
                              context.displayLarge!.copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                10.heightBox,
                Row(
                  children: [
                    Text(
                      "Add New Bid",
                      style: context.bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    PopupMenuButton<String>(
                      padding: EdgeInsets.zero,
                      iconSize: 20,
                      icon: Icon(
                        Icons.add,
                        color: AppColors.textColorWhite,
                      ).box.p4.color(AppColors.secondaryColor).roundedSM.make(),
                      onSelected: (String value) {
                        Get.toNamed(Routes.ADDNEWBID,
                            arguments: [value, controller.auctionId]);
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            value: '0',
                            child: Text('New Customer'),
                          ),
                          PopupMenuItem(
                            value: '1',
                            child: Text('Existing Customer'),
                          ),
                        ];
                      },
                      color: Colors.white,
                    )
                  ],
                )
                    .box
                    .px8
                    .roundedSM
                    .color(
                        AppColors.secondaryColor.withAlpha((0.2 * 255).toInt()))
                    .width(double.infinity)
                    .border(color: AppColors.secondaryColor)
                    .make(),
                Divider(),
                Container(
                  padding: padding10,
                  decoration: BoxDecoration(
                      color: Color(0xffF5F7FA),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: mainAxisSpaceBetween,
                    children: [
                      Text('Contact',
                          style: context.displayLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text('Name',
                              style: context.displayLarge!
                                  .copyWith(fontWeight: FontWeight.bold))
                          .marginOnly(left: context.width * 0.07),
                      Text('Vehicle Name',
                              style: context.displayLarge!
                                  .copyWith(fontWeight: FontWeight.bold))
                          .marginOnly(left: context.width * 0.1),
                      // Text('Chasis No',
                      //         style: context.displayLarge!
                      //             .copyWith(fontWeight: FontWeight.bold))
                      //     .marginOnly(left: context.width * 0.05),
                      Text('More',
                          style: context.displayLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? Expanded(
                          child: Center(
                            child: LoadingIndicator(
                              size: 40,
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: controller.paginatedData.length,
                            itemBuilder: (context, index) {
                              var item = controller.paginatedData[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: index % 2 != 0
                                      ? Color(0xffF5F7FA)
                                      : Colors.white,
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[300]!),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: mainAxisSpaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                item.phoneNumber.toString(),
                                                style: context.displayLarge)),
                                        Expanded(
                                            flex: 2,
                                            child: Text(item.name.toString(),
                                                style: context.displayLarge)),
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: context.width * 0.04),
                                              child: Text(
                                                  item.vehicle != null
                                                      ? item.vehicle.toString()
                                                      : item.sparepart
                                                          .toString(),
                                                  style: context.displayLarge),
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: Obx(
                                            () => IconButton(
                                              icon: Icon(
                                                controller.expandedRows
                                                        .contains(item.itemId)
                                                    ? Iconsax.arrow_square_up
                                                    : Iconsax.arrow_square_down,
                                                color: AppColors
                                                    .buttonDisabledColor,
                                                size: 20,
                                              ),
                                              onPressed: () =>
                                                  controller.toggleExpandRow(
                                                      item.itemId!),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Obx(() => controller.expandedRows
                                            .contains(item.itemId)
                                        ? Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Text('Created On',
                                                            style: context
                                                                .displayLarge!
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                        20.widthBox,
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                defaultPadding,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[200],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  centerRight,
                                                              child: Text(
                                                                "${item.createdAt!.toSimpleDate()} | ${item.createdAt!.hour}:${item.createdAt!.minute}",
                                                                style: context
                                                                    .displayLarge,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                        .box
                                                        .border(
                                                            color: AppColors
                                                                .borderColor)
                                                        .roundedSM
                                                        .p4
                                                        .make(),
                                                  ),
                                                  10.widthBox,
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                      
                                                        await controller.bidwonBycustomer(
                                                            item.vehicleChassis !=
                                                                    null
                                                                ? BidWonByCustomer(
                                                                    contact: item
                                                                        .phoneNumber
                                                                        .toString(),
                                                                    chassis: item
                                                                        .vehicleChassis
                                                                        .toString(),
                                                                    bidAmount: item
                                                                        .bidAmount
                                                                        .toString(),
                                                                  )
                                                                : BidWonByCustomer(
                                                                    contact: item
                                                                        .phoneNumber
                                                                        .toString(),
                                                                    partId: item
                                                                        .sparepartId
                                                                        .toString(),
                                                                    bidAmount: item
                                                                        .bidAmount
                                                                        .toString(),
                                                                  ));
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(6),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .secondaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Image.asset(
                                                            "assets/icons/trophy.png",
                                                            width: 20,
                                                            height: 20,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                                  .box
                                                  .margin(EdgeInsets.only(
                                                      bottom: 3))
                                                  .make(),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Text('Bid Amount',
                                                            style: context
                                                                .displayLarge!
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                        5.widthBox,
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                defaultPadding,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[200],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  centerRight,
                                                              child: Text(
                                                                "${item.bidAmount}",
                                                                style: context
                                                                    .displayLarge,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                        .box
                                                        .border(
                                                            color: AppColors
                                                                .borderColor)
                                                        .roundedSM
                                                        .p4
                                                        .make(),
                                                  ),
                                                  10.widthBox,
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Text('Chasis No/Id',
                                                            style: context
                                                                .displayLarge!
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                        5.widthBox,
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                defaultPadding,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[200],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  centerRight,
                                                              child: Text(
                                                                item.vehicleChassis !=
                                                                        null
                                                                    ? item
                                                                        .vehicleChassis
                                                                        .toString()
                                                                    : item
                                                                        .sparepartId
                                                                        .toString(),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: context
                                                                    .displayLarge,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                        .box
                                                        .border(
                                                            color: AppColors
                                                                .borderColor)
                                                        .roundedSM
                                                        .p4
                                                        .make(),
                                                  ),
                                                ],
                                              )
                                                  .box
                                                  .margin(EdgeInsets.only(
                                                      bottom: 3))
                                                  .make()
                                            ],
                                          )
                                        : SizedBox.shrink()),
                                  ],
                                ),
                              );
                            },
                          )
                              .box
                              .border(color: AppColors.borderColor)
                              .bottomRounded(value: 5)
                              .make(),
                        ),
                ),
                Obx(() => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                      child: SizedBox(
                        height: 50,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: controller.buildPagination()),
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}
