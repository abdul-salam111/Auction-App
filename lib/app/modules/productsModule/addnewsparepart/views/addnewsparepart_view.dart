import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/utils/utils.dart';
import 'package:auction_app/app/widgets/custom_popupmenu.dart';
import 'package:auction_app/app/widgets/customdropdown_textfield.dart';

import '../controllers/addnewsparepart_controller.dart';

class AddnewsparepartView extends GetView<AddnewsparepartController> {
  const AddnewsparepartView({super.key});
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
                crossAxisAlignment: crossAxisStart,
                children: [
                  Row(
                    children: [
                      BackTitleRow(title: "Add New Spare Part"),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Cancel",
                            style: context.displayLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.buttonDisabledColor,
                            ),
                          )),
                      5.widthBox,
                    ],
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "Upload or Capture Image",
                      style: context.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.toDouble()),
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
                          5.heightBox,
                          Row(
                            children: [
                              Expanded(
                                  child: CustomTextFormField(
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.partNumberController,
                                borderColor: Color(0xffEBEEF0),
                                label: "Part Number",
                                hintText: "Enter Part Number",
                                labelColor: Color(0xff1C1C1C),
                                labelfontSize: 14,
                              )),
                              10.widthBox,
                              Expanded(
                                  child: CustomTextFormField(
                                isrequired: true,
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.partNamecontroller,
                                validator: (value) =>
                                    Validator.validateRequired(value,
                                        fieldName: "Part name"),
                                borderColor: Color(0xffEBEEF0),
                                label: "Part name",
                                hintText: "Enter Part name",
                                labelColor: Color(0xff1C1C1C),
                                labelfontSize: 14,
                              )),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: crossAxisStart,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "Category",
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
                                    CustomTextFieldDropdownPopup(
                                      selectedValue:
                                          controller.selectedCategory,
                                      items: controller.categoriesList,
                                    )
                                  ],
                                ),
                              ),
                              10.widthBox,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: crossAxisStart,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "Make",
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
                                    CustomTextFieldDropdownPopup(
                                      items: controller.makeList,
                                      selectedValue: controller.selectedMake,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: crossAxisStart,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "Condition",
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
                                    CustomPopupMenu(
                                      items: ["New", "Used"],
                                      selectedValue:
                                          controller.selectedCondition,
                                      padding: defaultPadding,
                                      backgroundColor: AppColors.halfwhiteColor,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  ],
                                ),
                              ),
                              10.widthBox,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: crossAxisStart,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "Model",
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
                                    CustomTextFieldDropdownPopup(
                                      items: controller.partModels,
                                      selectedValue: controller.selectedModel,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
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
                                    CustomPopupMenu(
                                      items: [
                                        "Intransit",
                                        "Outofstock",
                                        "Instock"
                                      ],
                                      selectedValue: controller.selectedStatus,
                                      padding: defaultPadding,
                                      backgroundColor: AppColors.halfwhiteColor,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  ],
                                ),
                              ),
                              10.widthBox,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: crossAxisStart,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "Feature Product",
                                        style: context.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.toDouble()),
                                      ),
                                    ])),
                                    5.heightBox,
                                    CustomPopupMenu(
                                      items: [
                                        "Yes",
                                        "No",
                                      ],
                                      selectedValue: controller.featuredProduct,
                                      padding: defaultPadding,
                                      backgroundColor: AppColors.halfwhiteColor,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.priceController,
                            borderColor: Color(0xffEBEEF0),
                            label: "Price",
                            hintText: "Enter Price",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          ),
                          10.heightBox,
                          CustomTextFormField(
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.supplierController,
                            borderColor: Color(0xffEBEEF0),
                            label: "Supplier",
                            hintText: "Enter Supplier",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          ),
                          10.heightBox,
                          CustomTextFormField(
                            maxLines: 3,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.descriptionController,
                            borderColor: Color(0xffEBEEF0),
                            label: "Description",
                            hintText: "Enter Description",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          ),
                          20.heightBox,
                          Obx(
                            () => SizedBox(
                              width: context.width * 0.5,
                              child: RoundButton(
                                isLoading: controller.isloading.value,
                                text: "Add Part",
                                onPressed: () async {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    if (controller.selectedMake.value.isEmpty ||
                                        controller.selectedMake.value == "") {
                                      Utils.anotherFlushbar(
                                          context,
                                          "Please, select make",
                                          AppColors.errorColor);
                                    } else if (controller
                                            .selectedModel.value.isEmpty ||
                                        controller.selectedModel.value == "") {
                                      Utils.anotherFlushbar(
                                          context,
                                          "Please, select model",
                                          AppColors.errorColor);
                                    } else if (controller
                                            .selectedCategory.value.isEmpty ||
                                        controller.selectedCategory.value ==
                                            "") {
                                      Utils.anotherFlushbar(
                                          context,
                                          "Please, select category",
                                          AppColors.errorColor);
                                    } else if (controller
                                            .selectedCondition.value.isEmpty ||
                                        controller.selectedCondition.value ==
                                            "") {
                                      Utils.anotherFlushbar(
                                          context,
                                          "Please, select condition",
                                          AppColors.errorColor);
                                    } else {
                                      await controller.addNewPart();
                                    }
                                  }
                                },
                                textColor: AppColors.textColorWhite,
                                fontsize: 14,
                                backgroundColor: AppColors.primaryColor,
                                radius: 5,
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "Cancel",
                                style: context.displayLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppColors.buttonDisabledColor,
                                ),
                              )),
                          20.heightBox,
                        ],
                      )),
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
