import 'package:auction_app/app/modules/modules.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.focusScope.unfocus();
      },
      child: Container(
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(loginbg), fit: BoxFit.cover, opacity: 0.4),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                HeightBox(context.height * 0.1),
                appLogo(
                    width: context.width * 0.7, height: context.height * 0.15),
                HeightBox(context.height * 0.03),
                "Log in to your account"
                    .text
                    .textStyle(context.bodyMedium!.copyWith(
                        color: AppColors.textColorWhite,
                        fontWeight: FontWeight.w900))
                    .make(),
                HeightBox(context.height * 0.05),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          keyboardType: TextInputType.number,
                          prefixIcon: Iconsax.user,
                          label: "User ID",
                          hintText: "Enter your userId",
                          controller: controller.useridController.value,
                          validator: (value) => Validator.validateRequired(
                              value,
                              fieldName: "User ID"),
                        ),
                        HeightBox(context.height * 0.03),
                        CustomTextFormField(
                          keyboardType: TextInputType.number,
                          prefixIcon: Iconsax.lock,
                          label: passwordLabel,
                          hintText: passwordHint,
                          controller: controller.passwordController.value,
                          validator: (value) {
                            if (value!.length < 6) {
                              return "Password must be at least 6 characters";
                            } else if (value.isEmpty) {
                              return "Password can't be empty";
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        HeightBox(context.height * 0.05),
                        Obx(
                          () => RoundButton(
                            isLoading: controller.isloading.value,
                            backgroundColor: context.primaryColor,
                            text: "Log In",
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await controller.loginUserByUID();
                              }
                            },
                            radius: 10,
                          )
                              .box
                              .height(context.height * 0.06)
                              .width(double.infinity)
                              .make(),
                        ),
                        (context.height * 0.02).heightBox,
                        "Forgot Password?"
                            .text
                            .white
                            .extraBold
                            .size(16)
                            .center
                            .make(),
                        (context.height * 0.04).heightBox,
                        (box.read(enableFingerPrint) != null &&
                                box.read(enableFingerPrint))
                            ? Column(
                                children: [
                                  "Login via"
                                      .text
                                      .white
                                      .extraBold
                                      .size(14)
                                      .center
                                      .make(),
                                  (context.height * 0.02).heightBox,
                                  Row(
                                    mainAxisAlignment: mainAxisCenter,
                                    children: [
                                      // Image.asset(facescanner)
                                      //     .box
                                      //     .height(context.height * 0.07)
                                      //     .width(context.width * 0.15)
                                      //     .roundedSM
                                      //     .white
                                      //     .p8
                                      //     .make()
                                      //     .onTap(() async {
                                      //   await controller.authRepository
                                      //       .authenticateWithFingerPrint();
                                      // }),
                                      // 20.widthBox,
                                      Image.asset(fingerprint)
                                          .box
                                          .height(context.height * 0.07)
                                          .width(context.width * 0.15)
                                          .roundedSM
                                          .white
                                          .p8
                                          .make()
                                          .onTap(() async {
                                        await controller.authRepository
                                            .authenticateWithFingerPrint(controller.getAllContainersModel,);
                                      }),
                                    ],
                                  )
                                ],
                              )
                            : SizedBox.square()
                      ],
                    )).box.px32.make(),
              ],
            )),
      ).box.make(),
    );
  }
}
