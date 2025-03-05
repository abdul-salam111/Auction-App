import 'package:auction_app/app/modules/modules.dart';

class NavbarController extends GetxController {
  List<Widget> screens = [
    HomeView(),
    SettingsView(),
    ContainerView(),
    AuctionsView()
  ];
  var selectedIndex = 0.obs;

 
}
