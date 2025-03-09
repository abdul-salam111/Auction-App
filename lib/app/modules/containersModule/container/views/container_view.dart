import 'package:auction_app/app/modules/modules.dart';

class ContainerView extends GetView<ContainerController> {
  const ContainerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: screenPadding,
          child: Column(
            children: [
              20.heightBox,
              DetailsBoxes(
                  firstheading: "Shipper",
                  firstsubheading: "firstsubheading",
                  secondheading: "Shipping Company",
                  secondsubheading: "secondsubheading"),
              10.heightBox,
              DetailsBoxes(
                  firstheading: "BL Number",
                  firstsubheading: "12345678910",
                  secondheading: "Container Number",
                  secondsubheading: "12345678910"),
              10.heightBox,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DetailsBoxes(
                        firstheading: "Searial Number",
                        firstsubheading: "12345678910",
                        secondheading: "Gross Weight",
                        secondsubheading: "200kg"),
                  ),
                  10.widthBox,
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: padding14,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: crossAxisStart,
                        children: [
                          Text(
                            "No of Units",
                            style: context.bodySmall!.copyWith(fontSize: 14),
                          ),
                          Text(
                            "45",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              10.heightBox,
              DetailsBoxes(
                  firstheading: "Loading Port",
                  firstsubheading: "Japan Port",
                  secondheading: "Discharge Port",
                  secondsubheading: "Pakistan")
            ],
          ),
        ));
  }
}
