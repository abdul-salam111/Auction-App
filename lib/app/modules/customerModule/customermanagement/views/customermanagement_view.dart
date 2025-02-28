import 'package:auction_app/app/modules/modules.dart';

class CustomermanagementView extends GetView<CustomermanagementController> {
  const CustomermanagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            Padding(
              padding: padding16,
              child: BackTitleRow(title: "Customer Management"),
            ),
            20.heightBox,
            Column(
              children: [
                10.heightBox,
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
                    ),
                    10.widthBox,
                    Column(
                      crossAxisAlignment: crossAxisStart,
                      children: [
                        Text(
                          "Linda Blair",
                          style: context.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Customer ID: ",
                              style: context.displayLarge!.copyWith(
                                  color: AppColors.textColorSecondary),
                            ),
                            Text(
                              "ID-011221",
                              style: context.displayLarge!.copyWith(
                                  color: AppColors.textColorSecondary,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      child: Text(
                        "Active",
                        style: context.bodySmall!.copyWith(color: Vx.white),
                      ).centered(),
                    )
                        .box
                        .height(context.height * 0.04)
                        .color(AppColors.secondaryColor)
                        .roundedSM
                        .width(context.width * 0.3)
                        .make(),
                  ],
                ),
                HeightBox(context.height * 0.03),
                Row(
                  mainAxisAlignment: mainAxisCenter,
                  children: [
                    Obx(
                      () => Column(
                        children: [
                          Icon(
                            Iconsax.user,
                            color: controller.selectedIndex.value == 0
                                ? Colors.white
                                : Colors.black,
                          )
                              .box
                              .border(color: AppColors.textColorSecondary)
                              .color(controller.selectedIndex.value == 0
                                  ? AppColors.primaryColor
                                  : Colors.transparent)
                              .p8
                              .roundedFull
                              .make()
                              .onTap(() {
                            controller.selectedIndex.value = 0;
                          }),
                          5.heightBox,
                          Text(
                            "Profile",
                            style: context.displayLarge,
                          )
                        ],
                      ),
                    ),
                    WidthBox(context.width * 0.15),
                    Obx(
                      () => Column(
                        children: [
                          Icon(
                            Iconsax.clock,
                            color: controller.selectedIndex.value == 1
                                ? Colors.white
                                : Colors.black,
                          )
                              .box
                              .border(color: AppColors.textColorSecondary)
                              .color(controller.selectedIndex.value == 1
                                  ? AppColors.primaryColor
                                  : Colors.transparent)
                              .p8
                              .roundedFull
                              .make()
                              .onTap(() {
                            controller.selectedIndex.value = 1;
                          }),
                          5.heightBox,
                          Text(
                            "History",
                            style: context.displayLarge,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                10.heightBox,
              ],
            )
                .box
                .p12
                .width(double.infinity)
                .color(AppColors.halfwhiteColor)
                .make(),
            20.heightBox,
            Obx(
              () => controller.selectedIndex.value == 0
                  ? Expanded(
                      child: Padding(
                        padding: screenPadding,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomTextFormField(
                                readonly: true,
                                validator: (value) =>
                                    Validator.validateRequired(value,
                                        fieldName: "Phone Number"),
                                fillColor: AppColors.halfwhiteColor,
                                borderColor: Color(0xffEBEEF0),
                                label: "Phone Number",
                                hintText: "050 9837 3773",
                                labelColor: Color(0xff1C1C1C),
                                labelfontSize: 14,
                              ),
                              15.heightBox,
                              CustomTextFormField(
                                readonly: true,
                                validator: (value) =>
                                    Validator.validateRequired(value,
                                        fieldName: "Email"),
                                fillColor: AppColors.halfwhiteColor,
                                borderColor: Color(0xffEBEEF0),
                                label: "E-mail",
                                hintText: "abdulsalam@gmail.com",
                                labelColor: Color(0xff1C1C1C),
                                labelfontSize: 14,
                              ),
                              15.heightBox,
                              CustomTextFormField(
                                readonly: true,
                                validator: (value) =>
                                    Validator.validateRequired(value,
                                        fieldName: "Email"),
                                fillColor: AppColors.halfwhiteColor,
                                borderColor: Color(0xffEBEEF0),
                                label: "Last Transaction",
                                hintText: "12 December 2022",
                                labelColor: Color(0xff1C1C1C),
                                labelfontSize: 14,
                              ),
                              15.heightBox,
                              CustomTextFormField(
                                readonly: true,
                                validator: (value) =>
                                    Validator.validateRequired(value,
                                        fieldName: "Email"),
                                fillColor: AppColors.halfwhiteColor,
                                borderColor: Color(0xffEBEEF0),
                                label: "Address",
                                hintText:
                                    "Clock Tower Deira, Dubai, United Arab Emirates",
                                labelColor: Color(0xff1C1C1C),
                                labelfontSize: 14,
                              ),
                              20.heightBox,
                              Row(
                                mainAxisAlignment: mainAxisSpaceBetween,
                                children: [
                                  Expanded(
                                    child: RoundButton(
                                      backgroundColor: AppColors.secondaryColor,
                                      radius: 10,
                                      icon: Iconsax.toggle_on_circle,
                                      text: "Deactivate",
                                      onPressed: () {},
                                    ).box.height(context.height * 0.06).make(),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: RoundButton(
                                      backgroundColor: Vx.red600,
                                      radius: 10,
                                      icon: Iconsax.trash,
                                      text: "Deactivate",
                                      onPressed: () {},
                                    ).box.height(context.height * 0.06).make(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: screenPadding,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: mainAxisSpaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: crossAxisStart,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Iconsax.clock,
                                              size: 20,
                                              color: AppColors.primaryColor,
                                            )
                                                .box
                                                .p4
                                                .roundedSM
                                                .color(AppColors
                                                    .primaryLightColor
                                                    .withAlpha(
                                                        (0.2 * 255).toInt()))
                                                .make(),
                                            Spacer(),
                                            Text(
                                              "All Time",
                                              style: context.displayLarge!
                                                  .copyWith(
                                                      color: AppColors
                                                          .textColorSecondary),
                                            ),
                                            2.widthBox,
                                            Icon(Iconsax.arrow_down_14,
                                                size: 15,
                                                color: AppColors
                                                    .textColorSecondary)
                                          ],
                                        ),
                                        10.heightBox,
                                        Text(
                                          "Total Orders",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        2.heightBox,
                                        Text(
                                          "AED 50,000",
                                          style: context.titleLarge!.copyWith(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                        .box
                                        .border(color: AppColors.borderColor)
                                        .p8
                                        .roundedSM
                                        .make(),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: crossAxisStart,
                                      children: [
                                        Icon(
                                          Iconsax.shopping_cart,
                                          size: 20,
                                          color: AppColors.primaryColor,
                                        )
                                            .box
                                            .p4
                                            .roundedSM
                                            .color(AppColors.warningColor
                                                .withAlpha((0.2 * 255).toInt()))
                                            .make(),
                                        10.heightBox,
                                        Text(
                                          "In Cart",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        2.heightBox,
                                        Text(
                                          "2",
                                          style: context.titleLarge!.copyWith(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                        .box
                                        .border(color: AppColors.borderColor)
                                        .p8
                                        .roundedSM
                                        .make(),
                                  ),
                                ],
                              ),
                              10.heightBox,
                              Column(
                                crossAxisAlignment: crossAxisStart,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Iconsax.shopping_bag,
                                        size: 20,
                                        color: AppColors.primaryColor,
                                      )
                                          .box
                                          .p4
                                          .roundedSM
                                          .color(AppColors.warningColor
                                              .withAlpha((0.2 * 255).toInt()))
                                          .make(),
                                      Spacer(),
                                      Text(
                                        "All Time",
                                        style: context.displayLarge!.copyWith(
                                            color:
                                                AppColors.textColorSecondary),
                                      ),
                                      2.widthBox,
                                      Icon(Iconsax.arrow_down_14,
                                          size: 15,
                                          color: AppColors.textColorSecondary)
                                    ],
                                  ),
                                  10.heightBox,
                                  Row(
                                    mainAxisAlignment: mainAxisSpaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: crossAxisStart,
                                        children: [
                                          Text(
                                            "All Orders",
                                            style: context.displayLarge!
                                                .copyWith(
                                                    color: AppColors
                                                        .textColorSecondary),
                                          ),
                                          5.heightBox,
                                          Text(
                                            "10",
                                            style: context.bodySmall!.copyWith(
                                                color:
                                                    AppColors.textColorPrimary),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: crossAxisStart,
                                        children: [
                                          Text(
                                            "Pending",
                                            style: context.displayLarge!
                                                .copyWith(
                                                    color: AppColors
                                                        .textColorSecondary),
                                          ),
                                          5.heightBox,
                                          Text(
                                            "02",
                                            style: context.bodySmall!.copyWith(
                                                color:
                                                    AppColors.textColorPrimary),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: crossAxisStart,
                                        children: [
                                          Text(
                                            "Completed",
                                            style: context.displayLarge!
                                                .copyWith(
                                                    color: AppColors
                                                        .textColorSecondary),
                                          ),
                                          5.heightBox,
                                          Text(
                                            "08",
                                            style: context.bodySmall!.copyWith(
                                                color:
                                                    AppColors.textColorPrimary),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                                  .box
                                  .border(color: AppColors.borderColor)
                                  .p8
                                  .roundedSM
                                  .make(),
                              10.heightBox,
                              Column(
                                crossAxisAlignment: crossAxisStart,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Iconsax.shopping_bag,
                                        size: 20,
                                        color: AppColors.primaryColor,
                                      )
                                          .box
                                          .p4
                                          .roundedSM
                                          .color(AppColors.warningColor
                                              .withAlpha((0.2 * 255).toInt()))
                                          .make(),
                                      Spacer(),
                                      Text(
                                        "All Time",
                                        style: context.displayLarge!.copyWith(
                                            color:
                                                AppColors.textColorSecondary),
                                      ),
                                      2.widthBox,
                                      Icon(Iconsax.arrow_down_14,
                                          size: 15,
                                          color: AppColors.textColorSecondary)
                                    ],
                                  ),
                                  10.heightBox,
                                  Row(
                                    mainAxisAlignment: mainAxisSpaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: crossAxisStart,
                                        children: [
                                          Text(
                                            "Canceled",
                                            style: context.displayLarge!
                                                .copyWith(
                                                    color: AppColors
                                                        .textColorSecondary),
                                          ),
                                          5.heightBox,
                                          Text(
                                            "0",
                                            style: context.bodySmall!.copyWith(
                                                color:
                                                    AppColors.textColorPrimary),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: crossAxisStart,
                                        children: [
                                          Text(
                                            "Returned",
                                            style: context.displayLarge!
                                                .copyWith(
                                                    color: AppColors
                                                        .textColorSecondary),
                                          ),
                                          5.heightBox,
                                          Text(
                                            "09",
                                            style: context.bodySmall!.copyWith(
                                                color:
                                                    AppColors.textColorPrimary),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: crossAxisStart,
                                        children: [
                                          Text(
                                            "Damaged",
                                            style: context.displayLarge!
                                                .copyWith(
                                                    color: AppColors
                                                        .textColorSecondary),
                                          ),
                                          5.heightBox,
                                          Text(
                                            "03",
                                            style: context.bodySmall!.copyWith(
                                                color:
                                                    AppColors.textColorPrimary),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                                  .box
                                  .border(color: AppColors.borderColor)
                                  .p8
                                  .roundedSM
                                  .make(),
                              20.heightBox,
                              Row(
                                crossAxisAlignment: crossAxisEnd,
                                mainAxisAlignment: mainAxisSpaceBetween,
                                children: [
                                  Expanded(
                                    child: _buildDateField(
                                        "Period from",
                                        controller.fromDate,
                                        () =>
                                            controller.pickDate(true, context)),
                                  ),
                                  10.widthBox,
                                  Expanded(
                                    child: _buildDateField(
                                        "Period to",
                                        controller.toDate,
                                        () => controller.pickDate(
                                            false, context)),
                                  ),
                                  10.widthBox,
                                  Row(
                                    children: [
                                      Icon(
                                        Iconsax.setting_4,
                                        color:
                                            AppColors.scaffoldBackgroundColor,
                                        size: 23,
                                      ),
                                      5.widthBox,
                                      Text("Filter",
                                          style: context.bodySmall!.copyWith(
                                              color: AppColors
                                                  .scaffoldBackgroundColor,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                      .box
                                      .padding(EdgeInsets.all(6))
                                      .roundedSM
                                      .color(AppColors.primaryColor)
                                      .make(),
                                ],
                              ),
                              10.heightBox,
                              Obx(() => SingleChildScrollView(
                                    child: PaginatedDataTable(
                                      headingRowHeight: context.height * 0.05,
                                      headingRowColor: WidgetStateProperty.all(
                                          Color(0xffF5F7FA)),
                                      onRowsPerPageChanged: (value) {
                                        if (value != null) {
                                          controller.rowsPerPage.value = value;
                                        }
                                      },
                                      availableRowsPerPage: [
                                        2,
                                        5,
                                        7,
                                        10,
                                        15,
                                        20,
                                        50,
                                        100
                                      ],
                                      dataRowMaxHeight: context.height * 0.07,
                                      showEmptyRows: false,
                                      horizontalMargin: 10,
                                      columnSpacing:
                                          context.screenWidth > 400 ? 30 : 12,
                                      columns: [
                                        DataColumn(
                                            label: Text(
                                          'Product',
                                          style: context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Chassis No',
                                          style: context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Total',
                                          style: context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Date',
                                          style: context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Status',
                                          style: context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Actions',
                                          style: context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ],
                                      source: CustomerDataSource(
                                          controller, context),
                                      rowsPerPage: controller.rowsPerPage.value,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ));
  }

  Widget _buildDateField(String label, Rx<DateTime> date, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: Get.context!.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppColors.textColorSecondary)),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xffF5F7FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                    "${date.value.day}/${date.value.month}/${date.value.year}",
                    style: Get.context!.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.textColorPrimary))),
                Icon(
                  Iconsax.calendar,
                  color: Colors.blue,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomerDataSource extends DataTableSource {
  final CustomermanagementController controller;
  final BuildContext context;

  CustomerDataSource(this.controller, this.context);

  @override
  DataRow getRow(int index) {
    if (index >= controller.filteredData.length) {
      return DataRow(
          cells: List.generate(5, (_) => const DataCell(SizedBox())));
    }

    var row = controller.filteredData[index];

    bool isEvenRow = index.isEven;

    return DataRow(
      color: WidgetStateProperty.all<Color>(
          isEvenRow ? Colors.white : const Color(0xffF5F7FA)),
      cells: [
        DataCell(
          Text(
            row['Product'],
            style: context.displayLarge,
          ),
        ),
        DataCell(
          Text(
            row['Chassis No'],
            style: context.displayLarge,
          ),
        ),
        DataCell(
          Text(
            row['Total'],
            style: context.displayLarge,
          ),
        ),
        DataCell(
          Text(
            row['Date'],
            style: context.displayLarge,
          ),
        ),
        DataCell(
          Text(
            row['Status'],
            style: context.displayLarge,
          ),
        ),
        DataCell(
          Center(
            child: GestureDetector(
              onTap: () {
                //controller.deleteCustomer(row);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Iconsax.trash, size: 15, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredData.length;

  @override
  int get selectedRowCount => controller.selectedRows.length;
}
