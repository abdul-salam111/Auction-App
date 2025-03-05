import 'package:auction_app/app/modules/modules.dart';

class ManagecustomerView extends GetView<ManagecustomerController> {
  const ManagecustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.focusScope.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(),
        body: Padding(
          padding: defaultPadding,
          child: Column(
            children: [
              10.heightBox,
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
                    "Manage Customer",
                    style: context.displayLarge!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 14),
                  ),
                  20.widthBox,
                  Icon(
                    Iconsax.add,
                    color: AppColors.backgroundColor,
                  )
                      .box
                      .p4
                      .color(context.primaryColor)
                      .roundedSM
                      .make()
                      .onTap(() {
                    Get.toNamed(Routes.ADDNEWCUSTOMER);
                  }),
                  5.widthBox,
                  GestureDetector(
                    onTap: () async {
                      await controller.downloadExcel();
                    },
                    child: Icon(
                      Iconsax.import,
                      size: 18,
                    ).box.roundedSM.gray200.p8.make(),
                  ),
                  5.widthBox,
                  Expanded(
                    child: TextField(
                      cursorHeight: 15,
                      onChanged: (value) => controller.search(value),
                      style: context.displayLarge!.copyWith(fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        prefixIconConstraints:
                            BoxConstraints(minWidth: 25, minHeight: 25),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        hintText: "Search",
                        prefixIcon: Icon(Iconsax.search_normal, size: 15),
                        hintStyle: context.displayLarge!.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              10.heightBox,
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
                        child: SingleChildScrollView(child:
                            GetBuilder<ManagecustomerController>(
                                builder: (cont) {
                          return PaginatedDataTable(
                            headingRowHeight: context.height * 0.05,
                            headingRowColor:
                                WidgetStateProperty.all(Color(0xffF5F7FA)),
                            onRowsPerPageChanged: (value) {
                              if (value != null) {
                                cont.rowsPerPage.value = value;
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
                            dataRowMaxHeight: context.height * 0.09,
                            showEmptyRows: false,
                            horizontalMargin: 5,
                            columnSpacing: context.screenWidth > 400 ? 30 : 12,
                            columns: [
                              DataColumn(
                                label: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Checkbox(
                                    activeColor: AppColors.primaryColor,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    side: BorderSide(width: 1),
                                    value: controller.selectAll.value,
                                    onChanged: controller.toggleSelectAll,
                                  ),
                                ),
                              ),
                              DataColumn(
                                  label: SizedBox(
                                width: context.width * 0.23,
                                child: Text(
                                  'Mobile No',
                                  style: context.displayLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              )),
                              DataColumn(
                                  label: SizedBox(
                                width: context.width * 0.2,
                                child: Text(
                                  'Name',
                                  style: context.displayLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              )),
                              DataColumn(
                                  label: SizedBox(
                                width: context.width * 0.2,
                                child: Text(
                                  'Reg. Date',
                                  style: context.displayLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              )),
                              DataColumn(
                                  label: SizedBox(
                                width: context.width * 0.1,
                                child: Text(
                                  'More',
                                  style: context.displayLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              )),
                            ],
                            source: CustomerDataSource(cont, context),
                            rowsPerPage: cont.rowsPerPage.value,
                          );
                        })),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerDataSource extends DataTableSource {
  final ManagecustomerController controller;
  final BuildContext context;

  CustomerDataSource(this.controller, this.context);

  @override
  int get rowCount => controller.filteredData.length;

  @override
  DataRow getRow(int index) {
    if (index >= controller.filteredData.length) {
      return DataRow(
          cells: List.generate(5, (_) => const DataCell(SizedBox())));
    }

    var row = controller.filteredData[index];
    bool isExpanded = controller.expandedRows.contains(row.id);
    bool isEvenRow = index.isEven;

    return DataRow(
      color: WidgetStateProperty.all<Color>(
          isEvenRow ? Colors.white : const Color(0xffF5F7FA)),
      selected: controller.selectedRows.contains(row.id),
      cells: [
        DataCell(
          Obx(
            () => SizedBox(
              width: 24,
              height: 20,
              child: Checkbox(
                activeColor: AppColors.primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: const BorderSide(width: 1),
                value: controller.selectedRows.contains(row.id),
                onChanged: (value) => controller.toggleRowSelection(row.id!),
              ),
            ),
          ),
        ),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: context.width * 0.3,
                child: Row(
                  children: [
                    SizedBox(
                      width: context.width * 0.23,
                      child: Text(
                        row.phonenumber!,
                        style: context.displayLarge!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.copyToClipboard(row.phonenumber!);
                      },
                      child: Icon(Iconsax.copy, size: 15),
                    ),
                  ],
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: SizedBox(
                    height: context.height * 0.05,
                    child: Row(
                      children: [
                        Text(
                          "Email:",
                          style: context.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        5.widthBox,
                        Text(
                          "${row.email}",
                          style: context.bodySmall!.copyWith(
                              fontSize: 12,
                              color: AppColors.textColorSecondary),
                        ).box.color(AppColors.halfwhiteColor).make()
                      ],
                    )
                        .box
                        .border(color: AppColors.borderColor)
                        .p4
                        .roundedSM
                        .make(),
                  ),
                ),
            ],
          ),
        ),
        DataCell(
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: crossAxisStart,
            mainAxisAlignment: mainAxisCenter,
            children: [
              SizedBox(
                  width: context.width * 0.2,
                  child: Text(row.firstname! + row.lastname!,
                      style: context.displayLarge!)),
              if (isExpanded)
                GetBuilder<ManagecustomerController>(builder: (cont) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: SizedBox(
                      height: context.height * 0.04,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "Active",
                              style: context.displayLarge,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.5, // Adjust size as needed
                            child: Switch.adaptive(
                              activeColor: AppColors.successColor,
                              value: cont.data[index].status!,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ).box.border(color: AppColors.borderColor).roundedSM.make(),
                  );
                }),
            ],
          ),
        ),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: crossAxisEnd,
            children: [
              SizedBox(
                  width: context.width * 0.2,
                  child: Text(row.createdOn!.toSimpleDate(),
                      style: context.displayLarge!)),
              if (isExpanded)
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Icon(
                    Iconsax.eye,
                    size: 15,
                    color: Colors.white,
                  )
                      .box
                      .width(40)
                      .height(40)
                      .alignCenter
                      .color(Color(0xffFEB000))
                      .roundedSM
                      .p4
                      .make()
                      .onTap(() {
                    Get.toNamed(Routes.CUSTOMERMANAGEMENT, arguments: row);
                  }),
                )
            ],
          ),
        ),
        DataCell(
          Column(
            crossAxisAlignment: crossAxisEnd,
            mainAxisAlignment: mainAxisCenter,
            children: [
              GestureDetector(
                onTap: () {
                  controller.toggleExpandRow(row.id!);
                  notifyListeners();
                },
                child: Icon(
                  isExpanded
                      ? Iconsax.arrow_square_up
                      : Iconsax.arrow_square_down,
                  size: 20,
                  color: AppColors.buttonDisabledColor,
                ),
              ),
              if (isExpanded)
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      DeletePopup(
                          title: "Delete Customer",
                          message: "Are you sure you want to delete this item?",
                          onConfirm: () async {
                            Get.back();
                            await controller
                                .deleteCustomerById(row.id.toString());
                          },
                          icon: "assets/icons/delete.png"),
                    );
                  },
                  child: Icon(
                    Iconsax.trash,
                    size: 15,
                    color: Colors.white,
                  )
                      .box
                      .color(AppColors.errorColor)
                      .width(40)
                      .height(40)
                      .alignCenter
                      .roundedSM
                      .p4
                      .margin(EdgeInsets.only(top: 0))
                      .make(),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => controller.selectedRows.length;
}
