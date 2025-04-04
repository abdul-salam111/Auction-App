import 'package:auction_app/app/modules/modules.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final int maxLines; // For multiline support

  final RxBool isObscure = true.obs;
  final Color fillColor;
  final Color borderColor;
  final Color labelColor;
  final bool isrequired;
  final int labelfontSize;
  final bool readonly;

  CustomTextFormField({
    super.key,
    this.hintText,
    this.label,
    this.readonly = false,
    this.prefixIcon,
    this.isrequired = false,
    this.fillColor = AppColors.scaffoldBackgroundColor,
    this.borderColor = Colors.transparent,
    this.controller,
    this.labelColor = AppColors.textColorWhite,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.labelfontSize = 16,
    this.onChanged,
    this.onTap,
    this.maxLines = 1, // Default is single line
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisStart,
      children: [
        if (label != null)
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: label!,
              style: context.bodyMedium!.copyWith(
                  color: labelColor,
                  fontWeight: FontWeight.bold,
                  fontSize: labelfontSize.toDouble()),
            ),
            isrequired
                ? TextSpan(
                    text: "*",
                    style: context.bodyMedium!.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: labelfontSize.toDouble()),
                  )
                : TextSpan(),
          ])),
        5.heightBox,
        obscureText
            ? Obx(
                () => TextFormField(
                  textCapitalization: TextCapitalization.words,
                  readOnly: readonly,
                  style: context.bodySmall,
                  controller: controller,
                  obscureText: obscureText ? isObscure.value : false,
                  keyboardType: keyboardType,
                  maxLines: obscureText
                      ? 1
                      : maxLines, // Force single line if obscureText is true
                  decoration: InputDecoration(
                    hintStyle: context.bodySmall!
                        .copyWith(color: AppColors.textColorSecondary),
                    hintText: hintText,
                    prefixIcon: prefixIcon != null
                        ? Icon(
                            prefixIcon,
                            color: AppColors.primaryColor,
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: fillColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.primaryDarkColor,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: obscureText
                        ? IconButton(
                            icon: Icon(
                              isObscure.value ? Iconsax.eye_slash : Iconsax.eye,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {
                              isObscure
                                  .toggle(); // Toggle the value of isObscure
                            },
                          )
                        : null,
                  ),
                  validator: validator,
                  onChanged: onChanged,
                  onTap: onTap,
                ),
              )
            : TextFormField(
                textCapitalization: TextCapitalization.words,
                readOnly: readonly,
                style: context.bodySmall,
                controller: controller,
                obscureText: obscureText ? isObscure.value : false,
                keyboardType: keyboardType,
                maxLines: obscureText
                    ? 1
                    : maxLines, // Force single line if obscureText is true
                decoration: InputDecoration(
                  hintStyle: context.bodySmall!
                      .copyWith(color: AppColors.textColorSecondary),
                  hintText: hintText,
                  prefixIcon: prefixIcon != null
                      ? Icon(
                          prefixIcon,
                          color: AppColors.primaryColor,
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.only(left: 10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.primaryDarkColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: borderColor,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: fillColor,
                  filled: true,
                  suffixIcon: obscureText
                      ? IconButton(
                          icon: Icon(
                            isObscure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            isObscure.toggle(); // Toggle the value of isObscure
                          },
                        )
                      : null,
                ),
                validator: validator,
                onChanged: onChanged,
                onTap: onTap,
              ),
      ],
    );
  }
}
