import 'dart:convert';

import 'package:auction_app/app/data/getModels/get_all_notifications.dart';
import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/utils/utils.dart';
import 'package:local_auth/local_auth.dart';

class AuthRepository {
  final apiService = NetworkServicesApi();

  Future<void> loginUserByUID(
      LoginByUidModel loginModel,
      GetAllContainersModel getallcontainer,
      List<GetAllNotifications> getallnotifications) async {
    try {
      final response = await apiService.postApi(AppUrls.loginByUid, loginModel);
      if (response.toString().contains("Wrong password")) {
        Utils.anotherFlushbar(
            Get.context!, 'The Entered password is wrong!', Colors.red);
      } else {
        var data = AccessTokenModel.fromJson(response);

        await box.write(usertoken, data.accessToken);
        await box.write(isloggedIn, true);
        await getuserProfile();
        Get.toNamed(Routes.NAVBAR,
            arguments: [getallcontainer, getallnotifications]);
      }
    } on NotFoundException {
      Utils.anotherFlushbar(Get.context!, 'User not found', Colors.red);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
    }
  }

  //Local Auth for security
  final LocalAuthentication auth = LocalAuthentication();
  var isAuthenticated = false.obs;
  var authMessage = "Not Authenticated".obs;

  Future<void> authenticateWithFingerPrint(
      GetAllContainersModel getallcontainer,
      List<GetAllNotifications> getallnotifications) async {
    try {
      isAuthenticated.value = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      authMessage.value =
          isAuthenticated.value ? "Authenticated" : "Authentication Failed";

      if (isAuthenticated.value) {
        if (box.read(isloggedIn) != null && box.read(isloggedIn) == true) {
          Get.offAllNamed(Routes.NAVBAR,
              arguments: [getallcontainer, getallnotifications]);
        } else {
          Utils.anotherFlushbar(
            Get.context!,
            "Please, login first!",
            Colors.red,
          );
        }
      } else {
        Utils.anotherFlushbar(
          Get.context!,
          "Authentication Failed",
          Colors.red,
        );
      }
    } catch (e) {
      authMessage.value = "Error: ${e.toString()}";
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
    }
  }

  //get user profile
  Future<void> getuserProfile() async {
    try {
      final response = await apiService.getApi(AppUrls.getuserProfile);

      await box.write(userinformation, response);
     
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  //logout User
  Future<void> logoutUser() async {
    try {
      await apiService.postApi(AppUrls.logoutUser, {});
      await box.write(isloggedIn, false);
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }
}
