import 'package:auction_app/app/modules/modules.dart';
import 'package:shimmer/shimmer.dart';

class ManagecontainersView extends GetView<ManagecontainersController> {
  const ManagecontainersView({super.key});
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
            child: Column(children: [
              Column(
                children: [
                  SizedBox(height: context.height * 0.03),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Manage Containers",
                        style: context.displayLarge!.copyWith(
                            fontWeight: FontWeight.w900, fontSize: 14),
                      ),
                      SizedBox(width: 10),
                      Icon(Iconsax.import, color: AppColors.primaryColor)
                          .box
                          .p4
                          .color(AppColors.halfwhiteColor)
                          .roundedSM
                          .make()
                          .onTap(() async {
                        await controller.downloadExcel();
                      }),
                      SizedBox(width: 5),
                      Expanded(
                        child: TextField(
                          focusNode: controller.searchFocusNode,
                          cursorHeight: 15,
                          onChanged: (value) => controller.search(value),
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
                ],
              ),
              10.heightBox,
              Row(
                  children: List.generate(3, (index) {
                return Expanded(
                  child: Padding(
                    padding: symmetricHorizontal5,
                    child: Column(
                      crossAxisAlignment: crossAxisStart,
                      children: [
                        Icon(
                          Iconsax.truck3,
                          size: 15,
                          color: index == 0
                              ? AppColors.secondaryColor
                              : index == 1
                                  ? AppColors.warningColor
                                  : AppColors.primaryColor,
                        )
                            .box
                            .p4
                            .roundedSM
                            .color((index == 0
                                    ? AppColors.secondaryColor
                                    : index == 1
                                        ? AppColors.warningColor
                                        : AppColors.primaryColor)
                                .withAlpha((0.2 * 255).toInt()))
                            .make(),
                        15.heightBox,
                        Text(
                          index == 0
                              ? "Total Containers"
                              : index == 1
                                  ? "Arrived Containers"
                                  : "Upcoming Containers",
                          style: context.displayLarge!.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.textColorSecondary),
                        ),
                        Obx(
                          () => Text(
                            index == 0
                                ? controller.getcontainresCount.value.total
                                    .toString()
                                : index == 1
                                    ? controller
                                        .getcontainresCount.value.arrived
                                        .toString()
                                    : controller
                                        .getcontainresCount.value.upcoming
                                        .toString(),
                            style: context.bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                        .box
                        .p8
                        .border(color: AppColors.borderColor)
                        .rounded
                        .make(),
                  ),
                );
              })),
              10.heightBox,
              Row(
                children: [
                  Text(
                    "Add New Container",
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

                  // PopupMenuButton<String>(
                  //   padding: EdgeInsets.zero,
                  //   iconSize: 20,
                  //   icon: Icon(
                  //     Icons.add,
                  //     color: AppColors.textColorWhite,
                  //   ).box.p4.color(AppColors.secondaryColor).roundedSM.make(),
                  //   onSelected: (String value) {},
                  //   itemBuilder: (BuildContext context) {
                  //     return [
                  //       PopupMenuItem(
                  //         value: 'Car',
                  //         child: Text('Car'),
                  //       ),
                  //       PopupMenuItem(
                  //         value: 'Truck',
                  //         child: Text('Truck'),
                  //       ),
                  //       PopupMenuItem(
                  //         value: 'Spare part',
                  //         child: Text('Spare part'),
                  //       ),
                  //     ];
                  //   },
                  //   color: Colors.white,
                  // )
                ],
              )
                  .box
                  .p8
                  .roundedSM
                  .color(
                      AppColors.secondaryColor.withAlpha((0.2 * 255).toInt()))
                  .width(double.infinity)
                  .border(color: AppColors.secondaryColor)
                  .make()
                  .onTap(() {
                Get.toNamed(Routes.ADDCONTAINER);
              }),
              10.heightBox,
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
                    Text('Container No',
                        style: context.displayLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Text('BL No',
                            style: context.displayLarge!
                                .copyWith(fontWeight: FontWeight.bold))
                        .marginOnly(left: 10),
                    Text('Arrival Date',
                            style: context.displayLarge!
                                .copyWith(fontWeight: FontWeight.bold))
                        .marginOnly(left: context.width * 0.07),
                    Text('Total Items',
                        style: context.displayLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Text('More',
                        style: context.displayLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Obx(
                () => controller.isLoading.value
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[200]!,
                              highlightColor: Colors.grey[100]!,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            );
                          },
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
                                  bottom: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: crossAxisCenter,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text("${item.containerNumber}",
                                              style: context.displayLarge)),
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: symmetricHorizontal5,
                                            child: Text(
                                                item.blNumber.toString(),
                                                style: context.displayLarge),
                                          )),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          item.createdAt!
                                              .toSimpleDate()
                                              .toString(),
                                          style: context.displayLarge!,
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: context.width * 0.04),
                                            child: Text(
                                                item.noOfUnits.toString(),
                                                style: context.displayLarge),
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: Obx(
                                          () => IconButton(
                                            icon: Icon(
                                              controller.expandedRows
                                                      .contains(item.id)
                                                  ? Iconsax.arrow_square_up
                                                  : Iconsax.arrow_square_down,
                                              color:
                                                  AppColors.buttonDisabledColor,
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
                                      ? Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Row(
                                                    children: [
                                                      Text('Est Arr Date',
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
                                                            item.createdAt!
                                                                .toSimpleDate(),
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
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Text('Status',
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
                                                            color: AppColors
                                                                .secondaryColor
                                                                .withAlpha((0.2 *
                                                                        255)
                                                                    .toInt()),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              item.status ?? '',
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
                                                .margin(
                                                    EdgeInsets.only(bottom: 3))
                                                .make(),
                                            Row(
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
                                                      10.widthBox,
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
                                                            item.portOfDischarge ??
                                                                '',
                                                            maxLines: 1,
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
                                                5.widthBox,
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        Routes.EDITCONTAINERS,
                                                        arguments:
                                                            item.id.toString());
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: const Icon(
                                                        Icons.edit,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                5.widthBox,
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        Routes.CONTAINER,
                                                        arguments:
                                                            item.id.toString());
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: const Icon(
                                                        Icons.visibility,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                5.widthBox,
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.dialog(
                                                      DeletePopup(
                                                          title:
                                                              "Delete Container",
                                                          message:
                                                              "Are you sure you want to delete this Container?",
                                                          onConfirm: () async {
                                                            Get.back();
                                                            await controller
                                                                .deleteContainer(item
                                                                    .id
                                                                    .toString());
                                                          },
                                                          icon:
                                                              "assets/icons/delete.png"),
                                                    );
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.errorColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: const Icon(
                                                        Iconsax.trash,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            )
                                                .box
                                                .margin(
                                                    EdgeInsets.only(bottom: 3))
                                                .make(),
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
            ]),
          )),
    );
  }
}
