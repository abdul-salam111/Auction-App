import 'dart:io';

import 'package:auction_app/app/data/getModels/get_truck_data.dart';
import 'package:auction_app/app/modules/modules.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../data/postModels/add_new_vehicle.dart';
import '../../../../repositories/products_repository/products_rep.dart';

class AddnewproductController extends GetxController {
  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final mileageController = TextEditingController();
  final yearController = TextEditingController();
  final seatcapacityController = TextEditingController();

  final cylnderController = TextEditingController();
  final chasisnumberController = TextEditingController();
  final gradeController = TextEditingController();
  final supplierController = TextEditingController();
  final engineNameController = TextEditingController();
  final fuelcapacityController = TextEditingController();
  final kerbweightController = TextEditingController();
  final towingWeightController = TextEditingController();
  final turningCircleController = TextEditingController();
  final unbrakedtowingController = TextEditingController();
  final descriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  var selectedImages = <File>[].obs;

  final getAllTruckDataModel = GetTruckData().obs;
  //get all car data //including models body type etc..
  Future<void> getAllTruckData() async {
    getAllTruckDataModel.value = await productsRepository.getAllTruckData();
    bodyTypes.addAll(
        getAllTruckDataModel.value.data!.map((e) => e.bodyType ?? "").toSet());

    makes.addAll(
        getAllTruckDataModel.value.data!.map((e) => e.make ?? "").toSet());

    truckModels.addAll(
        getAllTruckDataModel.value.data!.map((e) => e.model ?? "").toSet());

    scoreValues.addAll(
        getAllTruckDataModel.value.data!.map((e) => e.score ?? "").toSet());

    displacements.addAll(getAllTruckDataModel.value.data!
        .map((e) => e.displacement ?? "")
        .toSet());

    colors.addAll(
        getAllTruckDataModel.value.data!.map((e) => e.color ?? "").toSet());
  }

