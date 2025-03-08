import 'package:auction_app/app/modules/modules.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: screenPadding,
          child: Column(
            children: [
              HeightBox(context.height * 0.03),
              BackTitleRow(title: "Settings"),
              HeightBox(context.height * 0.03),
              CustomTextFormField(
                readonly: true,
                controller: controller.fullNameController.value,
                keyboardType: TextInputType.emailAddress,
                fillColor: AppColors.halfwhiteColor,
                borderColor: Color(0xffEBEEF0),
                label: "Full Name",
                hintText: controller.fullNameController.value.text,
                labelColor: Color(0xff1C1C1C),
                labelfontSize: 14,
              ),
              20.heightBox,
              CustomTextFormField(
                readonly: true,
                controller: controller.emailController.value,
                keyboardType: TextInputType.emailAddress,
                fillColor: AppColors.halfwhiteColor,
                borderColor: Color(0xffEBEEF0),
                label: "Email Address",
                hintText: controller.emailController.value.text,
                labelColor: Color(0xff1C1C1C),
                labelfontSize: 14,
              ),
              20.heightBox,
              CustomTextFormField(
                readonly: true,
                controller: controller.emailController.value,
                keyboardType: TextInputType.emailAddress,
                fillColor: AppColors.halfwhiteColor,
                borderColor: Color(0xffEBEEF0),
                label: "Emirates ID",
                hintText: controller.emailController.value.text,
                labelColor: Color(0xff1C1C1C),
                labelfontSize: 14,
              ),
              20.heightBox,
              CustomTextFormField(
                obscureText: true,
                readonly: true,
                controller: controller.emailController.value,
                keyboardType: TextInputType.emailAddress,
                fillColor: AppColors.halfwhiteColor,
                borderColor: Color(0xffEBEEF0),
                label: "Password",
                hintText: controller.emailController.value.text,
                labelColor: Color(0xff1C1C1C),
                labelfontSize: 14,
              ),
              20.heightBox,
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  child: Center(
                      child: Text(
                    "Change Password",
                    style: context.bodySmall,
                  )),
                )
                    .box
                    .p8
                    .color(AppColors.halfwhiteColor)
                    .width(context.width * 0.4)
                    .make()
                    .onTap(() {
                  Get.toNamed(Routes.CHANGEPASSWORD);
                }),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: mainAxisSpaceBetween,
                children: [
                  Text(
                    'Enable Fingerprint Authentication',
                    style: context.bodySmall,
                  ),
                  Obx(() => Transform.scale(
                        scale: 0.5,
                        child: Switch(
                          value: controller.isFingerprintEnabled.value,
                          onChanged: controller.toggleFingerprint,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
