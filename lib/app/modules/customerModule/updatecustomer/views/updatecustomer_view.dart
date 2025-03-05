import 'package:auction_app/app/modules/modules.dart';

import '../controllers/updatecustomer_controller.dart';

class UpdatecustomerView extends GetView<UpdatecustomerController> {
  const UpdatecustomerView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(UpdatecustomerController());
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
                  BackTitleRow(title: "Update Customer"),
                  20.heightBox,
                  GetBuilder<UpdatecustomerController>(builder: (cont) {
                    return Form(
                      key: cont.formKey,
                      child: Column(
                        crossAxisAlignment: crossAxisStart,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: CustomTextFormField(
                                isrequired: true,
                                controller: cont.firstNameController.value,
                                validator: (value) =>
                                    Validator.validateRequired(value,
                                        fieldName: "First Name"),
                                fillColor: AppColors.halfwhiteColor,
                                borderColor: Color(0xffEBEEF0),
                                label: "Name",
                                hintText: cont.firstNameController.value.text,
                                labelColor: Color(0xff1C1C1C),
                                labelfontSize: 14,
                              )),
                              10.widthBox,
                              Expanded(
                                  child: CustomTextFormField(
                                fillColor: AppColors.halfwhiteColor,
                                controller: cont.lastNameController.value,
                                validator: (value) =>
                                    Validator.validateRequired(value,
                                        fieldName: "Last Name"),
                                borderColor: Color(0xffEBEEF0),
                                label: " ",
                                hintText: cont.lastNameController.value.text,
                                labelColor: Color(0xff1C1C1C),
                                labelfontSize: 14,
                              )),
                            ],
                          ),
                          15.heightBox,
                          CustomTextFormField(
                            controller: cont.contactNumberController.value,
                            keyboardType: TextInputType.number,
                            validator: (value) => Validator.validateRequired(
                                value,
                                fieldName: "Contact Number"),
                            isrequired: true,
                            fillColor: AppColors.halfwhiteColor,
                            borderColor: Color(0xffEBEEF0),
                            label: "Contact Number",
                            hintText: cont.contactNumberController.value.text,
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          ),
                          15.heightBox,
                          CustomTextFormField(
                            controller: cont.emailController.value,
                            keyboardType: TextInputType.emailAddress,
                            validator: Validator.validateEmail,
                            fillColor: AppColors.halfwhiteColor,
                            borderColor: Color(0xffEBEEF0),
                            label: "Email Address",
                            hintText: cont.emailController.value.text,
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
                                  cont.status.value ? "Active" : "In Active",
                                  style: context.bodySmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ).px8(),
                              ),
                              Spacer(),
                              Transform.scale(
                                  scale: 0.6,
                                  child: Obx(
                                    () => Switch(
                                      value: cont.status.value,
                                      onChanged: (val) {
                                        cont.status.value = val;
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
                            controller: cont.emairatesIDController.value,
                            fillColor: AppColors.halfwhiteColor,
                            borderColor: Color(0xffEBEEF0),
                            label: "Emairates ID",
                            hintText: cont.emairatesIDController.value.text,
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          ),
                          15.heightBox,
                          CustomTextFormField(
                            controller: cont.addressController.value,
                            fillColor: AppColors.halfwhiteColor,
                            borderColor: Color(0xffEBEEF0),
                            label: "Address",
                            hintText: cont.addressController.value.text,
                            labelColor: Color(0xff1C1C1C),
                            labelfontSize: 14,
                          ),
                          20.heightBox,
                          Obx(
                            () => RoundButton(
                              isLoading: cont.isloading.value,
                              text: "Update Customer",
                              onPressed: () async {
                                if (cont.formKey.currentState!.validate()) {
                                  await cont.updateCustomerByAdmin();
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
                    );
                  })
                ],
              ),
            ),
          )),
    );
  }
}