  // Pick images from gallery
  Future<void> pickImagesFromGallery() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();
    selectedImages.addAll(pickedFiles.map((e) => File(e.path)));
  }

  // Pick image from camera
  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImages.add(File(pickedFile.path));
    }
  }

  // Remove image from the list
  void removeImage(int index) {
    selectedImages.removeAt(index);
  }

  var selectedBodyType = "".obs;
  var selectedMake = "".obs;
  var selectedModel = "".obs;
  var selectedCondition = "".obs;
  var selectedTransmission = "".obs;
  var selectedFuelType = "".obs;
  var selectedDriverType = "".obs;
  var selectedDoors = "".obs;
  var selectedStatus = "".obs;
  var selectedSteer = "".obs;
  var selectedScore = "".obs;
  var featureProduct = "".obs;
  var selectedDisplacement = "".obs;
  var selectedColor = "".obs;

  final formKey = GlobalKey<FormState>();

  var features = {
    "Interior": [
      Feature(name: "Air Conditioner"),
      Feature(name: "AM/FM Radio"),
      Feature(name: "Armrest Console"),
      Feature(name: "Climate Control"),
      Feature(name: "Digital Odometer"),
      Feature(name: "Headlight Leveler"),
      Feature(name: "Heater"),
      Feature(name: "Leather Seats"),
      Feature(name: "Power Windows"),
      Feature(name: "Rear Seat Armrest Centre Console"),
      Feature(name: "Sunroof"),
      Feature(name: "Tachometer"),
      Feature(name: "TV/LED"),
    ],
    "Safety": [
      Feature(name: "ABS"),
      Feature(name: "Air Brakes"),
      Feature(name: "Child Safety Locks"),
      Feature(name: "Curtain Air Bags"),
      Feature(name: "Driver + Passenger Seat Air Bags"),
      Feature(name: "Driver Air Bag"),
      Feature(name: "Foot Parking Brake"),
      Feature(name: "Oil Brakes"),
      Feature(name: "Power Door Locks"),
      Feature(name: "Rear Seat Air Bags"),
      Feature(name: "Stepney Tyre"),
      Feature(name: "Tool Kit"),
      Feature(name: "Traction Control"),
    ],
    "Exterior": [
      Feature(name: "Alloy Rims"),
      Feature(name: "Crane step"),
      Feature(name: "Electric Pump"),
      Feature(name: "Fog Lights Front"),
      Feature(name: "HID Headlights"),
      Feature(name: "High Deck"),
      Feature(name: "Justlow"),
      Feature(name: "Rear Wiper"),
      Feature(name: "Sun Visor"),
    ],
    "Comfort & Convenience": [
      Feature(name: "Android LED"),
      Feature(name: "Bluetooth"),
      Feature(name: "Dashboard Speakers"),
      Feature(name: "ECO Mode"),
      Feature(name: "Electric Rearview Mirror"),
      Feature(name: "Front Door Speakers"),
      Feature(name: "Heated Seats"),
      Feature(name: "Key Start"),
      Feature(name: "Keyless Entery"),
      Feature(name: "Navigation"),
      Feature(name: "Power Seats"),
      Feature(name: "Power Side Mirrors"),
      Feature(name: "Power Steering"),
      Feature(name: "Push Start (Smart Key)"),
      Feature(name: "Rear Deck Speakers"),
      Feature(name: "Rear Door Speakers"),
      Feature(name: "Remote Controller"),
    ],
  }.obs;

  void toggleFeature(String section, int index) {
    features[section]![index].isSelected =
        !features[section]![index].isSelected;
    features.refresh();
  }

  var bikeFeatures = {
    "Performance": [
      Feature(name: "Desmodromic Engine Technology"),
      Feature(name: "Fuel Injection"),
      Feature(name: "High-Performance Suspension"),
      Feature(name: "Lightweight Design"),
    ],
    "Comfort and Usability": [
      Feature(name: "Fuel Capacity"),
      Feature(name: "Instrumentation"),
      Feature(name: "Riding Ergonomics"),
      Feature(name: "Seat"),
    ],
    "Safety": [
      Feature(name: "High-Performance Brakes"),
      Feature(name: "High-Quality Tires"),
    ],
    "Convenience": [
      Feature(name: "Adjustable Suspension"),
      Feature(name: "Lighting"),
      Feature(name: "Security"),
      Feature(name: "Storage"),
    ],
  }.obs;

  void toggleBikeFeature(String section, int index) {
    final feature = bikeFeatures[section]![index];
    feature.isSelected = !feature.isSelected;
    bikeFeatures.refresh();
  }

  AddNewVehicle data = AddNewVehicle();
  var isAddingProduct = false.obs;
  ProductsRepository productsRepository = ProductsRepository();
  Future<void> addNewTruck() async {
    try {
      isAddingProduct.value = true;

      // Get all selected features

      final newVehicle = AddNewVehicle(
          fuelTankCapacity: fuelcapacityController.text.toString(),
          bodyType: selectedBodyType.value,
          condition: selectedCondition.value,
          transmission: selectedTransmission.value,
          mileage: mileageController.text,
          fuel: selectedFuelType.value,
          year: yearController.text,
          numberOfSeats: seatcapacityController.text,
          driveType: selectedDriverType.value,
          engine: engineNameController.text,
          doors: selectedDoors.value,
          cylinder: cylnderController.text,
          displacement: selectedDisplacement.value,
          chassisNumber: chasisnumberController.text,
          name: nameController.text,
          title: titleController.text,
          grade: gradeController.text,
          supplier: supplierController.text,
          description: descriptionController.text,
          make: selectedMake.value,
          model: selectedModel.value,
          status: selectedStatus.value,
          steer: selectedSteer.value,
          score: selectedScore.value,
          // Features
          balanceAmount: "",
          receivedAmount: "",
          airConditioner: getFeatureSelected("Interior", "Air Conditioner"),
          digitalOdometer: getFeatureSelected("Interior", "Digital Odometer"),
          heater: getFeatureSelected("Interior", "Heater"),
          leatherSeats: getFeatureSelected("Interior", "Leather Seats"),
          sunroof: getFeatureSelected("Interior", "Sunroof"),
          tachometer: getFeatureSelected("Interior", "Tachometer"),
          powerWindows: getFeatureSelected("Interior", "Power Windows"),
          absAntilockBraking: getFeatureSelected("Safety", "ABS"),
          passengerAirBag: getFeatureSelected(
                  "Safety", "Driver + Passenger Seat Air Bags") ||
              getFeatureSelected("Safety", "Driver Air Bag") ||
              getFeatureSelected("Safety", "Rear Seat Air Bags"),
          childSafetyLock: getFeatureSelected("Safety", "Child Safety Locks"),
          driverAirBag: getFeatureSelected("Safety", "Driver Air Bag"),
          powerDoorLock: getFeatureSelected("Safety", "Power Door Locks"),
          rearSeatAirBag: getFeatureSelected("Safety", "Rear Seat Air Bags"),
          tractionControl: getFeatureSelected("Safety", "Traction Control"),
          fogLightsFront: getFeatureSelected("Exterior", "Fog Lights Front"),
          rearWiper: getFeatureSelected("Exterior", "Rear Wiper"),
          alloyRims: getFeatureSelected("Exterior", "Alloy Rims"),
          highDeck: getFeatureSelected("Exterior", "High Deck"),
          androidLed:
              getFeatureSelected("Comfort & Convenience", "Android LED"),
          pushStartSmartKey: getFeatureSelected(
              "Comfort & Convenience", "Push Start (Smart Key)"),
          bluetooth: getFeatureSelected("Comfort & Convenience", "Bluetooth"),
          powerSteering:
              getFeatureSelected("Comfort & Convenience", "Power Steering"),
          tvLed: getFeatureSelected("Interior", "TV/LED"),
          headlightLeveler: getFeatureSelected("Interior", "Headlight Leveler"),
          amFmRadio: getFeatureSelected("Interior", "AM/FM Radio"),
          climateControl: getFeatureSelected("Interior", "Climate Control"),
          armrestConsole: getFeatureSelected("Interior", "Armrest Console"),
          rearSeatArmrestCentreConsole: getFeatureSelected(
              "Interior", "Rear Seat Armrest Centre Console"),
          curtainAirBag: getFeatureSelected("Safety", "Curtain Air Bags"),
          oilBrakes: getFeatureSelected("Safety", "Oil Brakes"),
          airBrakes: getFeatureSelected("Safety", "Air Brakes"),
          toolKit: getFeatureSelected("Safety", "Tool Kit"),
          stepneyTyre: getFeatureSelected("Safety", "Stepney Tyre"),
          footParkingBrake: getFeatureSelected("Safety", "Foot Parking Brake"),
          electricPump: getFeatureSelected("Exterior", "Electric Pump"),
          justLow: getFeatureSelected("Exterior", "Justlow"),
          craneStep: getFeatureSelected("Exterior", "Crane step"),
          hidHeadlights: getFeatureSelected("Exterior", "HID Headlights"),
          keylessEntry:
              getFeatureSelected("Comfort & Convenience", "Keyless Entery"),
          keyStart: getFeatureSelected("Comfort & Convenience", "Key Start"),
          navigation: getFeatureSelected("Comfort & Convenience", "Navigation"),
          remoteController:
              getFeatureSelected("Comfort & Convenience", "Remote Controller"),
          frontDoorSpeaker: getFeatureSelected(
              "Comfort & Convenience", "Front Door Speakers"),
          rearDoorSpeaker:
              getFeatureSelected("Comfort & Convenience", "Rear Door Speakers"),
          rearDeckSpeaker:
              getFeatureSelected("Comfort & Convenience", "Rear Deck Speakers"),
          ecoMode: getFeatureSelected("Comfort & Convenience", "ECO Mode"),
          heatedSeats:
              getFeatureSelected("Comfort & Convenience", "Heated Seats"),
          powerSeats:
              getFeatureSelected("Comfort & Convenience", "Power Seats"),
          powerSideMirrors:
              getFeatureSelected("Comfort & Convenience", "Power Side Mirrors"),
          electricRearviewMirror: getFeatureSelected(
              "Comfort & Convenience", "Electric Rearview Mirror"),
          sunVisor: getFeatureSelected("Exterior", "Sun Visor"),
          dashboardSpeakers:
              getFeatureSelected("Comfort & Convenience", "Dashboard Speakers"),

          // Bike features if needed
          desmodromicEngineTechnology: getBikeFeatureSelected(
              "Performance", "Desmodromic Engine Technology"),
          fuelInjection:
              getBikeFeatureSelected("Performance", "Fuel Injection"),
          lightweightDesign:
              getBikeFeatureSelected("Performance", "Lightweight Design"),
          highPerformanceSuspension: getBikeFeatureSelected(
              "Performance", "High-Performance Suspension"),
          ridingErgonomics: getBikeFeatureSelected(
              "Comfort and Usability", "Riding Ergonomics"),
          seat: getBikeFeatureSelected("Comfort and Usability", "Seat"),
          instrumentation: getBikeFeatureSelected(
              "Comfort and Usability", "Instrumentation"),
          location:
              "Big Star used cars and spare parts, Industrial Area 3 - Industrial Area - Sharjah - United Arab Emirates",
          fuelCapacity:
              getBikeFeatureSelected("Comfort and Usability", "Fuel Capacity"),
          highPerformanceBrakes:
              getBikeFeatureSelected("Safety", "High-Performance Brakes"),
          highQualityTires:
              getBikeFeatureSelected("Safety", "High-Quality Tires"),
          lighting: getBikeFeatureSelected("Convenience", "Lighting"),
          storage: getBikeFeatureSelected("Convenience", "Storage"),
          security: getBikeFeatureSelected("Convenience", "Security"),
          adjustableSuspension:
              getBikeFeatureSelected("Convenience", "Adjustable Suspension"),
          maxLength: kerbweightController.text,
          minimumKerbweight: kerbweightController.text,
          maxTowingWeightBraked: towingWeightController.text,
          maxTowingWeightUnbraked: unbrakedtowingController.text,
          turningCircleKerbToKerb: turningCircleController.text,
          feature: featureProduct.value);
      data = newVehicle;
      bool isAdded =
          await productsRepository.addNewTruck(newVehicle, selectedImages);

      isAddingProduct.value = false;
      if (isAdded) {
        Get.dialog(
          CustomSuccessDialog(
              title: "Truck Added!",
              message: "The Truck is Added Successfully!",
              onConfirm: () async {
                Get.back();
                Get.back();
                Get.back();
                Get.back();
              },
              icon: "assets/icons/done.png"),
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add vehicle: $e');
      isAddingProduct.value = false;
    } finally {
      isAddingProduct.value = false;
    }
  }

// Add this helper method for bike features
  bool getBikeFeatureSelected(String section, String featureName) {
    return bikeFeatures[section]
            ?.firstWhere(
              (feature) => feature.name == featureName,
              orElse: () => Feature(name: "", isSelected: false),
            )
            .isSelected ??
        false;
  }

  bool getFeatureSelected(String section, String featureName) {
    return features[section]
            ?.firstWhere(
              (feature) => feature.name == featureName,
              orElse: () => Feature(name: "", isSelected: false),
            )
            .isSelected ??
        false;
  }

  final List<String> bodyTypes = [];

  final List<String> makes = [];

  final List<String> truckModels = [];
  final List<String> transmissionTypes = [
    'AT',
    'IA',
    'FAT',
    'MT',
    'F5',
    'F6',
    'FA',
    'IAT',
  ];

  final List<String> fuelTypes = [
    'Petrol',
    'Diesel',
    'Electric',
    'Hybrid',
    'Hybrid-Gasoline',
    'Hybrid-Diesel',
    'Hybrid-Gasoline-Electric',
    'Hybrid-Gasoline-LPG',
  ];

  final List<String> driverTypes = [
    '4WD',
    '2WD',
    'FWD',
    'AWD',
    'RWD',
    '1WD',
  ];

  final List<String> doorTypes = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    'Sliding Door ( 1 Side )',
    'Sliding Doors ( Both Side )',
    'Double Rear Door',
    'Single Rear Door',
    'Hatchback Door',
    'Gullwing Door',
    'Butterfly Door',
    'Suicide Door',
    'Barn Door',
    'Split Tailgate',
    'Single Tailgate',
    'Half Door',
  ];

  final List<String> scoreValues = [];
  final List<String> displacements = [];
  final List<String> colors = [];

  @override
  void onInit() {
    super.onInit();
    getAllTruckData();
  }
}

class Feature {
  final String name;
  bool isSelected;

  Feature({required this.name, this.isSelected = false});
}
