import 'package:auction_app/app/data/getModels/get_all_notifications.dart';

import '../../modules/modules.dart';
import '../../utils/utils.dart';

class NotificationsRepo {
  final apiService = NetworkServicesApi();

  Future<List<GetAllNotifications>> getAllNotifications() async {
    try {
      final response = await apiService.getApi(AppUrls.getAllNotifications);

      if (response != null && response is List) {
        return response
            .map((json) => GetAllNotifications.fromJson(json))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }
}
