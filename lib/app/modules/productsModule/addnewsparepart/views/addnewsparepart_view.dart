import 'package:auction_app/app/modules/modules.dart';

import '../controllers/addnewsparepart_controller.dart';

class AddnewsparepartView extends GetView<AddnewsparepartController> {
  const AddnewsparepartView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddnewsparepartController());
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
                                isrequired: true,
                                fillColor: AppColors.halfwhiteColor,
                                controller: controller.partNumberController,
                                validator: (value) =>
                                    Validator.validateRequired(value,
                                        fieldName: "Part Number"),
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedCategory.value =
                                            value;
                                      },
                                      initialValue: "Half Cut",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem<String>(
                                          value: 'Half Cut',
                                          child: Text('Half Cut'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Nose cut',
                                          child: Text('Nose cut'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Engine',
                                          child: Text('Engine'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Wheels & Tires',
                                          child: Text('Wheels & Tires'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Bumper',
                                          child: Text('Bumper'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'CKD',
                                          child: Text('CKD'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'SKD',
                                          child: Text('SKD'),
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
                                                      .selectedCategory.value,
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
                                      initialValue: "Suzuki",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem<String>(
                                          value: 'Toyota',
                                          child: Text('Toyota'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Suzuki',
                                          child: Text('Suzuki'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Daihatsu',
                                          child: Text('Daihatsu'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Nissan',
                                          child: Text('Nissan'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Mazda',
                                          child: Text('Mazda'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Mitsubishi',
                                          child: Text('Mitsubishi'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Volvo',
                                          child: Text('Volvo'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Honda',
                                          child: Text('Honda'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Ford',
                                          child: Text('Ford'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Cadillac',
                                          child: Text('Cadillac'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Subaru',
                                          child: Text('Subaru'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Alfa Romeo',
                                          child: Text('Alfa Romeo'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Volkswagen',
                                          child: Text('Volkswagen'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Mix',
                                          child: Text('Mix'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Isuzu',
                                          child: Text('Isuzu'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Hino',
                                          child: Text('Hino'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Hio',
                                          child: Text('Hio'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'BMW',
                                          child: Text('BMW'),
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
                                    PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        controller.selectedModel.value = value;
                                      },
                                      initialValue: "Jeep",
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem<String>(
                                          value: 'Mark X',
                                          child: Text('Mark X'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Vitz',
                                          child: Text('Vitz'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Wagon R',
                                          child: Text('Wagon R'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Alto',
                                          child: Text('Alto'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Swift',
                                          child: Text('Swift'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Elisyon',
                                          child: Text('Elisyon'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Freed',
                                          child: Text('Freed'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Mira',
                                          child: Text('Mira'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Tanto',
                                          child: Text('Tanto'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Moco',
                                          child: Text('Moco'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Note',
                                          child: Text('Note'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Carol',
                                          child: Text('Carol'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: '4B12',
                                          child: Text('4B12'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Alphard',
                                          child: Text('Alphard'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'RAV4',
                                          child: Text('RAV4'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'B524',
                                          child: Text('B524'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Focus',
                                          child: Text('Focus'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Fit Shuttle',
                                          child: Text('Fit Shuttle'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Demio',
                                          child: Text('Demio'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'MPV',
                                          child: Text('MPV'),
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
                                          value: 'Micra',
                                          child: Text('Micra'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Lafesta',
                                          child: Text('Lafesta'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Legacy',
                                          child: Text('Legacy'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Porte',
                                          child: Text('Porte'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Mark X Zio',
                                          child: Text('Mark X Zio'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Estima',
                                          child: Text('Estima'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Estima Hybrid',
                                          child: Text('Estima Hybrid'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Escalade',
                                          child: Text('Escalade'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Noah',
                                          child: Text('Noah'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Touran',
                                          child: Text('Touran'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'V40',
                                          child: Text('V40'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Forward',
                                          child: Text('Forward'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Dyna',
                                          child: Text('Dyna'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Impreza',
                                          child: Text('Impreza'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'WIT',
                                          child: Text('WIT'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Delica',
                                          child: Text('Delica'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Outlander',
                                          child: Text('Outlander'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Probox',
                                          child: Text('Probox'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Golf 5',
                                          child: Text('Golf 5'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Wish',
                                          child: Text('Wish'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Ranger',
                                          child: Text('Ranger'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Axela',
                                          child: Text('Axela'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Canter',
                                          child: Text('Canter'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Stepwgn',
                                          child: Text('Stepwgn'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Jeep',
                                          child: Text('Jeep'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Titan',
                                          child: Text('Titan'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Liteace Wagon',
                                          child: Text('Liteace Wagon'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Hiace',
                                          child: Text('Hiace'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Opa',
                                          child: Text('Opa'),
                                        ),
                                        PopupMenuItem<String>(
                                          value: '320i',
                                          child: Text('320i'),
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
                                        controller.featuredProduct.value =
                                            value;
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
                                                      .featuredProduct.value,
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
                            isrequired: true,
                            keyboardType: TextInputType.phone,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.priceController,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Price"),
                            borderColor: Color(0xffEBEEF0),
                            label: "Price",
                            hintText: "Enter Price",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          ),
                          10.heightBox,
                          CustomTextFormField(
                            isrequired: true,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.supplierController,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Supplier"),
                            borderColor: Color(0xffEBEEF0),
                            label: "Supplier",
                            hintText: "Enter Supplier",
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          ),
                          10.heightBox,
                          CustomTextFormField(
                            maxLines: 3,
                            isrequired: true,
                            fillColor: AppColors.halfwhiteColor,
                            controller: controller.descriptionController,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Description"),
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
                                    await controller.addNewPart();
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
