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

  CustomTextFormField({
    super.key,
    this.hintText,
    this.label,
    this.prefixIcon,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onTap,
    this.maxLines = 1, // Default is single line
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: context.bodyMedium!.copyWith(
                color: AppColors.textColorWhite, fontWeight: FontWeight.bold),
          ),
        obscureText
            ? Obx(
                () => TextFormField(
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
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: AppColors.scaffoldBackgroundColor,
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
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: AppColors.scaffoldBackgroundColor,
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
