import 'package:auction_app/app/modules/modules.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductdetailsView extends GetView<ProductdetailsController> {
  ProductdetailsView({super.key});
  @override
  final controller = Get.put(ProductdetailsController());
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: screenPadding,
            child: Column(
              crossAxisAlignment: crossAxisStart,
              children: [
                20.heightBox,
                Row(
                  children: [
                    BackTitleRow(title: "Product Details"),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(
                          DeletePopup(
                              title: "Delete Container",
                              message:
                                  "Are you sure you want to delete this Container?",
                              onConfirm: () async {
                                Get.back();
                              },
                              icon: "assets/icons/delete.png"),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.errorColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Iconsax.trash,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    5.widthBox,
                    GestureDetector(
                      onTap: () {
                        Get.dialog(
                          DeletePopup(
                              title: "Delete Container",
                              message:
                                  "Are you sure you want to delete this Container?",
                              onConfirm: () async {
                                Get.back();
                              },
                              icon: "assets/icons/delete.png"),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Iconsax.add,
                          color: AppColors.textColorWhite,
                          size: 15,
                        ),
                      ),
                    ),
                    5.widthBox,
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text("In Stock",
                            style: context.bodySmall!.copyWith(
                                color: AppColors.textColorWhite,
                                fontSize: 12))),
                    5.widthBox,
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("Edit",
                              style: context.bodySmall!.copyWith(
                                  color: AppColors.textColorWhite,
                                  fontSize: 12))),
                    ),
                  ],
                ),
                10.heightBox,
                Text('Status', style: context.bodyMedium),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: controller.selectedStatus.value,
                              icon:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              iconSize: 24,
                              elevation: 2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              onChanged: (String? newValue) {
                                controller.selectedStatus.value = newValue!;
                              },
                              items: controller.statusOptions
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    5.widthBox,
                    ElevatedButton(
                      onPressed: () {
                        // Your action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3166F5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.gavel_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Text('Add to Live Auction',
                              style: context.bodyMedium!
                                  .copyWith(color: AppColors.backgroundColor)),
                        ],
                      ),
                    )
                  ],
                ),
                10.heightBox,
                Stack(
                  alignment: bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0.0),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: controller.carImages.length,
                        onPageChanged: controller.onPageChanged,
                        itemBuilder: (context, index) {
                          return Image.network(
                            controller.carImages[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: controller.carImages.length,
                          effect: WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            activeDotColor: Colors.white,
                            dotColor: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                5.heightBox,
                DetailsBoxes(
                  firstheading: "Item ID",
                  firstsubheading: "438939",
                  secondheading: "Chassis No",
                  secondsubheading: "NCP-1234567890",
                ),
                5.heightBox,
                DetailsBoxes(
                  firstheading: "Item Name",
                  firstsubheading: "Toyota Corolla Altus",
                  secondheading: "Color",
                  secondsubheading: "White",
                ),
                5.heightBox,
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: DetailsBoxes(
                        firstheading: "Item Name",
                        firstsubheading: "Toyota Corolla Altus",
                        secondheading: "Color",
                        secondsubheading: "White",
                      ),
                    ),
                    5.widthBox,
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: padding10,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: crossAxisStart,
                          children: [
                            Text(
                              "Year",
                              style: context.bodySmall!.copyWith(fontSize: 14),
                            ),
                            Text(
                              "2025",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                5.heightBox,
                DetailsBoxes(
                  firstheading: "Item Name",
                  firstsubheading: "Toyota Corolla Altus",
                  secondheading: "Color",
                  secondsubheading: "White",
                ),
                5.heightBox,
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: DetailsBoxes(
                        firstheading: "Conditioned",
                        firstsubheading: "Used",
                        secondheading: "Price",
                        secondsubheading: "AED 30,0000",
                      ),
                    ),
                    5.widthBox,
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: padding10,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: crossAxisStart,
                          children: [
                            Text(
                              "Milage",
                              style: context.bodySmall!.copyWith(fontSize: 14),
                            ),
                            Text(
                              "2025 Km",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                5.heightBox,
                Row(
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
                              "Description",
                              style: context.bodySmall,
                            ),
                            Text(
                              "firstsubheading",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                10.heightBox
              ],
            ),
          ),
        ));
  }
}
