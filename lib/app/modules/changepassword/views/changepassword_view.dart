import 'package:auction_app/app/modules/modules.dart';

class ChangepasswordView extends GetView<ChangepasswordController> {
  const ChangepasswordView({super.key});
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
                  20.heightBox,
                  BackTitleRow(title: "Change Password"),
                  HeightBox(context.height * 0.03),
                  Form(
                      child: Column(
                    children: [
                      CustomTextFormField(
                        labelfontSize: 13,
                        labelColor: AppColors.textColorSecondary,
                        label: "Current Password",
                        hintText: "Enter your current password",
                        fillColor: AppColors.halfwhiteColor,
                        borderColor: AppColors.borderColor,
                        obscureText: true,
                        validator: Validator.validatePassword,
                        controller: controller.currentPasswordController.value,
                      ),
                      20.heightBox,
                      CustomTextFormField(
                        labelfontSize: 13,
                        labelColor: AppColors.textColorSecondary,
                        label: "New Password",
                        hintText: "Enter your new password",
                        fillColor: AppColors.halfwhiteColor,
                        borderColor: AppColors.borderColor,
                        obscureText: true,
                        validator: Validator.validatePassword,
                        controller: controller.newPasswordController.value,
                      ),
                      20.heightBox,
                      CustomTextFormField(
                        labelfontSize: 13,
                        labelColor: AppColors.textColorSecondary,
                        label: "Confirm Password",
                        hintText: "Enter your confirm password",
                        fillColor: AppColors.halfwhiteColor,
                        borderColor: AppColors.borderColor,
                        obscureText: true,
                        validator: Validator.validatePassword,
                        controller: controller.confirmPasswordController.value,
                      ),
                      HeightBox(context.height * 0.1),
                      RoundButton(
                        text: "Update Password",
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {}
                        },
                        radius: 10,
                        backgroundColor: AppColors.primaryColor,
                      ).box.height(45).make().wFourFifth(context),
                      10.heightBox,
                      Text(
                        "Cancel",
                        style: context.bodySmall!.copyWith(color: Colors.grey),
                      ).centered().onInkTap(() {
                        Get.back();
                      }),
                    ],
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
