import '../modules/customerModule/managecustomer/views/managecustomer_view.dart';
import '../modules/modules.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => const ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.CONTAINER,
      page: () => const ContainerView(),
      binding: ContainerBinding(),
    ),
    GetPage(
      name: _Paths.ADDNEWCUSTOMER,
      page: () => const AddnewcustomerView(),
      binding: AddnewcustomerBinding(),
    ),
    GetPage(
      name: _Paths.MANAGECUSTOMER,
      page: () => const ManagecustomerView(),
      binding: ManagecustomerBinding(),
    ),
    GetPage(
      name: _Paths.MANAGECONTAINERS,
      page: () => const ManagecontainersView(),
      binding: ManagecontainersBinding(),
    ),
    GetPage(
      name: _Paths.ADDCONTAINER,
      page: () => const AddcontainerView(),
      binding: AddcontainerBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASSWORD,
      page: () => const ChangepasswordView(),
      binding: ChangepasswordBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.ADDNEWBID,
      page: () => const AddnewbidView(),
      binding: AddnewbidBinding(),
    ),
    GetPage(
      name: _Paths.AUCTIONREPORT_VEHICLES,
      page: () => const AuctionreportVehiclesView(),
      binding: AuctionreportVehiclesBinding(),
    ),
    GetPage(
      name: _Paths.AUCTIONS,
      page: () => const AuctionsView(),
      binding: AuctionsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTDETAILS,
      page: () => const ProductdetailsView(),
      binding: ProductdetailsBinding(),
    ),
    GetPage(
      name: _Paths.EDITPRODUCT,
      page: () => const EditproductView(),
      binding: EditproductBinding(),
    ),
    GetPage(
      name: _Paths.ADDNEWPRODUCT,
      page: () => const AddnewproductView(),
      binding: AddnewproductBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMERMANAGEMENT,
      page: () => const CustomermanagementView(),
      binding: CustomermanagementBinding(),
    ),
    GetPage(
      name: _Paths.EDITCONTAINERS,
      page: () => const EditcontainersView(),
      binding: EditcontainersBinding(),
    ),
  ];
}
