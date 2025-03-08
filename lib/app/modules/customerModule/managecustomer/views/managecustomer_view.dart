import 'package:auction_app/app/modules/modules.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';

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
        body: Column(
          children: [
            Obx(
              () => (controller.isLoading.value &&
                      controller.isRefreshLoading.value == false)
                  ? Expanded(
                      child: Center(
                        child: LoadingIndicator(size: 40),
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: screenPadding,
                        child: Column(
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
                                  "Manage Customers",
                                  style: context.displayLarge!.copyWith(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14),
                                ),
                                SizedBox(width: 10),
                                Icon(Iconsax.import,
                                        color: AppColors.backgroundColor)
                                    .box
                                    .p4
                                    .color(context.primaryColor)
                                    .roundedSM
                                    .make()
                                    .onTap(() async {
                                  await controller.downloadExcel();
                                }),
                                SizedBox(width: 5),
                                Expanded(
                                  child: TextField(
                                    cursorHeight: 15,
                                    onChanged: (value) =>
                                        controller.search(value),
                                    style: context.displayLarge!
                                        .copyWith(fontSize: 14),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 10),
                                      prefixIconConstraints: BoxConstraints(
                                          minWidth: 25, minHeight: 25),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColors.borderColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColors.borderColor),
                                      ),
                                      hintText: "Search",
                                      prefixIcon:
                                          Icon(Iconsax.search_normal, size: 15),
                                      hintStyle: context.displayLarge!
                                          .copyWith(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Total: ",
                                  style: context.bodySmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${controller.data.length}",
                                  style: context.bodySmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Icon(Iconsax.add,
                                        color: AppColors.backgroundColor)
                                    .box
                                    .p4
                                    .color(context.primaryColor)
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
                                .color(AppColors.primaryColor
                                    .withAlpha((0.2 * 255).toInt()))
                                .width(double.infinity)
                                .border(color: AppColors.primaryColor)
                                .make(),
                            SizedBox(height: 5),
                            Divider(),
                            SizedBox(height: 5),
                            Container(
                              padding: padding10,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F7FA),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 0,
                                    child: SizedBox(
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
                                  Expanded(
                                    flex: context.width > 380 ? 1 : 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Mobile No',
                                          style: context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text('Name',
                                        style: context.displayLarge!.copyWith(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text('Reg.Date',
                                          style: context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold))
                                      .marginOnly(
                                          left: context.width > 380
                                              ? 0
                                              : context.width * 0.1,
                                          right: context.width > 380
                                              ? context.width * 0.07
                                              : 0),
                                  Text('More',
                                          style: context.displayLarge!.copyWith(
                                              fontWeight: FontWeight.bold))
                                      .marginOnly(left: context.width * 0.05),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  await controller.refreshData();
                                },
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
                                          bottom: BorderSide(
                                              color: Colors.grey[300]!),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 0,
                                                child: Obx(
                                                  () => SizedBox(
                                                    width: 24,
                                                    height: 20,
                                                    child: Checkbox(
                                                      activeColor: AppColors
                                                          .primaryColor,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      side: const BorderSide(
                                                          width: 1),
                                                      value: controller
                                                          .selectedRows
                                                          .contains(item.id),
                                                      onChanged: (value) {
                                                        controller
                                                            .toggleRowSelection(
                                                                item.id!);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                      item.phonenumber ?? '',
                                                      style:
                                                          context.displayLarge),
                                                ),
                                              ),
                                              Expanded(
                                                flex:
                                                    context.width > 380 ? 2 : 2,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: context.width > 380
                                                          ? 0
                                                          : 8.0),
                                                  child: AutoSizeText(
                                                    "${item.firstname} ${item.lastname}",
                                                    style: context.displayLarge,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left:
                                                          context.width * 0.04),
                                                  child: Text(
                                                      item.createdOn!
                                                          .toSimpleDate(),
                                                      style:
                                                          context.displayLarge),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Obx(
                                                  () => IconButton(
                                                    icon: Icon(
                                                      controller.expandedRows
                                                              .contains(item.id)
                                                          ? Iconsax
                                                              .arrow_square_up
                                                          : Iconsax
                                                              .arrow_square_down,
                                                      color: AppColors
                                                          .buttonDisabledColor,
                                                      size: 20,
                                                    ),
                                                    onPressed: () => controller
                                                        .toggleExpandRow(
                                                            item.id!),
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
                                                      flex: 2,
                                                      child: Row(
                                                        children: [
                                                          Text('Email:',
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
                                                              child: Text(
                                                                item.email ??
                                                                    '',
                                                                style: context
                                                                    .displayLarge,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
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
                                                    Row(
                                                      children: [
                                                        2.widthBox,
                                                        Text(
                                                          "Active",
                                                          style: context
                                                              .displayLarge,
                                                        ),
                                                        SizedBox(
                                                          width: context.width *
                                                              0.1,
                                                          height:
                                                              context.height *
                                                                  0.05,
                                                          child:
                                                              Transform.scale(
                                                            scale:
                                                                0.5, // Adjust size as needed
                                                            child:
                                                                Switch.adaptive(
                                                              activeColor: AppColors
                                                                  .successColor,
                                                              value: controller
                                                                  .data[index]
                                                                  .status!,
                                                              onChanged:
                                                                  (value) {},
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
                                                        .make(),
                                                    5.widthBox,
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.toNamed(
                                                              Routes
                                                                  .CUSTOMERMANAGEMENT,
                                                              arguments: item);
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(6),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.orange,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Icon(
                                                              Iconsax.eye,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    5.widthBox,
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Get.dialog(
                                                            DeletePopup(
                                                                title:
                                                                    "Delete Customer",
                                                                message:
                                                                    "Are you sure you want to delete this item?",
                                                                onConfirm:
                                                                    () async {
                                                                  Get.back();
                                                                  await controller
                                                                      .deleteCustomerById(item
                                                                          .id
                                                                          .toString());
                                                                },
                                                                icon:
                                                                    "assets/icons/delete.png"),
                                                          );
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(6),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Icon(
                                                              Iconsax.trash,
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
                                                  .make()
                                              : SizedBox.shrink()),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Obx(() => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 8),
                                  child: SizedBox(
                                    height: 50,
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: controller.buildPagination()),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
