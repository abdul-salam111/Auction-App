import 'package:auction_app/app/modules/modules.dart';

class NavbarController extends GetxController {
  List<Widget> screens = [
    HomeView(),
    SettingsView(),
    ManagecontainersView(),
    AuctionsView()
  ];
  var selectedIndex = 0.obs;
}
