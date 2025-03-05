import 'package:auction_app/app/modules/modules.dart';

class AddnewcustomerView extends GetView<AddnewcustomerController> {
  const AddnewcustomerView({super.key});

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
                  (context.height * 0.03).heightBox,
                  BackTitleRow(title: "Add New Customer"),
                  20.heightBox,
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
                              controller: controller.firstNameController.value,
                              validator: (value) => Validator.validateRequired(
                                  value,
                                  fieldName: "First Name"),
                              fillColor: AppColors.halfwhiteColor,
                              borderColor: Color(0xffEBEEF0),
                              label: "Name",
                              hintText: "First Name",
                              labelColor: Color(0xff1C1C1C),
                              labelfontSize: 14,
                            )),
                            10.widthBox,
                            Expanded(
                                child: CustomTextFormField(
                              fillColor: AppColors.halfwhiteColor,
                              controller: controller.lastNameController.value,
                              validator: (value) => Validator.validateRequired(
                                  value,
                                  fieldName: "Last Name"),
                              borderColor: Color(0xffEBEEF0),
                              label: " ",
                              hintText: "Last Name",
                              labelColor: Color(0xff1C1C1C),
                              labelfontSize: 14,
                            )),
                          ],
                        ),
                        15.heightBox,
                        CustomTextFormField(
                          controller: controller.contactNumberController.value,
                          keyboardType: TextInputType.number,
                          validator: (value) => Validator.validateRequired(
                              value,
                              fieldName: "Contact Number"),
                          isrequired: true,
                          fillColor: AppColors.halfwhiteColor,
                          borderColor: Color(0xffEBEEF0),
                          label: "Contact Number",
                          hintText: "Enter Mobile Number",
                          labelColor: Color(0xff1C1C1C),
                          labelfontSize: 14,
                        ),
                        15.heightBox,
                        CustomTextFormField(
                          controller: controller.emailController.value,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.validateEmail,
                          fillColor: AppColors.halfwhiteColor,
                          borderColor: Color(0xffEBEEF0),
                          label: "Email Address",
                          hintText: "Enter email address",
                          labelColor: Color(0xff1C1C1C),
                          labelfontSize: 14,
                        ),
                        15.heightBox,
                        Text(
                          "Status",
                          style: context.bodyMedium!.copyWith(
                              color: Color(0xff1C1C1C),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        5.heightBox,
                        Row(
                          children: [
                            Obx(
                              () => Text(
                                controller.status.value
                                    ? "Active"
                                    : "In Active",
                                style: context.bodySmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ).px8(),
                            ),
                            Spacer(),
                            Transform.scale(
                                scale: 0.6,
                                child: Obx(
                                  () => Switch(
                                    value: controller.status.value,
                                    onChanged: (val) {
                                      controller.status.value = val;
                                    },
                                    activeColor: AppColors.secondaryColor,
                                  ),
                                ))
                          ],
                        )
                            .box
                            .border(color: Color(0xffEBEEF0))
                            .roundedSM
                            .color(
                              AppColors.halfwhiteColor,
                            )
                            .make(),
                        15.heightBox,
                        CustomTextFormField(
                          controller: controller.emairatesIDController.value,
                          fillColor: AppColors.halfwhiteColor,
                          borderColor: Color(0xffEBEEF0),
                          label: "Emairates ID",
                          hintText: "Enter Emairates ID Number",
                          labelColor: Color(0xff1C1C1C),
                          labelfontSize: 14,
                        ),
                        15.heightBox,
                        CustomTextFormField(
                          controller: controller.addressController.value,
                          fillColor: AppColors.halfwhiteColor,
                          borderColor: Color(0xffEBEEF0),
                          label: "Address",
                          hintText: "Enter Address",
                          labelColor: Color(0xff1C1C1C),
                          labelfontSize: 14,
                        ),
                        20.heightBox,
                        Obx(
                          () => RoundButton(
                            isLoading: controller.isloading.value,
                            text: "Generate Customer",
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                await controller.addCustomerByAdmin();
                              }
                            },
                            backgroundColor: context.primaryColor,
                            radius: 10,
                          )
                              .box
                              .width(context.width * 0.7)
                              .height(context.height * 0.06)
                              .make()
                              .centered(),
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
}
