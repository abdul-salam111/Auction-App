import 'package:auction_app/app/modules/modules.dart';

import '../controllers/createnewauction_controller.dart';

class CreatenewauctionView extends GetView<CreatenewauctionController> {
  const CreatenewauctionView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.focusScope.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(),
          body: Padding(
            padding: screenPadding,
            child: Column(
              children: [
                10.heightBox,
                BackTitleRow(
                  title: "Create New Auction",
                ),
                HeightBox(context.height * 0.04),
                Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: crossAxisStart,
                      children: [
                        CustomTextFormField(
                          controller: controller.auctionnameController,
                          validator: Validator.validateRequired,
                          fillColor: AppColors.halfwhiteColor,
                          borderColor: Color(0xffEBEEF0),
                          label: "Auction Name",
                          hintText: "Enter Auction Name",
                          labelColor: Color(0xff1C1C1C),
                          labelfontSize: 14,
                        ),
                        15.heightBox,
                        CustomTextFormField(
                          controller: controller.auctionaddressController,
                          fillColor: AppColors.halfwhiteColor,
                          borderColor: Color(0xffEBEEF0),
                          label: "Auction Address",
                          hintText: "Enter Auction Address",
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
                                controller.status.value ? "Active" : "Closed",
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
                      ],
                    )),
                40.heightBox,
                Obx(
                  () => RoundButton(
                    isLoading: controller.isLoading.value,
                    text: "Generate Auction",
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        await controller.createNewAuction();
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
                  style: context.bodySmall!.copyWith(color: Colors.grey),
                ).centered().onInkTap(() {
                  Get.back();
                }),
                20.heightBox,
              ],
            ),
          )),
    );
  }
}
