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
                          prefixIcon: Iconsax.user,
                          label: "User ID",
                          hintText: "Enter your username",
                          controller: controller.usernameController.value,
                          validator: Validator.validateRequired,
                        ),
                        HeightBox(context.height * 0.03),
                        CustomTextFormField(
                          prefixIcon: Iconsax.lock,
                          label: passwordLabel,
                          hintText: passwordHint,
                          controller: controller.passwordController.value,
                          validator: Validator.validatePassword,
                          obscureText: true,
                        ),
                        HeightBox(context.height * 0.05),
                        RoundButton(
                          backgroundColor: context.primaryColor,
                          text: "Log In",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          radius: 10,
                        )
                            .box
                            .height(context.height * 0.06)
                            .width(double.infinity)
                            .make(),
                        (context.height * 0.02).heightBox,
                        "Forgot Password?"
                            .text
                            .white
                            .extraBold
                            .size(16)
                            .center
                            .make(),
                        (context.height * 0.04).heightBox,
                        "Login via".text.white.extraBold.size(14).center.make(),
                        (context.height * 0.02).heightBox,
                        Row(
                          mainAxisAlignment: mainAxisCenter,
                          children: [
                            Image.asset(facescanner)
                                .box
                                .height(context.height * 0.07)
                                .width(context.width * 0.15)
                                .roundedSM
                                .white
                                .p8
                                .make(),
                            20.widthBox,
                            Image.asset(fingerprint)
                                .box
                                .height(context.height * 0.07)
                                .width(context.width * 0.15)
                                .roundedSM
                                .white
                                .p8
                                .make(),
                          ],
                        )
                      ],
                    )).box.px32.make(),
              ],
            )),
      ).box.make(),
    );
  }
}
