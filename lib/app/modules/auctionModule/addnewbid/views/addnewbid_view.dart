import 'package:auction_app/app/modules/modules.dart';

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
                child: Column(
                  crossAxisAlignment: crossAxisStart,
                  children: [
                    CustomTextFormField(
                      labelfontSize: 14,
                      prefixIcon: Iconsax.user,
                      labelColor: Colors.black,
                      label: "Full Name",
                      isrequired: true,
                      fillColor: AppColors.halfwhiteColor,
                      borderColor: AppColors.borderColor,
                      hintText: "Full Name",
                      controller: controller.fullNameController.value,
                    ),
                    20.heightBox,
                    CustomTextFormField(
                      labelfontSize: 14,
                      prefixIcon: Iconsax.call,
                      labelColor: Colors.black,
                      label: "Phone Number",
                      isrequired: true,
                      fillColor: AppColors.halfwhiteColor,
                      borderColor: AppColors.borderColor,
                      hintText: "Phone Number",
                      controller: controller.phoneController.value,
                    ),
                    20.heightBox,
                    Text(
                      "Cart Items",
                      style: context.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    5.heightBox,
                    Column(
                      crossAxisAlignment: crossAxisStart,
                      children: [
                        Text(
                          "Select Type",
                          style: context.bodySmall!
                              .copyWith(color: AppColors.textColorSecondary),
                        ),
                        5.heightBox,
                        Obx(() => DropdownButtonFormField<String>(
                              value: controller.selectedValue.value.isEmpty
                                  ? null
                                  : controller.selectedValue.value,
                              hint: const Text('Select Type'),
                              decoration: InputDecoration(
                                fillColor: AppColors.halfwhiteColor,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              items: controller.items.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(item),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  controller.setSelected(newValue);
                                }
                              },
                              dropdownColor: Colors.white,
                            )),
                      ],
                    )
                        .box
                        .p8
                        .border(color: AppColors.borderColor)
                        .rounded
                        .make(),
                    20.heightBox,
                    Obx(
                      () => controller.cartItems.isNotEmpty
                          ? Text(
                              controller.selectedValue.value,
                              style: context.bodyMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )
                          : SizedBox.shrink(),
                    ),
                    10.heightBox,
                    Obx(
                      () => controller.selectedValue.value == "Spare Parts"
                          ? Obx(
                              () => Column(
                                children: List.generate(
                                    controller.cartItems.length, (index) {
                                  return Padding(
                                    padding: symmetricVertical10,
                                    child: Column(
                                      crossAxisAlignment: crossAxisStart,
                                      children: [
                                        Text(
                                          "ID",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        5.heightBox,
                                        DropdownButtonFormField<String>(
                                          value: controller
                                                      .cartItems.isNotEmpty &&
                                                  controller.cartItems[index]
                                                          ['id'] !=
                                                      null &&
                                                  controller.sparePartsIDs
                                                      .contains(controller
                                                              .cartItems[index]
                                                          ['id'])
                                              ? controller.cartItems[index]
                                                  ['id']
                                              : null,
                                          hint: const Text('Select Id'),
                                          decoration: InputDecoration(
                                            fillColor: AppColors.halfwhiteColor,
                                            filled: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.borderColor),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.borderColor),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey),
                                          items: controller.sparePartsIDs
                                              .map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0, right: 16.0),
                                                child: Text(item),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            if (newValue != null) {
                                              controller.cartItems[index]
                                                  ['id'] = newValue;
                                            }
                                          },
                                          dropdownColor: Colors.white,
                                        ),
                                        10.heightBox,
                                        Text(
                                          "Name",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: controller.cartItems[index]
                                                  ['name']),
                                          readonly: true,
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Name",
                                          onChanged: (value) {
                                            controller.cartItems[index]
                                                ['name'] = value;
                                          },
                                        ),
                                        10.heightBox,
                                        Text(
                                          "Bid Amount",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: controller.cartItems[index]
                                                  ['bidAmount']),
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Bid Amount",
                                          onChanged: (value) {
                                            controller.cartItems[index]
                                                ['bidAmount'] = value;
                                          },
                                        ),
                                        10.heightBox,
                                        Row(
                                          mainAxisAlignment:
                                              mainAxisSpaceBetween,
                                          children: [
                                            // Show "Add More" button only for the last row
                                            if (index ==
                                                controller.cartItems.length - 1)
                                              Text(
                                                "Add More",
                                                style: context.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors
                                                            .primaryColor),
                                              ).box.make().onTap(() {
                                                controller.addCartItem({
                                                  'id': controller
                                                      .sparePartsIDs.first,
                                                  'name': '',
                                                  'bidAmount': ''
                                                });
                                              }),
                                            // Delete button for every row
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Icon(Iconsax.trash,
                                                  size: 15,
                                                  color: Colors.white),
                                            ).onTap(() {
                                              controller.cartItems.removeWhere(
                                                  (e) =>
                                                      e['id'] ==
                                                      controller
                                                              .cartItems[index]
                                                          ['id']);

                                              controller.update();
                                            }),
                                          ],
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
                              ),
                            )
                          : Obx(
                              () => Column(
                                children: List.generate(
                                    controller.cartItems.length, (index) {
                                  return Padding(
                                    padding: symmetricVertical10,
                                    child: Column(
                                      crossAxisAlignment: crossAxisStart,
                                      children: [
                                        Text(
                                          "Chasis Number",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: controller.cartItems[index]
                                                  ['chasisNumber']),
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Chasis Number",
                                          onChanged: (value) {
                                            controller.cartItems[index]
                                                ['chasisNumber'] = value;
                                          },
                                        ),
                                        10.heightBox,
                                        Text(
                                          "Name",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: controller.cartItems[index]
                                                  ['name']),
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Name",
                                          onChanged: (value) {
                                            controller.cartItems[index]
                                                ['name'] = value;
                                          },
                                        ),
                                        10.heightBox,
                                        Text(
                                          "Bid Amount",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: controller.cartItems[index]
                                                  ['bidAmount']),
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Bid Amount",
                                          onChanged: (value) {
                                            controller.cartItems[index]
                                                ['bidAmount'] = value;
                                          },
                                        ),
                                        10.heightBox,
                                        Row(
                                          mainAxisAlignment:
                                              mainAxisSpaceBetween,
                                          children: [
                                            // Show "Add More" button only for the last row
                                            if (index ==
                                                controller.cartItems.length - 1)
                                              Text(
                                                "Add More",
                                                style: context.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors
                                                            .primaryColor),
                                              ).box.make().onTap(() {
                                                controller.addCartItem({
                                                  'chasisNumber': '',
                                                  'name': '',
                                                  'bidAmount': ''
                                                });
                                              }),
                                            // Delete button for every row
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Icon(Iconsax.trash,
                                                  size: 15,
                                                  color: Colors.white),
                                            ).onTap(() {
                                              controller.cartItems.removeWhere(
                                                  (e) =>
                                                      e['chasisNumber'] ==
                                                      controller
                                                              .cartItems[index]
                                                          ['chasisNumber']);
                                              // Force the UI to update
                                              controller.update();
                                            }),
                                          ],
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
                              ),
                            ),
                    ),
                    20.heightBox,
                    Center(
                      child: RoundButton(
                        backgroundColor: AppColors.primaryColor,
                        radius: 10,
                        text: "Add New Bid",
                        onPressed: () {
                          controller.submitBid(
                              controller.fullNameController.value.text,
                              controller.phoneController.value.text);
                          controller.selectedValue.value = "";
                          controller.fullNameController.value.clear();
                          controller.phoneController.value.clear();
                        },
                      ).w64(context),
                    ),
                    20.heightBox,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
