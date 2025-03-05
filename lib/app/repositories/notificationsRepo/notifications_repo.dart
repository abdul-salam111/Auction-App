import 'package:auction_app/app/data/getModels/get_all_notifications.dart';

import '../../modules/modules.dart';
import '../../utils/utils.dart';

class NotificationsRepo {
  final apiService = NetworkServicesApi();

  Future<GetAllNotifications> getAllNotifications() async {
    try {
      final response = await apiService.getApi(AppUrls.getAllNotifications);
      return GetAllNotifications.fromJson(response);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }
}
