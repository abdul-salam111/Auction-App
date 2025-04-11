import 'dart:convert';
import 'dart:io';

import 'package:auction_app/app/data/getModels/get_containers_count.dart';
import 'package:auction_app/app/data/postModels/add_new_container.dart';
import 'package:auction_app/app/modules/modules.dart';
import 'package:auction_app/app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

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

  //all containers arrived and upcoming
  Future<GetContainersCount> getContainersCount() async {
    try {
      final response = await apiService.getApi(AppUrls.getContainersCount);
      return GetContainersCount.fromJson(response);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  //add new container
  Future<bool> addNewContainer(AddNewContainer addnewcontainer) async {
    try {
      print(addnewcontainer.toJson());
      var uri = Uri.parse(AppUrls.addnewContainer);
      var request = http.MultipartRequest('POST', uri);

      request.headers['Authorization'] = 'Bearer ${box.read(usertoken)}';

      request.fields['shipper'] = addnewcontainer.shipper.toString();
      request.fields['shipping_company'] =
          addnewcontainer.shippingCompany.toString();
      request.fields['bl_number'] = addnewcontainer.blNumber.toString();
      request.fields['container_number'] =
          addnewcontainer.containerNumber.toString();
      request.fields['seal_number'] = addnewcontainer.sealNumber.toString();
      request.fields['gross_weight'] = addnewcontainer.grossWeight.toString();
      request.fields['port_of_discharge'] =
          addnewcontainer.portOfDischarge.toString();
      request.fields['port_of_loading'] =
          addnewcontainer.portOfLoading.toString();
      request.fields['no_of_units'] = addnewcontainer.noOfUnits.toString();
      request.fields['status'] = addnewcontainer.status.toString();
      request.fields['description'] = addnewcontainer.description.toString();

      // Add files
      for (String imagePath in addnewcontainer.images!) {
        var file = File(imagePath);
        var stream = http.ByteStream(file.openRead());
        var length = await file.length();

        var multipartFile = http.MultipartFile(
          'image',
          stream,
          length,
          filename: basename(file.path),
          contentType: MediaType.parse(
            lookupMimeType(file.path) ?? 'application/octet-stream',
          ),
        );

        request.files.add(multipartFile);
      }

      // Add JSON-encoded data
      request.fields['vehicles'] = jsonEncode(addnewcontainer.vehicles ?? []);
      request.fields['parts'] = jsonEncode(addnewcontainer.parts ?? []);

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        Utils.anotherFlushbar(Get.context!,
            'Failed with status ${response.statusCode}', Colors.red);
        return false;
      }
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      return false;
    }
  }

  //get single containers details
  Future<FetchSingleContainerDetails> getSingleContainerDetails(
      String containerId) async {
    try {
      final response = await apiService
          .getApi("${AppUrls.fetchSingleContainerDetails}$containerId");
      return FetchSingleContainerDetails.fromJson(response);
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      throw Exception(e);
    }
  }

  //update container detials
  Future<bool> updateContainerDetails(
      AddNewContainer addnewcontainer, String containerId) async {
    try {
      var uri = Uri.parse("${AppUrls.fetchSingleContainerDetails}$containerId");

      var response = await http.put(
        uri,
        headers: {
          'Authorization': 'Bearer ${box.read(usertoken)}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'shipper': addnewcontainer.shipper,
          'shipping_company': addnewcontainer.shippingCompany,
          'bl_number': addnewcontainer.blNumber,
          'container_number': addnewcontainer.containerNumber,
          'seal_number': addnewcontainer.sealNumber,
          'gross_weight': addnewcontainer.grossWeight,
          'port_of_discharge': addnewcontainer.portOfDischarge,
          'port_of_loading': addnewcontainer.portOfLoading,
          'no_of_units': addnewcontainer.noOfUnits,
          'status': addnewcontainer.status,
          'description': addnewcontainer.description,
          'vehicles': addnewcontainer.vehicles ?? [],
          'parts': addnewcontainer.parts ?? [],
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        Utils.anotherFlushbar(
          Get.context!,
          'Failed with status ${response.statusCode}',
          Colors.red,
        );
        return false;
      }
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      return false;
    }
  }

  //delete a container
  Future<bool> deleteContainer(String containerId) async {
    try {
      await apiService.deleteApi(
          "https://api.bigstaruae.com/v1/container/$containerId", {});
      return true;
    } catch (e) {
      Utils.anotherFlushbar(Get.context!, e.toString(), Colors.red);
      return false;
    }
  }
}
