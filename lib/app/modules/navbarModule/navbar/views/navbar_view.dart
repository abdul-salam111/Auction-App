import 'package:auction_app/app/modules/modules.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: context.primaryColor,
            selectedItemColor: AppColors.backgroundColor,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(controller.selectedIndex.value == 0
                    ? Iconsax.home_15
                    : Iconsax.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(controller.selectedIndex.value == 1
                    ? Iconsax.scan_barcode
                    : Iconsax.scan),
                label: "Settings",
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.truck),
                label: "Container",
              ),
              BottomNavigationBarItem(
                icon: Icon(controller.selectedIndex.value == 3
                    ? Iconsax.judge5
                    : Iconsax.judge),
                label: "Auctions",
              ),
            ],
          ),
        ),
        body: Obx(() =>
            controller.screens.elementAt(controller.selectedIndex.value)));
  }
}
