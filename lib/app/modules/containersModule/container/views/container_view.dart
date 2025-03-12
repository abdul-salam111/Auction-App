import 'package:auction_app/app/modules/modules.dart';

class ContainerView extends GetView<ContainerController> {
  const ContainerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: screenPadding,
          child: Column(
            crossAxisAlignment: crossAxisStart,
            children: [
              20.heightBox,
              DetailsBoxes(
                  firstheading: "Shipper",
                  firstsubheading: "firstsubheading",
                  secondheading: "Shipping Company",
                  secondsubheading: "secondsubheading"),
              10.heightBox,
              DetailsBoxes(
                  firstheading: "BL Number",
                  firstsubheading: "12345678910",
                  secondheading: "Container Number",
                  secondsubheading: "12345678910"),
              10.heightBox,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DetailsBoxes(
                        firstheading: "Searial Number",
                        firstsubheading: "12345678910",
                        secondheading: "Gross Weight",
                        secondsubheading: "200kg"),
                  ),
                  10.widthBox,
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: padding14,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: crossAxisStart,
                        children: [
                          Text(
                            "No of Units",
                            style: context.bodySmall!.copyWith(fontSize: 14),
                          ),
                          Text(
                            "45",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 14),
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
                  firstsubheading: "Japan Port",
                  secondheading: "Discharge Port",
                  secondsubheading: "Pakistan"),
              20.heightBox,
              Row(
                children: [
                  Text(
                    "Cars Added",
                    style: context.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  5.widthBox,
                  Row(
                    mainAxisAlignment: mainAxisCenter,
                    children: [
                      Icon(
                        Iconsax.car,
                        color: Colors.white,
                        size: 20,
                      ),
                      5.widthBox,
                      Text(
                        "Cars",
                        style: context.bodySmall!.copyWith(color: Colors.white),
                      )
                    ],
                  ).box.roundedSM.p4.color(AppColors.primaryColor).make(),
                  Spacer(),
                  Icon(Iconsax.import, color: AppColors.textColorSecondary)
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
                        "Add Car",
                        style: context.bodySmall!.copyWith(color: Colors.white),
                      )
                    ],
                  ).box.roundedSM.p4.color(AppColors.secondaryColor).make(),
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
                    Text('Card Id',
                        style: context.displayLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Text('Car Name',
                        style: context.displayLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Text('Make',
                        style: context.displayLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
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
                        color:
                            index % 2 != 0 ? Color(0xffF5F7FA) : Colors.white,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Text(item['Card Id'] ?? '',
                                      style: context.displayLarge)),
                              Expanded(
                                  flex: 2,
                                  child: Text(item['Car Name'] ?? '',
                                      style: context.displayLarge)),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(item['Make'] ?? '',
                                      style: context.displayLarge),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: context.width * 0.07),
                                    child: Text(item['Model'] ?? '',
                                        style: context.displayLarge),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Obx(
                                  () => IconButton(
                                    icon: Icon(
                                      controller.expandedRows
                                              .contains(item['id'])
                                          ? Iconsax.arrow_square_up
                                          : Iconsax.arrow_square_down,
                                      color: AppColors.buttonDisabledColor,
                                      size: 20,
                                    ),
                                    onPressed: () =>
                                        controller.toggleExpandRow(item['id']),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Obx(() => controller.expandedRows.contains(item['id'])
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text('Year',
                                              style: context.displayLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          20.widthBox,
                                          Expanded(
                                            child: Container(
                                              padding: defaultPadding,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                item['Year'] ?? '',
                                                style: context.displayLarge,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                          .box
                                          .border(color: AppColors.borderColor)
                                          .roundedSM
                                          .p4
                                          .make(),
                                    ),
                                    10.widthBox,
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: AppColors.successColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          "View Images",
                                          style: context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    10.widthBox,
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(Icons.visibility,
                                            color: Colors.white),
                                      ),
                                    ),
                                    10.widthBox,
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: AppColors.errorColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(Iconsax.trash,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ).box.margin(EdgeInsets.only(bottom: 3)).make()
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
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8),
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
        ));
  }
}
