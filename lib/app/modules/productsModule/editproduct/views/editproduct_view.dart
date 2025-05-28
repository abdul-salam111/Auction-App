import 'package:auction_app/app/modules/modules.dart';

class EditproductView extends GetView<EditproductController> {
  const EditproductView({super.key});
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
                children: [
                  20.heightBox,
                  Row(
                    children: [
                      BackTitleRow(title: "Edit Product"),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: AppColors.textColorWhite,
                                  size: 15,
                                ),
                                5.widthBox,
                                Text("Save",
                                    style: context.bodySmall!.copyWith(
                                        color: AppColors.textColorWhite,
                                        fontSize: 12)),
                              ],
                            )),
                      ),
                    ],
                  ),
                  20.heightBox,
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          keyboardType: TextInputType.number,
                          label: "Sold Price",
                          hintText:
                              "AED ${controller.soldPriceController.value.text}",
                          controller: controller.soldPriceController.value,
                          labelColor: AppColors.textColorPrimary,
                          borderColor: AppColors.borderColor,
                        ),
                        20.heightBox,
                        CustomTextFormField(
                          keyboardType: TextInputType.number,
                          label: "Received Amount",
                          onChanged: (val) {
                            controller.remainingPriceController.value.text =
                                (double.parse(controller
                                            .soldPriceController.value.text) -
                                        double.parse(val))
                                    .toString();
                          },
                          hintText:
                              "AED ${controller.recievedPriceController.value.text}",
                          controller: controller.recievedPriceController.value,
                          labelColor: AppColors.textColorPrimary,
                          borderColor: AppColors.borderColor,
                        ),
                        20.heightBox,
                        CustomTextFormField(
                          keyboardType: TextInputType.number,
                          label: "Remaining Balance",
                          hintText:
                              "AED ${controller.remainingPriceController.value.text}",
                          controller: controller.remainingPriceController.value,
                          labelColor: AppColors.textColorPrimary,
                          borderColor: AppColors.borderColor,
                        ),
                        HeightBox(context.height * 0.1),
                        Obx(
                          () => RoundButton(
                            isLoading: controller.isloading.value,
                            text: "Submit",
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                await controller.updateProductStatus();
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
}
