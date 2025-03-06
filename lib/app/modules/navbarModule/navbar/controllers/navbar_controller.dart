import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/modules/testview/views/testview_view.dart';

class NavbarController extends GetxController {
  List<Widget> screens = [
    HomeView(),
    SettingsView(),
    ContainerView(),
    TestviewView()
  ];
  var selectedIndex = 0.obs;
}
