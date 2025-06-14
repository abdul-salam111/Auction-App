import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/utils/utils.dart';
import 'package:auction_app/app/widgets/custom_popupmenu.dart';
import 'package:auction_app/app/widgets/customdropdown_textfield.dart';

class AddNewTruck extends GetView<AddnewproductController> {
  const AddNewTruck({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddnewproductController());
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
                  10.heightBox,
                  Row(
                    children: [
                      BackTitleRow(title: "Add New Truck"),
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
                      GestureDetector(
                        onTap: () {
                          if (controller.formKey.currentState!.validate()) {}
                        },
                        child: Container(
                            padding: defaultPadding,
                            decoration: BoxDecoration(
                                color: AppColors.successColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "Next",
                                style: context.displayMedium!.copyWith(
                                    color: AppColors.textColorWhite,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )
                    ],
                  ),
                  20.heightBox,
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
                  Text(
                    "General Specifications",
                    style: context.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  10.heightBox,
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(10)),
                    padding: defaultPadding,
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          5.heightBox,
                          Row(
                            children: [
                              Expanded(
                                  child: CustomTextFormField(
                                isrequired: true,
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.nameController,
                                validator: (value) =>
                                    Validator.validateRequired(value,
                                        fieldName: "Name"),
                                borderColor: Color(0xffEBEEF0),
                                label: "Name",
                                hintText: "Enter your name",
                                labelColor: Color(0xff1C1C1C),
                                labelfontSize: 14,
                              )),
                              10.widthBox,
                              Expanded(
                                  child: CustomTextFormField(
                                isrequired: true,
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.titleController,
                                validator: (value) =>
                                    Validator.validateRequired(value,
                                        fieldName: "Title"),
                                borderColor: Color(0xffEBEEF0),
                                label: "Title",
                                hintText: "Enter your title",
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
                                        text: "Body Type",
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
                                          controller.selectedBodyType,
                                      items: controller.bodyTypes,
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
                                      selectedValue: controller.selectedMake,
                                      items: controller.makes,
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
                                      selectedValue: controller.selectedModel,
                                      items: controller.truckModels,
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
                                        text: "Condition",
                                        style: context.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.toDouble()),
                                      ),
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
                            ],
                          ),
                          10.heightBox,
                          CustomTextFormField(
                            keyboardType: TextInputType.number,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.mileageController,
                            borderColor: Color(0xffEBEEF0),
                            label: "Mileage",
                            hintText: "Enter mileage",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
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
                                        text: "Transmissions",
                                        style: context.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.toDouble()),
                                      ),
                                    ])),
                                    5.heightBox,
                                    CustomTextFieldDropdownPopup(
                                      selectedValue:
                                          controller.selectedTransmission,
                                      items: controller.transmissionTypes,
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
                                        text: "Fuel Type",
                                        style: context.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.toDouble()),
                                      ),
                                    ])),
                                    5.heightBox,
                                    CustomTextFieldDropdownPopup(
                                      selectedValue:
                                          controller.selectedFuelType,
                                      items: controller.fuelTypes,
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
                                        text: "Driver Type",
                                        style: context.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.toDouble()),
                                      ),
                                    ])),
                                    5.heightBox,
                                    CustomTextFieldDropdownPopup(
                                      selectedValue:
                                          controller.selectedDriverType,
                                      items: controller.driverTypes,
                                    )
                                  ],
                                ),
                              ),
                              10.widthBox,
                              Expanded(
                                child: CustomTextFormField(
                                  keyboardType: TextInputType.number,
                                  fillColor: AppColors.halfwhiteColor,
                                  controller: controller.yearController,
                                  borderColor: Color(0xffEBEEF0),
                                  label: "Year",
                                  hintText: "Enter Year",
                                  labelColor: Color(0xff1C1C1C),
                                  labelfontSize: 14,
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
                                        text: "Doors",
                                        style: context.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.toDouble()),
                                      ),
                                    ])),
                                    5.heightBox,
                                    CustomTextFieldDropdownPopup(
                                      selectedValue: controller.selectedDoors,
                                      items: controller.doorTypes,
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
                                        text: "Displacement",
                                        style: context.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.toDouble()),
                                      ),
                                    ])),
                                    5.heightBox,
                                    CustomTextFieldDropdownPopup(
                                      selectedValue:
                                          controller.selectedDisplacement,
                                      items: controller.displacements,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          10.heightBox,
                          CustomTextFormField(
                            keyboardType: TextInputType.number,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.seatcapacityController,
                            borderColor: Color(0xffEBEEF0),
                            label: "Seat Capacity ( No of Passengers)",
                            hintText: "Enter no of passenger",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  keyboardType: TextInputType.number,
                                  fillColor: AppColors.halfwhiteColor,
                                  controller: controller.cylnderController,
                                  borderColor: Color(0xffEBEEF0),
                                  label: "Cylnder",
                                  hintText: "Enter Cylnder",
                                  labelColor: Color(0xff1C1C1C),
                                  labelfontSize: 14,
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
                                        text: "Color",
                                        style: context.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.toDouble()),
                                      ),
                                    ])),
                                    5.heightBox,
                                    CustomTextFieldDropdownPopup(
                                      selectedValue: controller.selectedColor,
                                      items: controller.colors,
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
                                child: CustomTextFormField(
                                  keyboardType: TextInputType.text,
                                  isrequired: true,
                                  fillColor: AppColors.halfwhiteColor,
                                  controller: controller.chasisnumberController,
                                  validator: (value) =>
                                      Validator.validateRequired(value,
                                          fieldName: "Chassis Number"),
                                  borderColor: Color(0xffEBEEF0),
                                  label: "Chassis Number",
                                  hintText: "Enter Chassis Number",
                                  labelColor: Color(0xff1C1C1C),
                                  labelfontSize: 14,
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
                                        text: "Status",
                                        style: context.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.toDouble()),
                                      ),
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
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  keyboardType: TextInputType.text,
                                  fillColor: AppColors.halfwhiteColor,
                                  controller: controller.gradeController,
                                  borderColor: Color(0xffEBEEF0),
                                  label: "Grade",
                                  hintText: "Enter Grade",
                                  labelColor: Color(0xff1C1C1C),
                                  labelfontSize: 14,
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
                                        text: "Steer",
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
                                        "Left Hand",
                                        "Right Hand",
                                      ],
                                      selectedValue: controller.selectedSteer,
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
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  keyboardType: TextInputType.text,
                                  fillColor: AppColors.halfwhiteColor,
                                  controller: controller.engineNameController,
                                  borderColor: Color(0xffEBEEF0),
                                  label: "Engine Name",
                                  hintText: "Enter Engine Name",
                                  labelColor: Color(0xff1C1C1C),
                                  labelfontSize: 14,
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
                                        text: "Score",
                                        style: context.bodyMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.toDouble()),
                                      ),
                                    ])),
                                    5.heightBox,
                                    CustomTextFieldDropdownPopup(
                                      selectedValue: controller.selectedScore,
                                      items: controller.scoreValues,
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
                                child: CustomTextFormField(
                                  keyboardType: TextInputType.text,
                                  fillColor: AppColors.halfwhiteColor,
                                  controller: controller.supplierController,
                                  borderColor: Color(0xffEBEEF0),
                                  label: "Supplier",
                                  hintText: "Enter Supplier",
                                  labelColor: Color(0xff1C1C1C),
                                  labelfontSize: 14,
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
                                      selectedValue: controller.featureProduct,
                                      padding: defaultPadding,
                                      backgroundColor: AppColors.halfwhiteColor,
                                      borderColor: AppColors.borderColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          20.heightBox,
                          SizedBox(
                            width: context.width * 0.5,
                            child: RoundButton(
                              text: "Next",
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  if (controller
                                          .selectedBodyType.value.isEmpty ||
                                      controller.selectedBodyType.value == "") {
                                    Utils.anotherFlushbar(
                                        context,
                                        "Please, select body Type",
                                        AppColors.errorColor);
                                  } else if (controller
                                          .selectedMake.value.isEmpty ||
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
                                          .selectedDisplacement.value.isEmpty ||
                                      controller.selectedDisplacement.value ==
                                          "") {
                                    Utils.anotherFlushbar(
                                        context,
                                        "Please, select displacement",
                                        AppColors.errorColor);
                                  } else if (controller
                                          .selectedSteer.value.isEmpty ||
                                      controller.selectedSteer.value == "") {
                                    Utils.anotherFlushbar(
                                        context,
                                        "Please, select steer",
                                        AppColors.errorColor);
                                  } else {
                                    Get.to(() => VehicleFeatures());
                                  }
                                }
                              },
                              textColor: AppColors.textColorWhite,
                              fontsize: 14,
                              backgroundColor: AppColors.primaryColor,
                              radius: 5,
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
                      ),
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

class VehicleFeatures extends GetView<AddnewproductController> {
  const VehicleFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: screenPadding,
          child: Column(
            crossAxisAlignment: crossAxisStart,
            children: [
              10.heightBox,
              Row(
                children: [
                  BackTitleRow(title: "Add New Product"),
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
                  GestureDetector(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {}
                    },
                    child: Container(
                        padding: defaultPadding,
                        decoration: BoxDecoration(
                            color: AppColors.successColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Next",
                            style: context.displayMedium!.copyWith(
                                color: AppColors.textColorWhite,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  )
                ],
              ),
              Text(
                "Features",
                style:
                    context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              Obx(() {
                return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(12.0),
                    children: controller.features.entries.map((entry) {
                      final section = entry.key;
                      final features = entry.value;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ExpansionTile(
                              backgroundColor: AppColors.halfwhiteColor,
                              collapsedBackgroundColor:
                                  AppColors.halfwhiteColor,
                              initiallyExpanded: true,
                              title: Text(
                                section,
                                style: context.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              children: List.generate(features.length, (index) {
                                final feature = features[index];
                                return FeatureCheckboxTile(
                                  title: feature.name,
                                  isChecked: feature.isSelected,
                                  onChanged: () =>
                                      controller.toggleFeature(section, index),
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    }).toList());
              }),
              10.heightBox,
              Text(
                "Features For Bike",
                style:
                    context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              Obx(() {
                return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(12.0),
                    children: controller.bikeFeatures.entries.map((entry) {
                      final section = entry.key;
                      final features = entry.value;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ExpansionTile(
                              backgroundColor: AppColors.halfwhiteColor,
                              collapsedBackgroundColor:
                                  AppColors.halfwhiteColor,
                              initiallyExpanded: true,
                              title: Text(
                                section,
                                style: context.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              children: List.generate(features.length, (index) {
                                final feature = features[index];
                                return FeatureCheckboxTile(
                                  title: feature.name,
                                  isChecked: feature.isSelected,
                                  onChanged: () => controller.toggleBikeFeature(
                                      section, index),
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    }).toList());
              }),
              10.heightBox,
              Center(
                child: SizedBox(
                  width: context.width * 0.5,
                  child: RoundButton(
                    text: "Next",
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        Get.to(() => EngineAndTransmission());
                      }
                    },
                    textColor: AppColors.textColorWhite,
                    fontsize: 14,
                    backgroundColor: AppColors.primaryColor,
                    radius: 5,
                  ),
                ),
              ),
              Center(
                child: TextButton(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureCheckboxTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final VoidCallback onChanged;

  const FeatureCheckboxTile({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (_) => onChanged(),
            visualDensity: VisualDensity.compact,
          ),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ).box.color(Colors.white).make(),
    );
  }
}

class EngineAndTransmission extends GetView<AddnewproductController> {
  const EngineAndTransmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: screenPadding,
          child: Column(
            crossAxisAlignment: crossAxisStart,
            children: [
              10.heightBox,
              Row(
                children: [
                  BackTitleRow(title: "Add New Product"),
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
                  GestureDetector(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {}
                    },
                    child: Container(
                        padding: defaultPadding,
                        decoration: BoxDecoration(
                            color: AppColors.successColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Next",
                            style: context.displayMedium!.copyWith(
                                color: AppColors.textColorWhite,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  )
                ],
              ),
              Text(
                "Engine & Transmission",
                style:
                    context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              20.heightBox,
              Form(
                  child: Column(
                children: [
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    fillColor: AppColors.halfwhiteColor,
                    controller: controller.fuelcapacityController,
                    borderColor: Color(0xffEBEEF0),
                    label: "Fuel Tank Capacity (Liters)",
                    hintText: "Enter Fuel Tank Capacity (Liters)",
                    labelColor: Color(0xff1C1C1C),
                    labelfontSize: 14,
                  ),
                  10.heightBox,
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    fillColor: AppColors.halfwhiteColor,
                    controller: controller.kerbweightController,
                    borderColor: Color(0xffEBEEF0),
                    label: "Minimum Kerbweight (kg)",
                    hintText: "Enter Minimum Kerbweight (kg)",
                    labelColor: Color(0xff1C1C1C),
                    labelfontSize: 14,
                  ),
                  10.heightBox,
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    fillColor: AppColors.halfwhiteColor,
                    controller: controller.towingWeightController,
                    borderColor: Color(0xffEBEEF0),
                    label: "Max. Towing Weight - Braked (kg)",
                    hintText: "Enter Max. Towing Weight - Braked (kg)",
                    labelColor: Color(0xff1C1C1C),
                    labelfontSize: 14,
                  ),
                  10.heightBox,
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    fillColor: AppColors.halfwhiteColor,
                    controller: controller.turningCircleController,
                    borderColor: Color(0xffEBEEF0),
                    label: "Turning Circle - Kerb to Kerb (m)",
                    hintText: "Enter Turning Circle - Kerb to Kerb (m)",
                    labelColor: Color(0xff1C1C1C),
                    labelfontSize: 14,
                  ),
                  10.heightBox,
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    fillColor: AppColors.halfwhiteColor,
                    controller: controller.unbrakedtowingController,
                    borderColor: Color(0xffEBEEF0),
                    label: "Max. Towing Weight - Unbraked (kg)",
                    hintText: "Enter Max. Towing Weight - Unbraked (kg)",
                    labelColor: Color(0xff1C1C1C),
                    labelfontSize: 14,
                  ),
                  10.heightBox,
                  CustomTextFormField(
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    readonly: true,
                    fillColor: AppColors.halfwhiteColor,
                    borderColor: Color(0xffEBEEF0),
                    label: "Inspection Location",
                    hintText:
                        "Big Star used cars and spare parts, Industrial Area 3 - Industrial Area - Sharjah - United Arab Emirates",
                    labelColor: Color(0xff1C1C1C),
                    labelfontSize: 14,
                  ),
                  10.heightBox,
                  CustomTextFormField(
                    maxLines: 3,
                    keyboardType: TextInputType.text,
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
                    () => Center(
                      child: SizedBox(
                        width: context.width * 0.5,
                        child: RoundButton(
                          isLoading: controller.isAddingProduct.value,
                          text: "Add Truck",
                          onPressed: () async {
                            if (controller.formKey.currentState!.validate()) {
                              await controller.addNewTruck();
                            }
                          },
                          textColor: AppColors.textColorWhite,
                          fontsize: 14,
                          backgroundColor: AppColors.primaryColor,
                          radius: 5,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
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
                  ),
                  20.heightBox,
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
