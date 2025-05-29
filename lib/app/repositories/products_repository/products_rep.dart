import 'dart:convert';
import 'dart:io';
import 'package:auction_app/app/data/postModels/add_new_sparepart.dart';
import 'package:auction_app/app/data/postModels/update_part_model.dart';
import 'package:auction_app/app/data/postModels/update_vehicle.dart';
import 'package:http/http.dart' as http;
import 'package:auction_app/app/data/postModels/update_status.dart';
import 'package:auction_app/app/modules/modules.dart';
import '../../data/postModels/add_new_vehicle.dart';
import 'package:path/path.dart';

class ProductsRepository {
  final network = NetworkServicesApi();
  Future<bool> updateProductStatus({required UpdateStatus updateStatus}) async {
    try {
      final response = await http.patch(
        Uri.parse(AppUrls.updateStatus),
        headers: {
          'Authorization': 'Bearer ${box.read(usertoken)}',
          "Content-Type": "application/json"
        },
        body: jsonEncode(updateStatus.toJson()),
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        print("Failed to update status: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Exception in patch request: $e");
      return false;
    }
  }

//add new car
  Future<bool> uploadVehicle(AddNewVehicle vehicle, List<File> images) async {
    final uri = Uri.parse(AppUrls.addNewVehicle);
    try {
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll({
        'Authorization': 'Bearer ${box.read(usertoken)}',
      });
      request.fields['body_type'] = vehicle.bodyType.toString();
      request.fields['make'] = vehicle.make.toString();
      request.fields['model'] = vehicle.model.toString();
      request.fields['year'] = vehicle.year?.toString() ?? "";
      request.fields['title'] = vehicle.title.toString();
      request.fields['name'] = vehicle.name?.toString() ?? "";
      request.fields['chassis_number'] = vehicle.chassisNumber.toString();
      request.fields['engine'] = vehicle.engine.toString();
      request.fields['mileage'] = vehicle.mileage.toString();
      request.fields['damage_details'] = vehicle.damageDetails.toString();
      request.fields['transmission'] = vehicle.transmission.toString();
      request.fields['clynder'] = vehicle.cylinder.toString();
      request.fields['location'] = vehicle.location.toString();
      request.fields['color'] = vehicle.color.toString();
      request.fields['engine'] = vehicle.engine.toString();
      request.fields['status'] = vehicle.status.toString();
      request.fields['description'] = vehicle.description.toString();
      request.fields['grade'] = vehicle.grade.toString();
      request.fields['score'] = vehicle.score.toString();
      request.fields['displacement'] = vehicle.displacement.toString();
      request.fields['total_price'] = (vehicle.totalPrice ?? 0).toString();
      request.fields['sold_price'] = (vehicle.soldPrice ?? 0).toString();

      request.fields['recieved_amount'] = vehicle.receivedAmount.toString();
      request.fields['balance_amount'] = vehicle.balanceAmount.toString();
      request.fields['auction_result'] = vehicle.auctionResult.toString();
      request.fields['condition'] = vehicle.condition.toString();
      request.fields['is_clear'] = 'True';
      request.fields['report_status'] = 'draft';
      request.fields['feature'] = vehicle.feature.toString();
      request.fields['fuel'] = vehicle.fuel.toString();
      request.fields['max_length'] = vehicle.maxLength.toString();
      request.fields['height'] = vehicle.height.toString();
      request.fields['wheel_base'] = vehicle.wheelBase.toString();
      request.fields['height_including_roof_rails'] =
          vehicle.heightIncludingRoofRails.toString();
      request.fields['luggage_capacity_seatsup'] =
          vehicle.luggageCapacitySeatsUp.toString();
      request.fields['luggage_capacity_seatsdown'] =
          vehicle.luggageCapacitySeatsDown.toString();
      request.fields['width'] = vehicle.width.toString();
      request.fields['width_including_mirrors'] =
          vehicle.widthIncludingMirrors.toString();
      request.fields['gross_vehicle_weight'] =
          vehicle.grossVehicleWeight.toString();
      request.fields['max_loading_weight'] =
          vehicle.maxLoadingWeight.toString();
      request.fields['max_roof_load'] = vehicle.maxRoofLoad.toString();
      request.fields['number_of_seats'] = vehicle.numberOfSeats.toString();
      request.fields['fuel_tank_capacity'] =
          vehicle.fuelTankCapacity.toString();
      request.fields['max_towing_weight_braked'] =
          vehicle.maxTowingWeightBraked.toString();
      request.fields['max_towing_weight_unbraked'] =
          vehicle.maxTowingWeightUnbraked.toString();
      request.fields['minimum_kerbweight'] =
          vehicle.minimumKerbweight.toString();
      request.fields['turning_circle_kerb_to_kerb'] =
          vehicle.turningCircleKerbToKerb.toString();
      request.fields['steer'] = vehicle.steer.toString();
      request.fields['drive_type'] = vehicle.driveType.toString();
      request.fields['doors'] = vehicle.doors.toString();
      request.fields['engine_name'] = vehicle.engineName.toString();
      request.fields['supplier'] = vehicle.supplier.toString();
      request.fields['air_conditioner'] =
          vehicle.airConditioner == true ? "1" : "0";
      request.fields['digital_odometer'] =
          vehicle.digitalOdometer == true ? "1" : "0";
      request.fields['heater'] = vehicle.heater == true ? "1" : "0";
      request.fields['sunroof'] = vehicle.sunroof == true ? "1" : "0";
      request.fields['power_windows'] =
          vehicle.powerWindows == true ? "1" : "0";
      request.fields['tv_led'] = vehicle.tvLed == true ? "1" : "0";
      request.fields['leather_seats'] =
          vehicle.leatherSeats == true ? "1" : "0";
      request.fields['tachometer'] = vehicle.tachometer == true ? "1" : "0";
      request.fields['headlight_leveler'] =
          vehicle.headlightLeveler == true ? "1" : "0";
      request.fields['am_fm_radio'] = vehicle.amFmRadio == true ? "1" : "0";
      request.fields['climate_control'] =
          vehicle.climateControl == true ? "1" : "0";
      request.fields['armrest_console'] =
          vehicle.armrestConsole == true ? "1" : "0";
      request.fields['rear_seat_armrest_centre_console'] =
          vehicle.rearSeatArmrestCentreConsole == true ? "1" : "0";
      request.fields['abs_antilock_braking'] =
          vehicle.absAntilockBraking == true ? "1" : "0";
      request.fields['child_safety_lock'] =
          vehicle.childSafetyLock == true ? "1" : "0";
      request.fields['driver_air_bag'] =
          vehicle.driverAirBag == true ? "1" : "0";
      request.fields['passanger_air_bag'] =
          vehicle.passengerAirBag == true ? "1" : "0";
      request.fields['rear_seat_air_bag'] =
          vehicle.rearSeatAirBag == true ? "1" : "0";
      request.fields['curtain_air_bag'] =
          vehicle.curtainAirBag == true ? "1" : "0";
      request.fields['power_door_lock'] =
          vehicle.powerDoorLock == true ? "1" : "0";
      request.fields['traction_control'] =
          vehicle.tractionControl == true ? "1" : "0";
      request.fields['oil_brakes'] = vehicle.oilBrakes == true ? "1" : "0";
      request.fields['air_brakes'] = vehicle.airBrakes == true ? "1" : "0";
      request.fields['tool_kit'] = vehicle.toolKit == true ? "1" : "0";
      request.fields['stepney_tyre'] = vehicle.stepneyTyre == true ? "1" : "0";
      request.fields['foot_parking_brake'] =
          vehicle.footParkingBrake == true ? "1" : "0";
      request.fields['fog_lights_front'] =
          vehicle.fogLightsFront == true ? "1" : "0";
      request.fields['alloy_rims'] = vehicle.alloyRims == true ? "1" : "0";
      request.fields['high_deck'] = vehicle.highDeck == true ? "1" : "0";
      request.fields['electric_pump'] =
          vehicle.electricPump == true ? "1" : "0";
      request.fields['justlow'] = vehicle.justLow == true ? "1" : "0";
      request.fields['crane_step'] = vehicle.craneStep == true ? "1" : "0";
      request.fields['HID_headlights'] =
          vehicle.hidHeadlights == true ? "1" : "0";
      request.fields['rear_wiper'] = vehicle.rearWiper == true ? "1" : "0";
      request.fields['sun_visor'] = vehicle.sunVisor == true ? "1" : "0";
      request.fields['power_streeing'] =
          vehicle.powerSteering == true ? "1" : "0";
      request.fields['push_start_smartkey'] =
          vehicle.pushStartSmartKey == true ? "1" : "0";
      request.fields['keyless_entry'] =
          vehicle.keylessEntry == true ? "1" : "0";
      request.fields['key_start'] = vehicle.keyStart == true ? "1" : "0";
      request.fields['navigation'] = vehicle.navigation == true ? "1" : "0";
      request.fields['remote_controller'] =
          vehicle.remoteController == true ? "1" : "0";
      request.fields['android_led'] = vehicle.androidLed == true ? "1" : "0";
      request.fields['bluetooth'] = vehicle.bluetooth == true ? "1" : "0";
      request.fields['front_door_speaker'] =
          vehicle.frontDoorSpeaker == true ? "1" : "0";
      request.fields['rear_door_speaker'] =
          vehicle.rearDoorSpeaker == true ? "1" : "0";
      request.fields['rear_deck_speaker'] =
          vehicle.rearDeckSpeaker == true ? "1" : "0";
      request.fields['ECO_mode'] = vehicle.ecoMode == true ? "1" : "0";
      request.fields['heated_seats'] = vehicle.heatedSeats == true ? "1" : "0";
      request.fields['power_seats'] = vehicle.powerSeats == true ? "1" : "0";
      request.fields['power_side_mirrors'] =
          vehicle.powerSideMirrors == true ? "1" : "0";
      request.fields['electric_rearview_mirror'] =
          vehicle.electricRearviewMirror == true ? "1" : "0";
      request.fields['dashboard_speakers'] =
          vehicle.dashboardSpeakers == true ? "1" : "0";
      request.fields['desmodromic_engine_technology'] =
          vehicle.desmodromicEngineTechnology == true ? "1" : "0";
      request.fields['fuel_injection'] =
          vehicle.fuelInjection == true ? "1" : "0";
      request.fields['lightweight_design'] =
          vehicle.lightweightDesign == true ? "1" : "0";
      request.fields['high_performance_suspension'] =
          vehicle.highPerformanceSuspension == true ? "1" : "0";
      request.fields['riding_ergonomics'] =
          vehicle.ridingErgonomics == true ? "1" : "0";
      request.fields['seat'] = vehicle.seat == true ? "1" : "0";
      request.fields['instrumentation'] =
          vehicle.instrumentation == true ? "1" : "0";
      request.fields['fuel_capacity'] =
          vehicle.fuelCapacity == true ? "1" : "0";
      request.fields['high_performance_brakes'] =
          vehicle.highPerformanceBrakes == true ? "1" : "0";
      request.fields['high_quality_tires'] =
          vehicle.highQualityTires == true ? "1" : "0";
      request.fields['lighting'] = vehicle.lighting == true ? "1" : "0";
      request.fields['storage'] = vehicle.storage == true ? "1" : "0";
      request.fields['security'] = vehicle.security == true ? "1" : "0";
      request.fields['adjustable_suspension'] =
          vehicle.adjustableSuspension == true ? "1" : "0";
      // Add image files
      for (int i = 0; i < images.length; i++) {
        File imageFile = images[i];
        String fileName = basename(imageFile.path);

        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            imageFile.path,
            filename: fileName,
          ),
        );
      }
      // Send request
      final response = await request.send();

      if (response.statusCode == 200) {
        await http.Response.fromStream(response);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  //add new truck
  Future<bool> addNewTruck(AddNewVehicle vehicle, List<File> images) async {
    final uri = Uri.parse(AppUrls.addNewTruck);
    try {
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll({
        'Authorization': 'Bearer ${box.read(usertoken)}',
      });
      request.fields['body_type'] = vehicle.bodyType.toString();
      request.fields['make'] = vehicle.make.toString();
      request.fields['model'] = vehicle.model.toString();
      request.fields['year'] = vehicle.year?.toString() ?? "";
      request.fields['title'] = vehicle.title.toString();
      request.fields['name'] = vehicle.name?.toString() ?? "";
      request.fields['chassis_number'] = vehicle.chassisNumber.toString();
      request.fields['engine'] = vehicle.engine.toString();
      request.fields['mileage'] = vehicle.mileage.toString();
      request.fields['damage_details'] = vehicle.damageDetails.toString();
      request.fields['transmission'] = vehicle.transmission.toString();
      request.fields['clynder'] = vehicle.cylinder.toString();
      request.fields['location'] = vehicle.location.toString();
      request.fields['color'] = vehicle.color.toString();
      request.fields['engine'] = vehicle.engine.toString();
      request.fields['status'] = vehicle.status.toString();
      request.fields['description'] = vehicle.description.toString();
      request.fields['grade'] = vehicle.grade.toString();
      request.fields['score'] = vehicle.score.toString();
      request.fields['displacement'] = vehicle.displacement.toString();
      request.fields['total_price'] = (vehicle.totalPrice ?? 0).toString();
      request.fields['sold_price'] = (vehicle.soldPrice ?? 0).toString();

      request.fields['recieved_amount'] = vehicle.receivedAmount.toString();
      request.fields['balance_amount'] = vehicle.balanceAmount.toString();
      request.fields['auction_result'] = vehicle.auctionResult.toString();
      request.fields['condition'] = vehicle.condition.toString();
      request.fields['is_clear'] = 'True';
      request.fields['report_status'] = 'draft';
      request.fields['feature'] = vehicle.feature.toString();
      request.fields['fuel'] = vehicle.fuel.toString();
      request.fields['max_length'] = vehicle.maxLength.toString();
      request.fields['height'] = vehicle.height.toString();
      request.fields['wheel_base'] = vehicle.wheelBase.toString();
      request.fields['height_including_roof_rails'] =
          vehicle.heightIncludingRoofRails.toString();
      request.fields['luggage_capacity_seatsup'] =
          vehicle.luggageCapacitySeatsUp.toString();
      request.fields['luggage_capacity_seatsdown'] =
          vehicle.luggageCapacitySeatsDown.toString();
      request.fields['width'] = vehicle.width.toString();
      request.fields['width_including_mirrors'] =
          vehicle.widthIncludingMirrors.toString();
      request.fields['gross_vehicle_weight'] =
          vehicle.grossVehicleWeight.toString();
      request.fields['max_loading_weight'] =
          vehicle.maxLoadingWeight.toString();
      request.fields['max_roof_load'] = vehicle.maxRoofLoad.toString();
      request.fields['number_of_seats'] = vehicle.numberOfSeats.toString();
      request.fields['fuel_tank_capacity'] =
          vehicle.fuelTankCapacity.toString();
      request.fields['max_towing_weight_braked'] =
          vehicle.maxTowingWeightBraked.toString();
      request.fields['max_towing_weight_unbraked'] =
          vehicle.maxTowingWeightUnbraked.toString();
      request.fields['minimum_kerbweight'] =
          vehicle.minimumKerbweight.toString();
      request.fields['turning_circle_kerb_to_kerb'] =
          vehicle.turningCircleKerbToKerb.toString();
      request.fields['steer'] = vehicle.steer.toString();
      request.fields['drive_type'] = vehicle.driveType.toString();
      request.fields['doors'] = vehicle.doors.toString();
      request.fields['engine_name'] = vehicle.engineName.toString();
      request.fields['supplier'] = vehicle.supplier.toString();
      request.fields['air_conditioner'] =
          vehicle.airConditioner == true ? "1" : "0";
      request.fields['digital_odometer'] =
          vehicle.digitalOdometer == true ? "1" : "0";
      request.fields['heater'] = vehicle.heater == true ? "1" : "0";
      request.fields['sunroof'] = vehicle.sunroof == true ? "1" : "0";
      request.fields['power_windows'] =
          vehicle.powerWindows == true ? "1" : "0";
      request.fields['tv_led'] = vehicle.tvLed == true ? "1" : "0";
      request.fields['leather_seats'] =
          vehicle.leatherSeats == true ? "1" : "0";
      request.fields['tachometer'] = vehicle.tachometer == true ? "1" : "0";
      request.fields['headlight_leveler'] =
          vehicle.headlightLeveler == true ? "1" : "0";
      request.fields['am_fm_radio'] = vehicle.amFmRadio == true ? "1" : "0";
      request.fields['climate_control'] =
          vehicle.climateControl == true ? "1" : "0";
      request.fields['armrest_console'] =
          vehicle.armrestConsole == true ? "1" : "0";
      request.fields['rear_seat_armrest_centre_console'] =
          vehicle.rearSeatArmrestCentreConsole == true ? "1" : "0";
      request.fields['abs_antilock_braking'] =
          vehicle.absAntilockBraking == true ? "1" : "0";
      request.fields['child_safety_lock'] =
          vehicle.childSafetyLock == true ? "1" : "0";
      request.fields['driver_air_bag'] =
          vehicle.driverAirBag == true ? "1" : "0";
      request.fields['passanger_air_bag'] =
          vehicle.passengerAirBag == true ? "1" : "0";
      request.fields['rear_seat_air_bag'] =
          vehicle.rearSeatAirBag == true ? "1" : "0";
      request.fields['curtain_air_bag'] =
          vehicle.curtainAirBag == true ? "1" : "0";
      request.fields['power_door_lock'] =
          vehicle.powerDoorLock == true ? "1" : "0";
      request.fields['traction_control'] =
          vehicle.tractionControl == true ? "1" : "0";
      request.fields['oil_brakes'] = vehicle.oilBrakes == true ? "1" : "0";
      request.fields['air_brakes'] = vehicle.airBrakes == true ? "1" : "0";
      request.fields['tool_kit'] = vehicle.toolKit == true ? "1" : "0";
      request.fields['stepney_tyre'] = vehicle.stepneyTyre == true ? "1" : "0";
      request.fields['foot_parking_brake'] =
          vehicle.footParkingBrake == true ? "1" : "0";
      request.fields['fog_lights_front'] =
          vehicle.fogLightsFront == true ? "1" : "0";
      request.fields['alloy_rims'] = vehicle.alloyRims == true ? "1" : "0";
      request.fields['high_deck'] = vehicle.highDeck == true ? "1" : "0";
      request.fields['electric_pump'] =
          vehicle.electricPump == true ? "1" : "0";
      request.fields['justlow'] = vehicle.justLow == true ? "1" : "0";
      request.fields['crane_step'] = vehicle.craneStep == true ? "1" : "0";
      request.fields['HID_headlights'] =
          vehicle.hidHeadlights == true ? "1" : "0";
      request.fields['rear_wiper'] = vehicle.rearWiper == true ? "1" : "0";
      request.fields['sun_visor'] = vehicle.sunVisor == true ? "1" : "0";
      request.fields['power_streeing'] =
          vehicle.powerSteering == true ? "1" : "0";
      request.fields['push_start_smartkey'] =
          vehicle.pushStartSmartKey == true ? "1" : "0";
      request.fields['keyless_entry'] =
          vehicle.keylessEntry == true ? "1" : "0";
      request.fields['key_start'] = vehicle.keyStart == true ? "1" : "0";
      request.fields['navigation'] = vehicle.navigation == true ? "1" : "0";
      request.fields['remote_controller'] =
          vehicle.remoteController == true ? "1" : "0";
      request.fields['android_led'] = vehicle.androidLed == true ? "1" : "0";
      request.fields['bluetooth'] = vehicle.bluetooth == true ? "1" : "0";
      request.fields['front_door_speaker'] =
          vehicle.frontDoorSpeaker == true ? "1" : "0";
      request.fields['rear_door_speaker'] =
          vehicle.rearDoorSpeaker == true ? "1" : "0";
      request.fields['rear_deck_speaker'] =
          vehicle.rearDeckSpeaker == true ? "1" : "0";
      request.fields['ECO_mode'] = vehicle.ecoMode == true ? "1" : "0";
      request.fields['heated_seats'] = vehicle.heatedSeats == true ? "1" : "0";
      request.fields['power_seats'] = vehicle.powerSeats == true ? "1" : "0";
      request.fields['power_side_mirrors'] =
          vehicle.powerSideMirrors == true ? "1" : "0";
      request.fields['electric_rearview_mirror'] =
          vehicle.electricRearviewMirror == true ? "1" : "0";
      request.fields['dashboard_speakers'] =
          vehicle.dashboardSpeakers == true ? "1" : "0";
      request.fields['desmodromic_engine_technology'] =
          vehicle.desmodromicEngineTechnology == true ? "1" : "0";
      request.fields['fuel_injection'] =
          vehicle.fuelInjection == true ? "1" : "0";
      request.fields['lightweight_design'] =
          vehicle.lightweightDesign == true ? "1" : "0";
      request.fields['high_performance_suspension'] =
          vehicle.highPerformanceSuspension == true ? "1" : "0";
      request.fields['riding_ergonomics'] =
          vehicle.ridingErgonomics == true ? "1" : "0";
      request.fields['seat'] = vehicle.seat == true ? "1" : "0";
      request.fields['instrumentation'] =
          vehicle.instrumentation == true ? "1" : "0";
      request.fields['fuel_capacity'] =
          vehicle.fuelCapacity == true ? "1" : "0";
      request.fields['high_performance_brakes'] =
          vehicle.highPerformanceBrakes == true ? "1" : "0";
      request.fields['high_quality_tires'] =
          vehicle.highQualityTires == true ? "1" : "0";
      request.fields['lighting'] = vehicle.lighting == true ? "1" : "0";
      request.fields['storage'] = vehicle.storage == true ? "1" : "0";
      request.fields['security'] = vehicle.security == true ? "1" : "0";
      request.fields['adjustable_suspension'] =
          vehicle.adjustableSuspension == true ? "1" : "0";
      // Add image files
      for (int i = 0; i < images.length; i++) {
        File imageFile = images[i];
        String fileName = basename(imageFile.path);

        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            imageFile.path,
            filename: fileName,
          ),
        );
      }
      // Send request
      final response = await request.send();

      if (response.statusCode == 200) {
        await http.Response.fromStream(response);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> addNewPart(AddNewPart addnewpart, List<File> images) async {
    final uri = Uri.parse(AppUrls.addNewPart);
    try {
      print(addnewpart.price);
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll({
        'Authorization': 'Bearer ${box.read(usertoken)}',
      });

      request.fields['part_id'] = addnewpart.partId.toString();
      request.fields['name'] = addnewpart.name.toString();
      request.fields['make'] = addnewpart.make.toString();
      request.fields['model'] = addnewpart.model.toString();
      request.fields['condition_report'] =
          addnewpart.conditionReport.toString();
      request.fields['category'] = addnewpart.category.toString();
      request.fields['price'] = (addnewpart.price ?? 0).toString();
      request.fields['description'] = addnewpart.description.toString();
      request.fields['status'] = addnewpart.status.toString();
      request.fields['is_clear'] = (addnewpart.isClear ?? true).toString();
      request.fields['report_status'] = addnewpart.reportStatus.toString();
      request.fields['sold_price'] = (addnewpart.soldPrice ?? 0).toString();
      request.fields['recieved_amount'] =
          (addnewpart.recievedAmount ?? 0).toString();
      request.fields['balance_amount'] =
          (addnewpart.balanceAmount ?? 0).toString();
      request.fields['feature'] = addnewpart.feature.toString();
      request.fields['supplier'] = addnewpart.supplier.toString();
      request.fields['fk_container_id'] =
          (addnewpart.fkContainerId ?? 0).toString();
      request.fields['fk_vehicle_id'] =
          (addnewpart.fkVehicleId ?? 0).toString();

      // Add image files
      for (int i = 0; i < images.length; i++) {
        File imageFile = images[i];
        String fileName = basename(imageFile.path);

        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            imageFile.path,
            filename: fileName,
          ),
        );
      }
      // Send request
      final response = await request.send();

      if (response.statusCode == 200) {
        await http.Response.fromStream(response);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteCar(String id) async {
    try {
      await network.deleteApi("${AppUrls.deleteCar}$id", {});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteTruck(String id) async {
    try {
      await network.deleteApi("${AppUrls.deleteTruck}$id", {});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteSparePart(String id) async {
    try {
      await network.deleteApi("${AppUrls.deleteSparePart}$id", {});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateCar(
      List<File> images, String id, UpdateVehicleModel updatevehicle) async {
    try {
      final uri = Uri.parse("${AppUrls.updateCar}$id");

      final request = http.MultipartRequest("PUT", uri);

      request.headers.addAll({
        'Authorization': 'Bearer ${box.read(usertoken)}',
      });

      // Add form fields
      request.fields['chassis_number'] = updatevehicle.chassisNumber ?? '';
      request.fields['name'] = updatevehicle.name ?? '';
      request.fields['color'] = updatevehicle.color ?? '';
      request.fields['make'] = updatevehicle.make ?? '';
      request.fields['model'] = updatevehicle.model ?? '';
      request.fields['year'] = updatevehicle.year ?? '';
      request.fields['fuel'] = updatevehicle.fuel ?? '';
      request.fields['transmission'] = updatevehicle.transmission ?? '';
      request.fields['condition'] = updatevehicle.condition ?? '';
      request.fields['price'] = updatevehicle.price ?? '';
      request.fields['mileage'] = updatevehicle.mileage ?? '';
      request.fields['description'] = updatevehicle.description ?? '';

      // Add images
      for (int i = 0; i < images.length; i++) {
        final imageFile = await http.MultipartFile.fromPath(
          'image',
          images[i].path,
        );
        request.files.add(imageFile);
      }

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Update successful: ${response.body}");
        return true;
      } else {
        print("Update failed: ${response.statusCode} ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error updating car: $e");
      return false;
    }
  }

  Future<bool> updateTruck(
      List<File> images, String id, UpdateVehicleModel updatevehicle) async {
    try {
      final uri = Uri.parse("${AppUrls.updateTruck}$id");

      final request = http.MultipartRequest("PUT", uri);

      request.headers.addAll({
        'Authorization': 'Bearer ${box.read(usertoken)}',
      });

      // Add form fields
      request.fields['chassis_number'] = updatevehicle.chassisNumber ?? '';
      request.fields['name'] = updatevehicle.name ?? '';
      request.fields['color'] = updatevehicle.color ?? '';
      request.fields['make'] = updatevehicle.make ?? '';
      request.fields['model'] = updatevehicle.model ?? '';
      request.fields['year'] = updatevehicle.year ?? '';
      request.fields['fuel'] = updatevehicle.fuel ?? '';
      request.fields['transmission'] = updatevehicle.transmission ?? '';
      request.fields['condition'] = updatevehicle.condition ?? '';
      request.fields['price'] = updatevehicle.price ?? '';
      request.fields['mileage'] = updatevehicle.mileage ?? '';
      request.fields['description'] = updatevehicle.description ?? '';

      // Add images
      for (int i = 0; i < images.length; i++) {
        final imageFile = await http.MultipartFile.fromPath(
          'image',
          images[i].path,
        );
        request.files.add(imageFile);
      }

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Update successful: ${response.body}");
        return true;
      } else {
        print("Update failed: ${response.statusCode} ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error updating car: $e");
      return false;
    }
  }

//update parts
  Future<bool> updatePart(
      List<File> images, String id, UpdatePartModel updatepartModel) async {
    try {
      final uri = Uri.parse("${AppUrls.updatePart}$id");

      final request = http.MultipartRequest("PUT", uri);

      request.headers.addAll({
        'Authorization': 'Bearer ${box.read(usertoken)}',
      });

      // Add form fields

      request.fields['name'] = updatepartModel.name ?? '';
      request.fields['part_id'] = updatepartModel.partId ?? '';
      request.fields['category'] = updatepartModel.category ?? '';
      request.fields['make'] = updatepartModel.make ?? '';
      request.fields['model'] = updatepartModel.model ?? '';
      request.fields['condition'] = updatepartModel.condition ?? '';
      request.fields['price'] = updatepartModel.price ?? '';

      // Add images
      for (int i = 0; i < images.length; i++) {
        final imageFile = await http.MultipartFile.fromPath(
          'image',
          images[i].path,
        );
        request.files.add(imageFile);
      }

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Update successful: ${response.body}");
        return true;
      } else {
        print("Update failed: ${response.statusCode} ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error updating car: $e");
      return false;
    }
  }
}
