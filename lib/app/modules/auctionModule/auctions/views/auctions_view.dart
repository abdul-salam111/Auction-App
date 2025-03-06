import '../../../modules.dart';

class AuctionsView extends GetView<AuctionsController> {
  const AuctionsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AuctionsController());
    return GestureDetector(
      onTap: () {
        context.focusScope.unfocus();
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
                      "Manage Customer",
                      style: context.displayLarge!
                          .copyWith(fontWeight: FontWeight.w900, fontSize: 14),
                    ),
                    20.widthBox,
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
                      "12",
                      style: context.bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Iconsax.add,
                      color: AppColors.backgroundColor,
                    )
                        .box
                        .p4
                        .color(AppColors.secondaryColor)
                        .roundedSM
                        .make()
                        .onTap(() {
                      Get.toNamed(Routes.ADDNEWCUSTOMER);
                    }),
                  ],
                )
                    .box
                    .p8
                    .roundedSM
                    .color(
                        AppColors.secondaryColor.withAlpha((0.2 * 255).toInt()))
                    .width(double.infinity)
                    .border(color: AppColors.secondaryColor)
                    .make(),
                5.heightBox,
                Divider(),
                5.heightBox,
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(() => PaginatedDataTable(
                          headingRowHeight: context.height * 0.06,
                          headingRowColor:
                              WidgetStateProperty.all(Color(0xffF5F7FA)),
                          onRowsPerPageChanged: (value) {
                            if (value != null) {
                              controller.rowsPerPage.value = value;
                            }
                          },
                          availableRowsPerPage: [2, 5, 7, 10, 15, 20, 50, 100],
                          dataRowMaxHeight: context.height * 0.07,
                          showEmptyRows: false,
                          horizontalMargin: 5,
                          columnSpacing: context.screenWidth > 400 ? 30 : 15,
                          columns: [
                            DataColumn(
                                label: Text(
                              'Auction Name',
                              style: context.displayLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'Date',
                              style: context.displayLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'Status',
                              style: context.displayLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'Cars',
                              style: context.displayLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'More',
                              style: context.displayLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                          ],
                          source: AuctionDataSource(controller, context),
                          rowsPerPage: controller.rowsPerPage.value,
                        )),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class AuctionDataSource extends DataTableSource {
  final AuctionsController controller;
  final BuildContext context;

  AuctionDataSource(this.controller, this.context);

  @override
  DataRow getRow(int index) {
    if (index >= controller.filteredData.length) {
      return DataRow(
          cells: List.generate(5, (_) => const DataCell(SizedBox())));
    }

    var row = controller.filteredData[index];
    bool isExpanded = controller.expandedRows.contains(row['id']);
    bool isEvenRow = index.isEven;

    return DataRow(
      color: WidgetStateProperty.all<Color>(
          isEvenRow ? Colors.white : const Color(0xffF5F7FA)),
      selected: controller.selectedRows.contains(row['id']),
      cells: [
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                row['Auction Name'] ?? '',
                style: context.displayLarge!,
              ),
              if (isExpanded)
                Row(
                  children: [
                    Text(
                      "Location: ",
                      style: context.displayLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    5.widthBox,
                    Text(
                      row['Location'],
                      style: context.displayLarge!,
                    ).box.roundedSM.color(Color(0xffF5F7FA)).make()
                  ],
                )
                    .box
                    .roundedSM
                    .margin(padding5)
                    .border(color: AppColors.borderColor)
                    .p8
                    .make()
            ],
          ),
        ),
        DataCell(
          Text(row['Date'] ?? '', style: context.displayLarge!),
        ),
        DataCell(
          Text(row['Status'] ?? '', style: context.displayLarge!),
        ),
        DataCell(
          Text(row['Cars'] ?? '', style: context.displayLarge!),
        ),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  controller.toggleExpandRow(row['id']);
                  notifyListeners();
                },
                child: Icon(
                  isExpanded
                      ? Iconsax.arrow_square_up
                      : Iconsax.arrow_square_down,
                  size: 15,
                  color: AppColors.buttonDisabledColor,
                ),
              ),
              if (isExpanded)
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Iconsax.eye,
                    size: 15,
                    color: Colors.white,
                  )
                      .box
                      .color(AppColors.warningColor)
                      .width(30)
                      .height(30)
                      .alignCenter
                      .roundedSM
                      .p4
                      .margin(EdgeInsets.only(top: 3))
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
  int get rowCount => controller.filteredData.length;

  @override
  int get selectedRowCount => controller.selectedRows.length;
}
