import 'package:auction_app/app/modules/modules.dart';

class ContainerView extends GetView<ContainerController> {
  const ContainerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Obx(
          () => controller.gettingContainers.value
              ? Center(
                  child: LoadingIndicator(),
                )
              : Padding(
                  padding: screenPadding,
                  child: Column(
                    crossAxisAlignment: crossAxisStart,
                    children: [
                      20.heightBox,
                      DetailsBoxes(
                          firstheading: "Shipper",
                          firstsubheading:
                              "${controller.containerDetails.value.data?.first.container?.shipper}",
                          secondheading: "Shipping Company",
                          secondsubheading:
                              "${controller.containerDetails.value.data?.first.container?.shippingCompany}"),
                      10.heightBox,
                      DetailsBoxes(
                          firstheading: "BL Number",
                          firstsubheading:
                              "${controller.containerDetails.value.data?.first.container?.blNumber}",
                          secondheading: "Container Number",
                          secondsubheading:
                              "${controller.containerDetails.value.data?.first.container?.containerNumber}"),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DetailsBoxes(
                                firstheading: "Seal Number",
                                firstsubheading:
                                    "${controller.containerDetails.value.data?.first.container?.sealNumber}",
                                secondheading: "Gross Weight",
                                secondsubheading:
                                    "${controller.containerDetails.value.data?.first.container?.grossWeight}"),
                          ),
                          10.widthBox,
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: padding14,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: crossAxisStart,
                                children: [
                                  Text(
                                    "No of Units",
                                    style: context.bodySmall!
                                        .copyWith(fontSize: 14),
                                  ),
                                  Text(
                                    "${controller.containerDetails.value.data?.first.container?.noOfUnits}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      DetailsBoxes(
                          firstheading: "Loading Port",
                          firstsubheading:
                              "${controller.containerDetails.value.data?.first.container?.portOfLoading}",
                          secondheading: "Discharge Port",
                          secondsubheading:
                              "${controller.containerDetails.value.data?.first.container?.portOfDischarge}"),
                      20.heightBox,
                      Row(
                        children: [
                          Text(
                            "${controller.isVehicle ? "Cars" : "Parts"} Added",
                            style: context.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          5.widthBox,
                          Row(
                            mainAxisAlignment: mainAxisCenter,
                            children: [
                              Icon(
                                controller.isVehicle
                                    ? Iconsax.car
                                    : Iconsax.setting,
                                color: Colors.white,
                                size: 20,
                              ),
                              5.widthBox,
                              Text(
                                controller.isVehicle ? "Cars" : "Parts",
                                style: context.bodySmall!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          )
                              .box
                              .roundedSM
                              .p4
                              .color(AppColors.primaryColor)
                              .make(),
                          Spacer(),
                          Icon(Iconsax.import,
                                  color: AppColors.textColorSecondary)
                              .box
                              .p4
                              .color(AppColors.halfwhiteColor)
                              .roundedSM
                              .make()
                              .onTap(() async {
                            // await controller.downloadExcel();
                          }),
                          2.widthBox,
                          Row(
                            mainAxisAlignment: mainAxisCenter,
                            children: [
                              Icon(
                                Iconsax.add_circle,
                                color: Colors.white,
                              ),
                              5.widthBox,
                              Text(
                                "Add ${controller.isVehicle ? "Cars" : "Parts"}",
                                style: context.bodySmall!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          )
                              .box
                              .roundedSM
                              .p4
                              .color(AppColors.secondaryColor)
                              .make()
                              .onTap(() {}),
                        ],
                      ),
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
                            Text('Id',
                                style: context.displayLarge!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text('Type',
                                style: context.displayLarge!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text('Make',
                                    style: context.displayLarge!
                                        .copyWith(fontWeight: FontWeight.bold))
                                .marginOnly(left: context.width * 0.05),
                            Text('Model',
                                style: context.displayLarge!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text('More',
                                style: context.displayLarge!
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Expanded(
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
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(item.id.toString(),
                                              style: context.displayLarge)),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                                  controller.isVehicle
                                                      ? "Vehicle"
                                                      : "Spare Part",
                                                  style: context.displayLarge)
                                              .marginOnly(left: 10)),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                            child: Text(item.make ?? '',
                                                style: context.displayLarge)),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: context.width * 0.03),
                                            child: Text(item.model ?? '',
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
                                      ? Row(
                                          children: [
                                            controller.isVehicle
                                                ? Expanded(
                                                    child: Row(
                                                      children: [
                                                        Text('Chasis No:',
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
                                                              item.chassisNumber ??
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
                                                  )
                                                : SizedBox.shrink(),
                                            10.widthBox,
                                            Row(
                                              children: [
                                                !controller.isVehicle
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .successColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Text(
                                                          "View Images",
                                                          style: context
                                                              .displayLarge!
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      )
                                                    : SizedBox.shrink(),
                                                !controller.isVehicle
                                                    ? 10.widthBox
                                                    : SizedBox.shrink(),
                                                !controller.isVehicle
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .buttonColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Text(
                                                          "Change Status",
                                                          style: context
                                                              .displayLarge!
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      )
                                                    : SizedBox.shrink(),
                                                10.widthBox,
                                                Container(
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
                                              ],
                                            ),
                                          ],
                                        )
                                          .box
                                          .margin(EdgeInsets.only(bottom: 3))
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
                      Obx(() => Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8),
                              child: SizedBox(
                                height: 50,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: controller.buildPagination()),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
        ));
  }
}
