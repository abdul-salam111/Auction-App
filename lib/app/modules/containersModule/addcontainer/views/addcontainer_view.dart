import 'package:auction_app/app/modules/containersModule/addcontainer/views/addItemsToContainerScanner.dart';
import 'package:auction_app/app/modules/modules.dart';

class AddcontainerView extends GetView<AddcontainerController> {
  const AddcontainerView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddcontainerController());

    return Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: screenPadding,
            child: Column(
              children: [
                HeightBox(context.height * 0.02),
                Row(
                  mainAxisAlignment: mainAxisSpaceBetween,
                  children: [
                    BackTitleRow(title: "Add Container"),
                    // RoundButton(
                    //   backgroundColor: AppColors.secondaryColor,
                    //   radius: 5,
                    //   text: "Next",
                    //   onPressed: () {
                    //     // if (controller.formKey.currentState!.validate()) {
                    //     Get.toNamed(Routes.ADDITEMS_TOCONTAINER_SCANNER);
                    //     //}
                    //   },
                    //   fontsize: 12,
                    //   padding: 0,
                    // ).box.height(30).make(),
                  ],
                ),
                HeightBox(context.height * 0.02),
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: crossAxisStart,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                            isrequired: true,
                            controller: controller.shipperNameController,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Shipper"),
                            fillColor: AppColors.halfwhiteColor,
                            borderColor: Color(0xffEBEEF0),
                            label: "Shipper",
                            hintText: "Shipper Name",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          )),
                          10.widthBox,
                          Expanded(
                              child: CustomTextFormField(
                            isrequired: true,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.shippingCompanyController,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Shipping Company"),
                            borderColor: Color(0xffEBEEF0),
                            label: "Shipping Company",
                            hintText: "Shipping Company",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          )),
                        ],
                      ),
                      20.heightBox,
                      CustomTextFormField(
                        isrequired: true,
                        fillColor: AppColors.halfwhiteColor,
                        controller: controller.bLNumberController,
                        validator: (value) => Validator.validateRequired(value,
                            fieldName: "BL Number"),
                        borderColor: Color(0xffEBEEF0),
                        label: "BL Number",
                        hintText: "Add BL Number",
                        labelColor: Color(0xff1C1C1C),
                        labelfontSize: 14,
                      ),
                      20.heightBox,
                      CustomTextFormField(
                        isrequired: true,
                        fillColor: AppColors.halfwhiteColor,
                        controller: controller.containerNumberController,
                        validator: (value) => Validator.validateRequired(value,
                            fieldName: "Container Number"),
                        borderColor: Color(0xffEBEEF0),
                        label: "Container Number",
                        hintText: "Add Container Number",
                        labelColor: Color(0xff1C1C1C),
                        labelfontSize: 14,
                      ),
                      20.heightBox,
                      CustomTextFormField(
                        isrequired: false,
                        fillColor: AppColors.halfwhiteColor,
                        controller: controller.descriptionController,
                        validator: (value) => Validator.validateRequired(value,
                            fieldName: "Description"),
                        borderColor: Color(0xffEBEEF0),
                        label: "Container Description",
                        hintText: "Container Description",
                        labelColor: Color(0xff1C1C1C),
                        labelfontSize: 14,
                      ),
                      20.heightBox,
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Upload or Capture Image",
                          style: context.bodyMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.toDouble()),
                        ),
                        TextSpan(
                          text: "*",
                          style: context.bodyMedium!.copyWith(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.toDouble()),
                        )
                      ])),
                      5.heightBox,
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => _showImagePickerDialog(context),
                            child: Container(
                              height: Get.height * 0.1,
                              width: Get.width * 0.2,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Iconsax.gallery_add,
                                size: 25,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Obx(() => controller.selectedImages.isEmpty
                              ? SizedBox.shrink()
                              : Expanded(
                                  child: SizedBox(
                                    height: context.height * 0.1,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.selectedImages.length,
                                      itemBuilder: (context, index) {
                                        final image =
                                            controller.selectedImages[index];
                                        return Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.file(
                                                  image,
                                                  fit: BoxFit.cover,
                                                  width: 80,
                                                  height: 80,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: GestureDetector(
                                                onTap: () => controller
                                                    .removeImage(index),
                                                child: CircleAvatar(
                                                  radius: 12,
                                                  backgroundColor: Colors.red,
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ))
                        ],
                      ),
                      20.heightBox,
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                            isrequired: true,
                            controller: controller.sealNumberController,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Seal Number"),
                            fillColor: AppColors.halfwhiteColor,
                            borderColor: Color(0xffEBEEF0),
                            label: "Seal Number",
                            hintText: "Add a Seal Number",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          )),
                          10.widthBox,
                          Expanded(
                              child: CustomTextFormField(
                            isrequired: true,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.grossWeightController,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Gross Weight"),
                            borderColor: Color(0xffEBEEF0),
                            label: "Gross Weight",
                            hintText: "300 KG",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          )),
                        ],
                      ),
                      20.heightBox,
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                            isrequired: true,
                            controller: controller.portOfLoadingController,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Port Of Landing"),
                            fillColor: AppColors.halfwhiteColor,
                            borderColor: Color(0xffEBEEF0),
                            label: "Port Of Landing",
                            hintText: "Loading port address",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          )),
                          10.widthBox,
                          Expanded(
                              child: CustomTextFormField(
                            isrequired: true,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.portOfDischargeController,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Port Of Discharge"),
                            borderColor: Color(0xffEBEEF0),
                            label: "Port of Discharge",
                            hintText: "Discharge port address",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          )),
                        ],
                      ),
                      20.heightBox,
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                            isrequired: true,
                            controller: controller.numberOfUnitsController,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Number of Units"),
                            fillColor: AppColors.halfwhiteColor,
                            borderColor: Color(0xffEBEEF0),
                            label: "Number of Units",
                            hintText: "Add Units Number",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          )),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: crossAxisStart,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Status",
                                    style: context.bodyMedium!.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.toDouble()),
                                  ),
                                  TextSpan(
                                    text: "*",
                                    style: context.bodyMedium!.copyWith(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.toDouble()),
                                  )
                                ])),
                                5.heightBox,
                                PopupMenuButton<String>(
                                  onSelected: (String value) {
                                    controller.selectedStatus.value = value;
                                  },
                                  initialValue: "Arrived",
                                  itemBuilder: (BuildContext context) => [
                                    PopupMenuItem(
                                      value: 'Arrived',
                                      child: Text('Arrived'),
                                    ),
                                    PopupMenuItem(
                                      value: 'Upcoming',
                                      child: Text('Upcoming'),
                                    ),
                                  ],
                                  child: Container(
                                    width: double.infinity,
                                    padding: defaultPadding,
                                    decoration: BoxDecoration(
                                      color: AppColors.halfwhiteColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.borderColor,
                                          width: 1),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Obx(
                                          () => Text(
                                              controller.selectedStatus.value,
                                              style: context.bodySmall),
                                        ),
                                        Spacer(),
                                        Icon(Icons.arrow_drop_down,
                                            color: Colors.black),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                        Get.to(() => AddItemsToContainerScanner());
                      }),
                      20.heightBox,
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
                      GetBuilder<AddcontainerController>(builder: (con) {
                        return Text(
                          con.selectedItemType.value,
                          style: context.bodyMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        );
                      }),
                      10.heightBox,
                      GetBuilder<AddcontainerController>(builder: (cont) {
                        return cont.itemsInContainer.value.parts != null
                            ? Column(
                                children: List.generate(
                                    cont.itemsInContainer.value.parts!.length,
                                    (index) {
                                  var items =
                                      cont.itemsInContainer.value.parts![index];
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
                                              color:
                                                  AppColors.textColorSecondary),
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
                                          "Make",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: items.make ?? ""),
                                          readonly: true,
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Make",
                                        ),
                                        10.heightBox,
                                        Text(
                                          "Model",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: items.model ?? ""),
                                          readonly: true,
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Model",
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
                                            cont.itemsInContainer.value.parts!
                                                .removeWhere(
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
                      GetBuilder<AddcontainerController>(builder: (cont) {
                        return cont.itemsInContainer.value.vehicles != null
                            ? Column(
                                children: List.generate(
                                    cont.itemsInContainer.value.vehicles!
                                        .length, (index) {
                                  var items = cont
                                      .itemsInContainer.value.vehicles![index];

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
                                          "Make",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: items.make ?? ""),
                                          readonly: true,
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Make",
                                        ),
                                        10.heightBox,
                                        Text(
                                          "Model",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: items.model ?? ""),
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Model",
                                        ),
                                        10.heightBox,
                                        Text(
                                          "Year",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: items.year ?? ""),
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Year",
                                        ),
                                        10.heightBox,
                                        Text(
                                          "Color",
                                          style: context.bodySmall!.copyWith(
                                              color:
                                                  AppColors.textColorSecondary),
                                        ),
                                        CustomTextFormField(
                                          controller: TextEditingController(
                                              text: items.color ?? ""),
                                          labelfontSize: 14,
                                          fillColor: AppColors.halfwhiteColor,
                                          borderColor: AppColors.borderColor,
                                          hintText: "Color",
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
                                            cont.itemsInContainer.value
                                                .vehicles!
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
                      Obx(
                        () => Center(
                          child: RoundButton(
                                  isLoading: controller.isContainerUploading.value,
                                  backgroundColor: AppColors.primaryColor,
                                  fontsize: 14,
                                  radius: 10,
                                  text: "Submit",
                                  onPressed: () async {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      await controller.createNewContainer();
                                    }
                                  })
                              .box
                              .height(context.height * 0.05)
                              .make()
                              .w64(context),
                        ),
                      ),
                      HeightBox(context.height * 0.02),
                      Text(
                        "Cancel",
                        style: context.bodySmall!.copyWith(color: Colors.grey),
                      ).centered().onInkTap(() {
                        Get.back();
                      }),
                      HeightBox(context.height * 0.02),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _showImagePickerDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.blue),
              title: Text('Camera'),
              onTap: () {
                controller.pickImageFromCamera();
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: Colors.green),
              title: Text('Gallery'),
              onTap: () {
                controller.pickImagesFromGallery();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
