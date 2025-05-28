import 'package:auction_app/app/modules/modules.dart';

import '../controllers/editproducttdetails_controller.dart';

class EditproducttdetailsView extends GetView<EditproducttdetailsController> {
  const EditproducttdetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: CustomAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: screenPadding,
              child: Column(
                crossAxisAlignment: crossAxisStart,
                children: [
                  20.heightBox,
                  BackTitleRow(title: "Edit Product"),
                  10.heightBox,
                  Row(
                    children: [
                      // Expanded(
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 12, vertical: 0),
                      //     decoration: BoxDecoration(
                      //       color: const Color(0xFFF9FAFB),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     child: Obx(
                      //       () => DropdownButtonHideUnderline(
                      //         child: DropdownButton<String>(
                      //           isExpanded: true,
                      //           value: controller.selectedStatus.value,
                      //           icon: const Icon(
                      //               Icons.keyboard_arrow_down_rounded),
                      //           iconSize: 24,
                      //           elevation: 2,
                      //           style: const TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //           dropdownColor: Colors.white,
                      //           borderRadius: BorderRadius.circular(12),
                      //           onChanged: (String? newValue) {
                      //             controller.selectedStatus.value = newValue!;
                      //           },
                      //           items: controller.statusOptions
                      //               .map<DropdownMenuItem<String>>(
                      //                   (String value) {
                      //             return DropdownMenuItem<String>(
                      //               value: value,
                      //               child: Text(
                      //                 value,
                      //                 style: const TextStyle(
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.w500,
                      //                   color: Colors.black,
                      //                 ),
                      //               ),
                      //             );
                      //           }).toList(),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      5.widthBox,
                      ElevatedButton(
                        onPressed: () {
                          // Your action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3166F5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.gavel_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text('Add to Live Auction',
                                style: context.bodyMedium!.copyWith(
                                    color: AppColors.backgroundColor)),
                          ],
                        ),
                      )
                    ],
                  ),
                  10.heightBox,
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "Upload or Capture Image",
                      style: context.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.toDouble()),
                    ),
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
                                  itemCount: controller.selectedImages.length,
                                  itemBuilder: (context, index) {
                                    final image =
                                        controller.selectedImages[index];
                                    return Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
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
                                            onTap: () =>
                                                controller.removeImage(index),
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
                  10.heightBox,
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                labelfontSize: 14,
                                keyboardType: TextInputType.number,
                                label: "Item ID",
                                hintText: "12345678",
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.itemIdController,
                                labelColor: AppColors.textColorPrimary,
                                borderColor: AppColors.borderColor,
                              ),
                            ),
                            10.widthBox,
                            (controller.classificationType == "vehicle" ||
                                    controller.classificationType == "truck")
                                ? Expanded(
                                    child: CustomTextFormField(
                                      labelfontSize: 14,
                                      keyboardType: TextInputType.number,
                                      label: "Chassis Number",
                                      hintText: "83838fchj",
                                      fillColor: AppColors.halfwhiteColor,
                                      controller:
                                          controller.chassisnumberController,
                                      labelColor: AppColors.textColorPrimary,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                        10.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                labelfontSize: 14,
                                
                                label: "Item Name",
                                hintText: "Tayota Corolla",
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.itemnameController,
                                labelColor: AppColors.textColorPrimary,
                                borderColor: AppColors.borderColor,
                              ),
                            ),
                            10.widthBox,
                            (controller.classificationType == "vehicle" ||
                                    controller.classificationType == "truck")
                                ? Expanded(
                                    child: CustomTextFormField(
                                      labelfontSize: 14,
                   
                                      label: "Color",
                                      hintText: "Red",
                                      fillColor: AppColors.halfwhiteColor,
                                      controller: controller.colorController,
                                      labelColor: AppColors.textColorPrimary,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                        10.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                labelfontSize: 14,
                                label: "Make",
                                hintText: "Tayota Corolla",
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.makeController,
                                labelColor: AppColors.textColorPrimary,
                                borderColor: AppColors.borderColor,
                              ),
                            ),
                            10.widthBox,
                            Expanded(
                              child: CustomTextFormField(
                                labelfontSize: 14,
                              
                                label: "Model",
                                hintText: "tayota",
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.modelController,
                                labelColor: AppColors.textColorPrimary,
                                borderColor: AppColors.borderColor,
                              ),
                            ),
                            10.widthBox,
                            (controller.classificationType == "vehicle" ||
                                    controller.classificationType == "truck")
                                ? Expanded(
                                    child: CustomTextFormField(
                                      labelfontSize: 14,
                                      keyboardType: TextInputType.number,
                                      label: "Year",
                                      hintText: "2025",
                                      fillColor: AppColors.halfwhiteColor,
                                      controller: controller.yearController,
                                      labelColor: AppColors.textColorPrimary,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                        10.heightBox,
                        (controller.classificationType == "vehicle" ||
                                controller.classificationType == "truck")
                            ? Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      labelfontSize: 14,
                  
                                      label: "Fuel Type",
                                      hintText: "Petrol",
                                      fillColor: AppColors.halfwhiteColor,
                                      controller: controller.fueltypeController,
                                      labelColor: AppColors.textColorPrimary,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  ),
                                  10.widthBox,
                                  Expanded(
                                    child: CustomTextFormField(
                                      labelfontSize: 14,
                 
                                      label: "Tranmission",
                                      hintText: "Automatic",
                                      fillColor: AppColors.halfwhiteColor,
                                      controller:
                                          controller.transmissionController,
                                      labelColor: AppColors.textColorPrimary,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                        10.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                labelfontSize: 14,
                    
                                label: "Condition",
                                hintText: "Used",
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.conditionController,
                                labelColor: AppColors.textColorPrimary,
                                borderColor: AppColors.borderColor,
                              ),
                            ),
                            10.widthBox,
                            Expanded(
                              child: CustomTextFormField(
                                labelfontSize: 14,
                                keyboardType: TextInputType.number,
                                label: "Price",
                                hintText: "AED 3344",
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.totalpriceController,
                                labelColor: AppColors.textColorPrimary,
                                borderColor: AppColors.borderColor,
                              ),
                            ),
                            10.widthBox,
                            (controller.classificationType == "vehicle" ||
                                    controller.classificationType == "truck")
                                ? Expanded(
                                    child: CustomTextFormField(
                                      labelfontSize: 14,
                                    
                                      label: "Mileage",
                                      hintText: "20,00 Km",
                                      fillColor: AppColors.halfwhiteColor,
                                      controller: controller.mileageController,
                                      labelColor: AppColors.textColorPrimary,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                        10.heightBox,
                        (controller.classificationType == "vehicle" ||
                                controller.classificationType == "truck")
                            ? Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      labelfontSize: 14,
                                      label: "Description",
                                      hintText: "This is a test description",
                                      fillColor: AppColors.halfwhiteColor,
                                      controller:
                                          controller.descriptionController,
                                      labelColor: AppColors.textColorPrimary,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                        10.heightBox,
                        HeightBox(context.height * 0.05),
                        Obx(
                          () => RoundButton(
                            isLoading: controller.isLoading.value,
                            text: "Submit",
                            onPressed: () async {
                              if (controller.classificationType == "vehicle") {
                                await controller.updateCarDetails();
                              } else if (controller.classificationType ==
                                  "truck") {
                                await controller.updateTruck();
                              } else {
                                await controller.updatePart();
                              }
                            },
                            radius: 10,
                            backgroundColor: AppColors.primaryColor,
                            textColor: AppColors.textColorWhite,
                          ).wTwoThird(context),
                        ),
                        10.heightBox,
                        Text(
                          "Cancel",
                          style:
                              context.bodySmall!.copyWith(color: Colors.grey),
                        ).centered().onInkTap(() {
                          Get.back();
                        }),
                        20.heightBox,
                      ],
                    ),
                  )
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
