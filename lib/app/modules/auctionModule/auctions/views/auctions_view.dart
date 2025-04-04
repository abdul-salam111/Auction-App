import '../../../modules.dart';

class AuctionsView extends GetView<AuctionsController> {
  const AuctionsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AuctionsController());
    return GestureDetector(
      onTap: () {
        controller.searchFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Obx(() => Padding(
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
                        "Auctions",
                        style: context.displayLarge!.copyWith(
                            fontWeight: FontWeight.w900, fontSize: 14),
                      ),
                      10.widthBox,
                      PopupMenuButton<String>(
                        onSelected: (String value) {
                          controller.selectedStatus.value = value;
                          controller.filterData();
                        },
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            value: 'All',
                            child: Text('All'),
                          ),
                          PopupMenuItem(
                            value: 'Active',
                            child: Text('Active'),
                          ),
                          PopupMenuItem(
                            value: 'Closed',
                            child: Text('Closed'),
                          ),
                        ],
                        child: Container(
                          padding: padding5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: AppColors.borderColor, width: 1),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(
                                () => Text(controller.selectedStatus.value,
                                    style: context.bodySmall),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                            ],
                          ),
                        ),
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
                        await controller.downloadExcel();
                      }),
                      5.widthBox,
                      5.widthBox,
                      Expanded(
                        child: TextField(
                          focusNode: controller.searchFocusNode,
                          cursorHeight: 15,
                          onChanged: (value) => controller.searchAuction(value),
                          style: context.displayLarge!.copyWith(fontSize: 14),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
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
                        "Total: ",
                        style: context.bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${controller.filteredData.length}",
                        style: context.bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Iconsax.add, color: AppColors.backgroundColor)
                          .box
                          .p4
                          .color(AppColors.secondaryColor)
                          .roundedSM
                          .make()
                          .onTap(() {
                        Get.toNamed(Routes.CREATENEWAUCTION);
                      }),
                    ],
                  )
                      .box
                      .p8
                      .roundedSM
                      .color(AppColors.secondaryColor
                          .withAlpha((0.2 * 255).toInt()))
                      .width(double.infinity)
                      .border(color: AppColors.secondaryColor)
                      .make(),
                  5.heightBox,
                  Divider(),
                  5.heightBox,
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
                        Text('Auction Name',
                            style: context.displayLarge!
                                .copyWith(fontWeight: FontWeight.bold)),
                        Text('Date',
                            style: context.displayLarge!
                                .copyWith(fontWeight: FontWeight.bold)),
                        Text('Status',
                                style: context.displayLarge!
                                    .copyWith(fontWeight: FontWeight.bold))
                            .marginOnly(left: context.width * 0.1),
                        Text('Cars',
                                style: context.displayLarge!
                                    .copyWith(fontWeight: FontWeight.bold))
                            .marginOnly(left: context.width * 0.05),
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
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  item.auctionName ?? '',
                                                  style: context.displayLarge)),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  item.createdAt!
                                                      .toSimpleDate(),
                                                  style: context.displayLarge)),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color:
                                                    item.auctionStatus == true
                                                        ? Colors.green[100]
                                                        : Colors.red[100],
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  item.auctionStatus == true
                                                      ? 'Active'
                                                      : "Closed",
                                                  style: context.displayLarge!
                                                      .copyWith(
                                                          color:
                                                              item.auctionStatus ==
                                                                      true
                                                                  ? Colors.green
                                                                  : Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: context.width * 0.04),
                                                child: Text(
                                                    item.count.toString(),
                                                    style:
                                                        context.displayLarge),
                                              )),
                                          Expanded(
                                            flex: 1,
                                            child: Obx(
                                              () => IconButton(
                                                icon: Icon(
                                                  controller.expandedRows
                                                          .contains(item.id)
                                                      ? Iconsax.arrow_square_up
                                                      : Iconsax
                                                          .arrow_square_down,
                                                  color: AppColors
                                                      .buttonDisabledColor,
                                                  size: 20,
                                                ),
                                                onPressed: () => controller
                                                    .toggleExpandRow(item.id!),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Obx(() => controller.expandedRows
                                              .contains(item.id)
                                          ? Row(
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Text('Location',
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
                                                          child: Text(
                                                            item.auctionLocation ??
                                                                '',
                                                            style: context
                                                                .displayLarge,
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
                                                    onTap: () {
                                                      Get.toNamed(
                                                          Routes
                                                              .AUCTIONREPORT_VEHICLES,
                                                          arguments: item.id
                                                              .toString());
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              6),
                                                      decoration: BoxDecoration(
                                                        color: Colors.orange,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: const Icon(
                                                          Icons.visibility,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                              .box
                                              .margin(
                                                  EdgeInsets.only(bottom: 3))
                                              .make()
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
      ),
    );
  }
}
