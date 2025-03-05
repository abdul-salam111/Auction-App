import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/utils/utils.dart';

class ContainerRepository {
  final apiService = NetworkServicesApi();
  Future<GetAllContainersModel> getAllContainers() async {
    try {
      final response = await apiService.getApi(AppUrls.getAllContainers);
      return GetAllContainersModel.fromJson(response);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }
}
