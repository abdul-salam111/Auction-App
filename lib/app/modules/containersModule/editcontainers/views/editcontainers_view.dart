import 'package:auction_app/app/modules/modules.dart';

class EditcontainersView extends GetView<EditcontainersController> {
  const EditcontainersView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.focusScope.unfocus();
      },
      child: Scaffold(
          appBar: CustomAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: screenPadding,
              child: Column(
                children: [
                  HeightBox(context.height * 0.02),
                  BackTitleRow(title: "Edit Container Details"),
                  HeightBox(context.height * 0.02),
                  Form(
                      child: Column(
                    crossAxisAlignment: crossAxisStart,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                            isrequired: true,
                            controller: controller.shipperNameController.value,
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
                            controller:
                                controller.shippingCompanyController.value,
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
                        controller: controller.bLNumberController.value,
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
                        controller: controller.containerNumberController.value,
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
                        controller: controller.descriptionController.value,
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
                          text: "Uploaded Images",
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
                      Obx(() => controller.uploadedImages.isEmpty
                          ? SizedBox.shrink()
                          : SizedBox(
                              height: context.height * 0.1,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.uploadedImages.length,
                                itemBuilder: (context, index) {
                                  final image =
                                      controller.uploadedImages[index];
                                  return Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            image,
                                            fit: BoxFit.cover,
                                            width: 80,
                                            height: 80,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                width: 80,
                                                height: 80,
                                                color: Colors.grey[300],
                                                child: Icon(
                                                  Icons.broken_image,
                                                  color: Colors.grey[700],
                                                  size: 40,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )),
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
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Iconsax.gallery_add,
                                size: 25,
                                color: AppColors.primaryColor,
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
                            controller: controller.sealNumberController.value,
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
                            controller: controller.grossWeightController.value,
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
                            controller:
                                controller.portOfLoadingController.value,
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
                            controller:
                                controller.portOfDischargeController.value,
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
                            controller:
                                controller.numberOfUnitsController.value,
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
                      HeightBox(context.height * 0.05),
                      Center(
                        child: RoundButton(
                                isLoading: controller.isContainerUploading.value,
                                backgroundColor: AppColors.primaryColor,
                                fontsize: 14,
                                radius: 10,
                                text: "Save Changes",
                                onPressed: () async {
                                  await controller.updateContainerDetails();
                                })
                            .box
                            .height(context.height * 0.05)
                            .make()
                            .w64(context),
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
                  ))
                ],
              ),
            ),
          )),
    );
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
