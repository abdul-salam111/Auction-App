import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/res.dart';
import '../../../../widgets/components.dart';
import '../controllers/addnewvehicle_controller.dart';

class AddnewvehicleView extends GetView<AddnewvehicleController> {
  const AddnewvehicleView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddnewvehicleController());
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
                      BackTitleRow(title: "Add New Vehicle"),
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedBodyType.value =
                                            value;
                                      },
                                      initialValue: "Station Wagon",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Station Wagon',
                                          child: Text('Station Wagon'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Jeep',
                                          child: Text('Jeep'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Van',
                                          child: Text('Van'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Sedan',
                                          child: Text('Sedan'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Hatch back',
                                          child: Text('Hatch back'),
                                        ),
                                        PopupMenuItem(
                                          value: 'ruck Crane',
                                          child: Text('ruck Crane'),
                                        ),
                                        PopupMenuItem(
                                          value: 'SUV',
                                          child: Text('SUV'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Pickup Truck',
                                          child: Text('Pickup Truck'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Truck',
                                          child: Text('Truck'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Bike',
                                          child: Text('Bike'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Mini SUV',
                                          child: Text('Mini SUV'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Motorbike',
                                          child: Text('Motorbike'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Bus',
                                          child: Text('Bus'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Coupe',
                                          child: Text('Coupe'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Wagon',
                                          child: Text('Wagon'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Mini Van',
                                          child: Text('Mini Van'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .selectedBodyType.value,
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedMake.value = value;
                                      },
                                      initialValue: "Toyota",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Toyota',
                                          child: Text('Toyota'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Suzuki',
                                          child: Text('Suzuki'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Nissan',
                                          child: Text('Nissan'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Volkswagen',
                                          child: Text('Volkswagen'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Subaru',
                                          child: Text('Subaru'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Honda',
                                          child: Text('Honda'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Mitsubishi',
                                          child: Text('Mitsubishi'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Mercedes',
                                          child: Text('Mercedes'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Porsche',
                                          child: Text('Porsche'),
                                        ),
                                        PopupMenuItem(
                                          value: 'BMW',
                                          child: Text('BMW'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Daihatsu',
                                          child: Text('Daihatsu'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Ducati',
                                          child: Text('Ducati'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Hino',
                                          child: Text('Hino'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Peugeot',
                                          child: Text('Peugeot'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller.selectedMake.value,
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedModel.value = value;
                                      },
                                      initialValue: "Probox",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem<String>(
                                          value: 'Probox',
                                          child: Text('Probox'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Succeed',
                                          child: Text('Succeed'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Jimny Sierra ',
                                          child: Text('Jimny Sierra '),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Hiace Wagon',
                                          child: Text('Hiace Wagon'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Corolla',
                                          child: Text('Corolla'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'FD',
                                          child: Text('FD'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Ist',
                                          child: Text('Ist'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Vitz',
                                          child: Text('Vitz'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Carvaan Van',
                                          child: Text('Carvaan Van'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Ranger',
                                          child: Text('Ranger'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Aqua',
                                          child: Text('Aqua'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Prius',
                                          child: Text('Prius'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'IST',
                                          child: Text('IST'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'POLO',
                                          child: Text('POLO'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'KIX',
                                          child: Text('KIX'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'GOLF',
                                          child: Text('GOLF'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Hiace Van',
                                          child: Text('Hiace Van'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Starlet',
                                          child: Text('Starlet'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Legacy',
                                          child: Text('Legacy'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'RAV4',
                                          child: Text('RAV4'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Impreza',
                                          child: Text('Impreza'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Lancer Evolution',
                                          child: Text('Lancer Evolution'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Benz S600L',
                                          child: Text('Benz S600L'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Cayenne Turbo',
                                          child: Text('Cayenne Turbo'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Mark II',
                                          child: Text('Mark II'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Skyline GTS',
                                          child: Text('Skyline GTS'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Laurel',
                                          child: Text('Laurel'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Mini Cooper',
                                          child: Text('Mini Cooper'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Landcruiser',
                                          child: Text('Landcruiser'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Wagon R',
                                          child: Text('Wagon R'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Elisyon',
                                          child: Text('Elisyon'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Alto',
                                          child: Text('Alto'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Mira',
                                          child: Text('Mira'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Moco',
                                          child: Text('Moco'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Carol',
                                          child: Text('Carol'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Tanto',
                                          child: Text('Tanto'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Freed',
                                          child: Text('Freed'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Note',
                                          child: Text('Note'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Swift',
                                          child: Text('Swift'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'B524',
                                          child: Text('B524'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'March',
                                          child: Text('March'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Tida',
                                          child: Text('Tida'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Demio',
                                          child: Text('Demio'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Fit Shuttle',
                                          child: Text('Fit Shuttle'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Lafesta',
                                          child: Text('Lafesta'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'MPV',
                                          child: Text('MPV'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Focus',
                                          child: Text('Focus'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'SuperSport',
                                          child: Text('SuperSport'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Hilux Surf',
                                          child: Text('Hilux Surf'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Harrier',
                                          child: Text('Harrier'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Succeed Wagon',
                                          child: Text('Succeed Wagon'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Pajero Jr',
                                          child: Text('Pajero Jr'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Corolla Fielder',
                                          child: Text('Corolla Fielder'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Coaster',
                                          child: Text('Coaster'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Skyline',
                                          child: Text('Skyline'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Silvia',
                                          child: Text('Silvia'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Townace',
                                          child: Text('Townace'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: '508SW',
                                          child: Text('508SW'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'LITEACE',
                                          child: Text('LITEACE'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'MARK X',
                                          child: Text('MARK X'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Estima',
                                          child: Text('Estima'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Townace Truck',
                                          child: Text('Townace Truck'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Axio',
                                          child: Text('Axio'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Runx',
                                          child: Text('Runx'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Every',
                                          child: Text('Every'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Crown',
                                          child: Text('Crown'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Blade',
                                          child: Text('Blade'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Succeed Van',
                                          child: Text('Succeed Van'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Forester',
                                          child: Text('Forester'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Allion',
                                          child: Text('Allion'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Alphard',
                                          child: Text('Alphard'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'BE GO',
                                          child: Text('BE GO'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Raum',
                                          child: Text('Raum'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Sienna',
                                          child: Text('Sienna'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .selectedModel.value,
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
                                        controller.selectedCondition.value =
                                            value;
                                      },
                                      initialValue: "Used",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem<String>(
                                          value: 'Used',
                                          child: Text('Used'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'New',
                                          child: Text('New'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .selectedCondition.value,
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedTransmission.value =
                                            value;
                                      },
                                      initialValue: "AT",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem<String>(
                                            value: 'AT', child: Text('AT')),
                                        PopupMenuItem<String>(
                                            value: 'IA', child: Text('IA')),
                                        PopupMenuItem<String>(
                                            value: 'FAT', child: Text('FAT')),
                                        PopupMenuItem<String>(
                                            value: 'MT', child: Text('MT')),
                                        PopupMenuItem<String>(
                                            value: 'F5', child: Text('F5')),
                                        PopupMenuItem<String>(
                                            value: 'F6', child: Text('F6')),
                                        PopupMenuItem<String>(
                                            value: 'FA', child: Text('FA')),
                                        PopupMenuItem<String>(
                                            value: 'IAT', child: Text('IAT')),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .selectedTransmission
                                                      .value,
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
                                        controller.selectedFuelType.value =
                                            value;
                                      },
                                      initialValue: "Petrol",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Petrol',
                                          child: Text('Petrol'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Diesel',
                                          child: Text('Diesel'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Electric',
                                          child: Text('Electric'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Hybrid',
                                          child: Text('Hybrid'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Hybrid-Gasoline',
                                          child: Text('Hybrid-Gasoline'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Hybrid-Diesel',
                                          child: Text('Hybrid-Diesel'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Hybrid-Gasoline-Electric',
                                          child:
                                              Text('Hybrid-Gasoline-Electric'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Hybrid-Gasoline-LPG',
                                          child: Text('Hybrid-Gasoline-LPG'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .selectedFuelType.value,
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedDriverType.value =
                                            value;
                                      },
                                      initialValue: "4WD",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: '4WD',
                                          child: Text('4WD'),
                                        ),
                                        PopupMenuItem(
                                          value: '2WD',
                                          child: Text('2WD'),
                                        ),
                                        PopupMenuItem(
                                          value: 'FWD',
                                          child: Text('FWD'),
                                        ),
                                        PopupMenuItem(
                                          value: 'AWD',
                                          child: Text('AWD'),
                                        ),
                                        PopupMenuItem(
                                          value: 'RWD',
                                          child: Text('RWD'),
                                        ),
                                        PopupMenuItem(
                                          value: '1WD',
                                          child: Text('1WD'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .selectedDriverType.value,
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedDoors.value = value;
                                      },
                                      initialValue: "1",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: '1',
                                          child: Text('1'),
                                        ),
                                        PopupMenuItem(
                                          value: '2',
                                          child: Text('2'),
                                        ),
                                        PopupMenuItem(
                                          value: '3',
                                          child: Text('3'),
                                        ),
                                        PopupMenuItem(
                                          value: '4',
                                          child: Text('4'),
                                        ),
                                        PopupMenuItem(
                                          value: '5',
                                          child: Text('5'),
                                        ),
                                        PopupMenuItem(
                                          value: '6',
                                          child: Text('6'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Sliding Door ( 1 Side )',
                                          child:
                                              Text('Sliding Door ( 1 Side )'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Sliding Doors ( Both Side )',
                                          child: Text(
                                              'Sliding Doors ( Both Side )'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Double Rear Door',
                                          child: Text('Double Rear Door'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Single Rear Door',
                                          child: Text('Single Rear Door'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Hatchback Door',
                                          child: Text('Hatchback Door'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Gullwing Door',
                                          child: Text('Gullwing Door'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Butterfly Door',
                                          child: Text('Butterfly Door'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Suicide Door',
                                          child: Text('Suicide Door'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Barn Door',
                                          child: Text('Barn Door'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Split Tailgate',
                                          child: Text('Split Tailgate'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Single Tailgate',
                                          child: Text('Signle Tailgate'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Half Door',
                                          child: Text('Half Door'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .selectedDoors.value,
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
                          10.heightBox,
                          CustomTextFormField(
                            keyboardType: TextInputType.number,
                            isrequired: true,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.displacementController,
                            borderColor: Color(0xffEBEEF0),
                            validator: (val) =>
                                Validator.validateRequired("Displacement"),
                            label: "Displacement",
                            hintText: "Enter Displacement in CC",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          ),
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
                                child: CustomTextFormField(
                                  keyboardType: TextInputType.text,
                                  isrequired: true,
                                  fillColor: AppColors.halfwhiteColor,
                                  controller: controller.colorController,
                                  validator: (value) =>
                                      Validator.validateRequired(value,
                                          fieldName: "Color"),
                                  borderColor: Color(0xffEBEEF0),
                                  label: "Color",
                                  hintText: "Enter Color",
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedStatus.value = value;
                                      },
                                      initialValue: "Intransit",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Intransit',
                                          child: Text('Intransit'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Instock',
                                          child: Text('Instock'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Outofstock',
                                          child: Text('Outofstock'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .selectedStatus.value,
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedSteer.value = value;
                                      },
                                      initialValue: "Left Hand",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Left Hand',
                                          child: Text('Left Hand'),
                                        ),
                                        PopupMenuItem(
                                          value: 'Right Hand',
                                          child: Text('Right Hand'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .selectedSteer.value,
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedScore.value = value;
                                      },
                                      initialValue: "R",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'R',
                                          child: Text('R'),
                                        ),
                                        PopupMenuItem(
                                          value: '3',
                                          child: Text('3'),
                                        ),
                                        PopupMenuItem(
                                          value: 'R No ERust CBU',
                                          child: Text('R No ERust CBU'),
                                        ),
                                        PopupMenuItem(
                                          value: 'R No Rust CBU',
                                          child: Text('R No Rust CBU'),
                                        ),
                                        PopupMenuItem(
                                          value: '3 DD',
                                          child: Text('3 DD'),
                                        ),
                                        PopupMenuItem(
                                          value: '3 CC',
                                          child: Text('3 CC'),
                                        ),
                                        PopupMenuItem(
                                          value: 'RA',
                                          child: Text('RA'),
                                        ),
                                        PopupMenuItem(
                                          value: '3.5',
                                          child: Text('3.5'),
                                        ),
                                        PopupMenuItem(
                                          value: 'RDC',
                                          child: Text('RDC'),
                                        ),
                                        PopupMenuItem(
                                          value: 'R2',
                                          child: Text('R2'),
                                        ),
                                        PopupMenuItem(
                                          value: 'RCC',
                                          child: Text('RCC'),
                                        ),
                                        PopupMenuItem(
                                          value: '3.5 CC',
                                          child: Text('3.5 CC'),
                                        ),
                                        PopupMenuItem(
                                          value: '3.5 DD',
                                          child: Text('3.5 DD'),
                                        ),
                                        PopupMenuItem(
                                          value: '3D',
                                          child: Text('3D'),
                                        ),
                                        PopupMenuItem(
                                          value: 'R EE',
                                          child: Text('R EE'),
                                        ),
                                        PopupMenuItem(
                                          value: '3C',
                                          child: Text('3C'),
                                        ),
                                        PopupMenuItem(
                                          value: '3 EC',
                                          child: Text('3 EC'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .selectedScore.value,
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.featureProduct.value = value;
                                      },
                                      initialValue: "Yes",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Yes',
                                          child: Text('Yes'),
                                        ),
                                        PopupMenuItem(
                                          value: 'No',
                                          child: Text('No'),
                                        ),
                                      ],
                                      child: Container(
                                        width: double.infinity,
                                        padding: defaultPadding,
                                        decoration: BoxDecoration(
                                          color: AppColors.halfwhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor,
                                              width: 1),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(
                                              () => Text(
                                                  controller
                                                      .featureProduct.value,
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
                          SizedBox(
                            width: context.width * 0.5,
                            child: RoundButton(
                              text: "Next",
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  Get.to(() => VehicleFeatures());
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

class VehicleFeatures extends GetView<AddnewvehicleController> {
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

class EngineAndTransmission extends GetView<AddnewvehicleController> {
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
                          text: "Add Product",
                          onPressed: () async {
                            if (controller.formKey.currentState!.validate()) {
                              await controller.addNewProduct();
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
