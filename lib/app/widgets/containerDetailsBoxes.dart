import '../modules/modules.dart';

class DetailsBoxes extends StatelessWidget {
  const DetailsBoxes(
      {super.key,
      required this.firstheading,
      required this.firstsubheading,
      required this.secondheading,
      required this.secondsubheading});
  final String firstheading;
  final String firstsubheading;
  final String secondheading;
  final String secondsubheading;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: padding10,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: crossAxisStart,
              children: [
                Text(
                  firstheading,
                  style: context.bodySmall,
                ),
                Text(
                  firstsubheading,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        5.widthBox,
        Expanded(
          child: Container(
            padding: padding10,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: crossAxisStart,
              children: [
                Text(
                  secondheading,
                  style: context.bodySmall,
                ),
                Text(
                  secondsubheading,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
