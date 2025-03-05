import '../modules/modules.dart';

class DeletePopup extends StatelessWidget {
  final String icon;
  final String title;
  final String message;
  final VoidCallback onConfirm;

  const DeletePopup({
    Key? key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: padding20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              height: context.height * 0.2,
              width: context.width * 0.3,
            ),
            10.heightBox,
            Text(
              title,
              style: context.titleSmall!.copyWith(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
              textAlign: TextAlign.center,
            ),
            10.heightBox,
            Text(
              message,
              style: context.bodySmall!.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            (context.height * 0.03).heightBox,
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      "Back",
                      style: context.bodySmall,
                    ),
                  ),
                )
                        .box
                        .border(color: AppColors.buttonDisabledColor)
                        .transparent
                        .roundedSM
                        .make()
                        .onTap(() {
                  Get.back();
                })),
                10.widthBox,
                Expanded(
                  child: RoundButton(
                    text: "Ok",
                    onPressed: onConfirm,
                    radius: 5,
                    backgroundColor: AppColors.errorColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
