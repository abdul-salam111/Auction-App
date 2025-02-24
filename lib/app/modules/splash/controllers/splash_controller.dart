import 'package:auction_app/app/modules/modules.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
     nextScreen();
  }

  Future<void> nextScreen() async {
    await Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(Routes.LOGIN);
    });
  }
}
