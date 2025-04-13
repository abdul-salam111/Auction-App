import 'package:auction_app/app/modules/auctionModule/addnewbid/views/addbidsScanner.dart';

import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/utils/utils.dart';

class AddnewbidView extends GetView<AddnewbidController> {
  const AddnewbidView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: screenPadding,
          child: Column(
            children: [
              20.heightBox,
              BackTitleRow(title: "Add New Bid"),
              HeightBox(context.height * 0.02),
              Form(
                child: Column(crossAxisAlignment: crossAxisStart, children: [
                  Obx(
                    () => CustomTextFormField(
                      readonly: controller.customerType == "0" ? false : true,
                      onTap: controller.customerType == "0"
                          ? () {}
                          : () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16)),
                                ),
                                isScrollControlled: true, // Allows full height
                                builder: (context) {
                                  return ContactSelectionBottomSheet();
                                },
                              );
                            },
                      labelfontSize: 14,
                      keyboardType: TextInputType.number,
                      prefixIcon: Iconsax.call,
                      labelColor: Colors.black,
                      label: "Select Contact",
                      isrequired: true,
                      fillColor: AppColors.halfwhiteColor,
                      borderColor: AppColors.borderColor,
                      hintText: controller.selectedPhoneNumber.value == ""
                          ? "Select Contact"
                          : controller.selectedPhoneNumber.value,
                      controller: controller.phoneController,
                    ),
                  ),
                  20.heightBox,
                  Obx(
                    () => CustomTextFormField(
                      labelfontSize: 14,
                      prefixIcon: Iconsax.user,
                      labelColor: Colors.black,
                      label: "Full Name",
                      readonly: controller.customerType == "0" ? false : true,
                      isrequired: true,
                      fillColor: AppColors.halfwhiteColor,
                      borderColor: AppColors.borderColor,
                      hintText: controller.selectedCustomerDetails.value.data ==
                              null
                          ? "Full Name"
                          : controller.selectedCustomerDetails.value.data!.name
                              .toString(),
                      controller: controller.fullNameController,
                    ),
                  ),
                  20.heightBox,
                  Text(
                    "Scan QR Code",
                    style: context.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      Icon(
                        Iconsax.scan,
                        color: AppColors.textColorWhite,
                        size: 20,
                      ).box.p4.rounded.color(AppColors.primaryColor).make(),
                      WidthBox(20),
                      Text(
                        'Click here to scan QR code',
                        style: context.bodySmall,
                      )
                    ],
                  )
                      .box
                      .p8
                      .roundedSM
                      .color(AppColors.halfwhiteColor)
                      .make()
                      .onTap(() {
                    Get.to(() => AddBidsScanner());
                  }),
                  20.heightBox,
                  Text(
                    "Cart Items",
                    style: context.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  5.heightBox,
                  Obx(
                    () => controller.selectedItemType.value != ""
                        ? Column(
                            crossAxisAlignment: crossAxisStart,
                            children: [
                              Text(
                                "Select Type",
                                style: context.bodySmall!.copyWith(
                                    color: AppColors.textColorSecondary),
                              ),
                              5.heightBox,
                              CustomTextFormField(
                                readonly: true,
                                labelfontSize: 14,
                                prefixIcon: Iconsax.forward_item,
                                labelColor: Colors.black,
                                isrequired: true,
                                fillColor: AppColors.halfwhiteColor,
                                borderColor: AppColors.borderColor,
                                hintText: controller.selectedItemType.value,
                              ),

                              // Obx(() => DropdownButtonFormField<String>(
                              //       value: controller.selectedItemType.value.isEmpty
                              //           ? null
                              //           : controller.selectedItemType.value,
                              //       hint: const Text('Select Type'),
                              //       decoration: InputDecoration(
                              //         fillColor: AppColors.halfwhiteColor,
                              //         filled: true,
                              //         contentPadding:
                              //             const EdgeInsets.symmetric(horizontal: 10),
                              //         enabledBorder: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color: AppColors.borderColor),
                              //           borderRadius: BorderRadius.circular(8),
                              //         ),
                              //         focusedBorder: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color: AppColors.borderColor),
                              //           borderRadius: BorderRadius.circular(8),
                              //         ),
                              //       ),
                              //       icon: const Icon(Icons.arrow_drop_down,
                              //           color: Colors.grey),
                              //       // items: controller.items.map((String item) {
                              //       //   return DropdownMenuItem<String>(
                              //       //     value: item,
                              //       //     child: Padding(
                              //       //       padding: const EdgeInsets.only(
                              //       //           left: 8.0, right: 8.0),
                              //       //       child: Text(item),
                              //       //     ),
                              //       //   );
                              //       // }).toList(),
                              //       // onChanged: (String? newValue) {
                              //       //   if (newValue != null) {
                              //       //     controller.setSelected(newValue);
                              //       //   }
                              //       // },
                              //       //dropdownColor: Colors.white,
                              //     )),
                            ],
                          )
                            .box
                            .p8
                            .border(color: AppColors.borderColor)
                            .rounded
                            .make()
                        : SizedBox.shrink(),
                  ),
                  20.heightBox,
                  GetBuilder<AddnewbidController>(builder: (con) {
                    return Text(
                      con.selectedItemType.value,
                      style: context.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    );
                  }),
                  10.heightBox,
                  GetBuilder<AddnewbidController>(builder: (cont) {
                    return cont.auctions.value.parts != null
                        ? Column(
                            children: List.generate(
                                cont.auctions.value.parts!.length, (index) {
                              var items = cont.auctions.value.parts![index];
                              return Padding(
                                padding: symmetricVertical10,
                                child: Column(
                                  crossAxisAlignment: crossAxisStart,
                                  children: [
                                    Text(
                                      "ID",
                                      style: context.bodySmall!.copyWith(
                                          color: AppColors.textColorSecondary),
                                    ),
                                    5.heightBox,
                                    CustomTextFormField(
                                      controller: TextEditingController(
                                          text: items.id ?? ""),
                                      readonly: true,
                                      labelfontSize: 14,
                                      fillColor: AppColors.halfwhiteColor,
                                      borderColor: AppColors.borderColor,
                                      hintText: "Id",
                                    ),
                                    10.heightBox,
                                    Text(
                                      "Name",
                                      style: context.bodySmall!.copyWith(
                                          color: AppColors.textColorSecondary),
                                    ),
                                    CustomTextFormField(
                                      controller: TextEditingController(
                                          text: items.name ?? ""),
                                      readonly: true,
                                      labelfontSize: 14,
                                      fillColor: AppColors.halfwhiteColor,
                                      borderColor: AppColors.borderColor,
                                      hintText: "Name",
                                    ),
                                    10.heightBox,
                                    Text(
                                      "Bid Amount",
                                      style: context.bodySmall!.copyWith(
                                          color: AppColors.textColorSecondary),
                                    ),
                                    CustomTextFormField(
                                      controller: TextEditingController(
                                          text: items.bidAmount ?? ""),
                                      labelfontSize: 14,
                                      fillColor: AppColors.halfwhiteColor,
                                      borderColor: AppColors.borderColor,
                                      hintText: "Bid Amount",
                                      onChanged: (value) {
                                        items.bidAmount = value;
                                      },
                                    ),
                                    10.heightBox,
                                    Align(
                                      alignment: bottomRight,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Icon(Iconsax.trash,
                                            size: 15, color: Colors.white),
                                      ).onTap(() {
                                        cont.auctions.value.parts!.removeWhere(
                                            (e) => e.id == items.id);

                                        cont.update();
                                      }),
                                    ),
                                    10.heightBox,
                                  ],
                                )
                                    .box
                                    .p8
                                    .border(color: AppColors.borderColor)
                                    .rounded
                                    .make(),
                              );
                            }),
                          )
                        : SizedBox.shrink();
                  }),
                  GetBuilder<AddnewbidController>(builder: (cont) {
                    return cont.auctions.value.vehicles != null
                        ? Column(
                            children: List.generate(
                                cont.auctions.value.vehicles!.length, (index) {
                              var items = cont.auctions.value.vehicles![index];

                              return Padding(
                                padding: symmetricVertical10,
                                child: Column(
                                  crossAxisAlignment: crossAxisStart,
                                  children: [
                                    Text(
                                      "Chasis Number",
                                      style: context.bodySmall!.copyWith(
                                          color: AppColors.textColorSecondary),
                                    ),
                                    5.heightBox,
                                    CustomTextFormField(
                                      controller: TextEditingController(
                                          text: items.chassisNumber ?? ""),
                                      readonly: true,
                                      labelfontSize: 14,
                                      fillColor: AppColors.halfwhiteColor,
                                      borderColor: AppColors.borderColor,
                                      hintText: "Chasis Number",
                                    ),
                                    10.heightBox,
                                    Text(
                                      "Name",
                                      style: context.bodySmall!.copyWith(
                                          color: AppColors.textColorSecondary),
                                    ),
                                    CustomTextFormField(
                                      controller: TextEditingController(
                                          text: items.name ?? ""),
                                      readonly: true,
                                      labelfontSize: 14,
                                      fillColor: AppColors.halfwhiteColor,
                                      borderColor: AppColors.borderColor,
                                      hintText: "Name",
                                    ),
                                    10.heightBox,
                                    Text(
                                      "Bid Amount",
                                      style: context.bodySmall!.copyWith(
                                          color: AppColors.textColorSecondary),
                                    ),
                                    CustomTextFormField(
                                      controller: TextEditingController(
                                          text: items.bidAmount ?? ""),
                                      labelfontSize: 14,
                                      fillColor: AppColors.halfwhiteColor,
                                      borderColor: AppColors.borderColor,
                                      hintText: "Bid Amount",
                                      onChanged: (value) {
                                        items.bidAmount = value;
                                      },
                                    ),
                                    10.heightBox,
                                    Align(
                                      alignment: bottomRight,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Icon(Iconsax.trash,
                                            size: 15, color: Colors.white),
                                      ).onTap(() {
                                        cont.auctions.value.vehicles!
                                            .removeWhere((e) =>
                                                e.chassisNumber ==
                                                items.chassisNumber);

                                        cont.update();
                                      }),
                                    ),
                                    10.heightBox,
                                  ],
                                )
                                    .box
                                    .p8
                                    .border(color: AppColors.borderColor)
                                    .rounded
                                    .make(),
                              );
                            }),
                          )
                        : SizedBox.shrink();
                  }),
                  20.heightBox,
                  Center(
                    child: Obx(
                      () => RoundButton(
                        isLoading: controller.isBidsUploading.value,
                        backgroundColor: AppColors.primaryColor,
                        radius: 10,
                        text: "Add New Bid",
                        onPressed: () async {
                          if ((controller.selectedPhoneNumber.value != "" ||
                                  controller
                                      .phoneController.value.text.isNotEmpty) &&
                              (controller.selectedCustomerDetails.value.data !=
                                      null ||
                                  controller.fullNameController.value.text
                                      .isNotEmpty) &&
                              (controller.auctions.value.parts != null ||
                                  controller.auctions.value.vehicles != null)) {
                            await controller.addnewBids();
                          } else {
                            Utils.anotherFlushbar(
                                context,
                                "Please fill all the required fields",
                                Colors.red);
                          }
                        },
                      ).w64(context),
                    ),
                  ),
                  20.heightBox,
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContactSelectionBottomSheet extends StatelessWidget {
  final AddnewbidController controller = Get.find();

   ContactSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 400,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Field
            TextField(
              onChanged: (value) => controller.filterContacts(value),
              decoration: InputDecoration(
                hintText: "Search Contact",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Contact List
            Expanded(
              child: Obx(() {
                if (controller.filteredContacts.isEmpty) {
                  return Center(child: Text("No Contacts Found"));
                }
                return ListView.builder(
                  itemCount: controller.filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = controller.filteredContacts[index];
                    return ListTile(
                      title: Text(contact.phoneNumber.toString()),
                      onTap: () async {
                        controller.selectedPhoneNumber.value =
                            contact.phoneNumber.toString();
                        await controller.getCustomerDetails();
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
