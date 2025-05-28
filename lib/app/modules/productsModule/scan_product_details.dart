import 'package:auction_app/app/modules/productsModule/productdetails/controllers/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../routes/app_pages.dart';

class ScanProductDetails extends StatefulWidget {
  const ScanProductDetails({super.key});

  @override
  _ScanProductDetailsState createState() => _ScanProductDetailsState();
}

class _ScanProductDetailsState extends State<ScanProductDetails>
    with SingleTickerProviderStateMixin {
  final MobileScannerController cameraController = MobileScannerController();
  final productDetails = Get.put(ProductdetailsController());
  String? barcode;
  bool _isTorchOn = false;
  CameraFacing _cameraFacing = CameraFacing.back;

  late AnimationController _animationController;
  late Animation<double> _animation;
  late bool isUpdateSalesScreen;
  @override
  void initState() {
    super.initState();
    isUpdateSalesScreen = Get.arguments;
    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    // Initialize the animation
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
        actions: [
          IconButton(
            icon: Icon(
              _isTorchOn ? Icons.flash_on : Icons.flash_off,
              color: _isTorchOn ? Colors.yellow : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isTorchOn = !_isTorchOn;
              });
              cameraController.toggleTorch();
            },
          ),
          IconButton(
            icon: Icon(
              _cameraFacing == CameraFacing.back
                  ? Icons.camera_rear
                  : Icons.camera_front,
            ),
            onPressed: () {
              setState(() {
                _cameraFacing = _cameraFacing == CameraFacing.back
                    ? CameraFacing.front
                    : CameraFacing.back;
              });
              cameraController.switchCamera();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (barcodeCapture) {
              final barcode = barcodeCapture.barcodes.firstOrNull;
              if (barcode != null) {
                final raw = barcode.rawValue;
                if (raw != null && raw != this.barcode) {
                  setState(() {
                    this.barcode = raw;
                  });
                  final RegExp regex = RegExp(r"images:\s*\[([^\]]+)\]");
                  final match = regex.firstMatch(barcode.rawValue!);

                  List<String> imageUrls = [];

                  if (match != null) {
                    String urlsString = match.group(1)!;
                    imageUrls = urlsString
                        .split(',')
                        .map((e) => e.trim().replaceAll("'", ""))
                        .toList();
                  }
                  productDetails.carImages.value = imageUrls;

                  final vehicleData = parseQrData(raw);

                  final String classification =
                      vehicleData['classification'] ?? '';
                  productDetails.classificaction.value = classification;

                  if (classification == "vehicle" ||
                      classification == "truck") {
                    // Extracting each value
                    final int id = int.tryParse(vehicleData['id'] ?? '') ?? 0;
                    final String name = vehicleData['name'] ?? '';
                    final String chassisNumber =
                        vehicleData['chassis_number'] ?? '';
                    final String make = vehicleData['make'] ?? '';
                    final String model = vehicleData['model'] ?? '';
                    final int year =
                        int.tryParse(vehicleData['year'] ?? '') ?? 0;
                    final String color = vehicleData['color'] ?? '';
                    final String fuel = vehicleData['fuel'] ?? '';
                    final String transmission =
                        vehicleData['transmission'] ?? '';
                    final String condition = vehicleData['condition'] ?? '';
                    final double totalPrice = double.tryParse(
                            vehicleData['total_price'] == "None"
                                ? "0.0"
                                : vehicleData['total_price']!) ??
                        0.0;
                    final String mileage = vehicleData['mileage'] ?? '';
                    final double soldPrice = double.tryParse(
                            vehicleData['sold_price'] == "None"
                                ? "0.0"
                                : vehicleData['sold_price']!) ??
                        0.0;
                    final String status = vehicleData['status'] ?? '';
                    final String recievedAmount =
                        vehicleData['recieved_amount'] == "None"
                            ? "0.0"
                            : vehicleData['recieved_amount']!;
                    final String balanceAmount =
                        vehicleData['balance_amount'] == "None"
                            ? "0.0"
                            : vehicleData['balance_amount']!;
                    final String description = vehicleData['description'] ?? '';
                    productDetails.itemId.value = id.toString();
                    productDetails.chasisnumber.value = chassisNumber;

                    productDetails.name.value = name;
                    productDetails.model.value = model;
                    productDetails.totatlPrice.value = totalPrice.toString();
                    productDetails.color.value = color;
                    productDetails.make.value = make;
                    productDetails.year.value = year.toString();
                    productDetails.fueltype.value = fuel;
                    productDetails.transmission.value = transmission;
                    productDetails.condition.value = condition;
                    productDetails.mileage.value = mileage;
                    productDetails.soldPrice.value = soldPrice.toString();
                    productDetails.status.value = status;
                    productDetails.recievedAmount.value =
                        recievedAmount.toString();
                    productDetails.balanceAmount.value =
                        balanceAmount.toString();
                    productDetails.description.value = description.toString();

                    Get.toNamed(Routes.PRODUCTDETAILS,
                        arguments: isUpdateSalesScreen);
                  } else {
                    final int id = int.tryParse(vehicleData['id'] ?? '') ?? 0;
                    productDetails.itemId.value = id.toString();
                    final String name = vehicleData['name'] ?? '';
                    productDetails.name.value = name;
                    final String category = vehicleData['category'] ?? '';
                    productDetails.category.value = category;
                    final String make = vehicleData['make'] ?? '';
                    final String condition = vehicleData['condition'] ?? '';
                    productDetails.condition.value = condition;

                    productDetails.make.value = make;
                    final String model = vehicleData['model'] ?? '';
                    productDetails.model.value = model;
                    final double totalPrice = double.tryParse(
                            vehicleData['total_price'] == "None"
                                ? "0.0"
                                : vehicleData['total_price']!) ??
                        0.0;
                    final double soldPrice = double.tryParse(
                            vehicleData['sold_price'] == "None"
                                ? "0.0"
                                : vehicleData['sold_price']!) ??
                        0.0;
                    productDetails.soldPrice.value = soldPrice.toString();
                    final String recievedAmount =
                        vehicleData['recieved_amount'] == "None"
                            ? "0.0"
                            : vehicleData['recieved_amount']!;
                    final String balanceAmount =
                        vehicleData['balance_amount'] == "None"
                            ? "0.0"
                            : vehicleData['balance_amount']!;
                    productDetails.recievedAmount.value =
                        recievedAmount.toString();
                    productDetails.balanceAmount.value =
                        balanceAmount.toString();
                    productDetails.totatlPrice.value = totalPrice.toString();
                    Get.toNamed(Routes.PRODUCTDETAILS,
                        arguments: isUpdateSalesScreen);
                  }
                }
              }
            },
          ),
          _buildScanningOverlay(),
        ],
      ),
    );
  }

  Widget _buildScanningOverlay() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.5,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: _buildCornerShape(),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Transform.rotate(
                angle: 1.5708,
                child: _buildCornerShape(),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Transform.rotate(
                angle: -1.5708, // -90 degrees in radians
                child: _buildCornerShape(),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Transform.rotate(
                angle: 3.1416, // 180 degrees in radians
                child: _buildCornerShape(),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                      offset: Offset(
                        0,
                        _animation.value *
                            (MediaQuery.of(context).size.width * 0.5 - 2),
                      ),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green
                                  .withOpacity(0.9), // Green shadow color
                              blurRadius: 8, // Spread effect
                              offset: Offset(0, 9), // Moves shadow downwards
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build a corner shape for the scanning overlay
  Widget _buildCornerShape() {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white,
            width: 4,
          ),
          left: BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
      ),
    );
  }

  // Show a dialog or snackbar with the scanned barcode
  // void _showBarcodeResult(String barcode) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       backgroundColor: AppColors.secondaryColor,
  //       content: Text('Product Added'),
  //       duration: Duration(seconds: 2),
  //     ),
  //   );
  // }
}

Map<String, String> parseQrData(String data) {
  final Map<String, String> result = {};
  final pairs = data.split(',');

  for (var pair in pairs) {
    final parts = pair.split(':');
    if (parts.length >= 2) {
      final key = parts[0].trim();
      final value =
          parts.sublist(1).join(':').trim(); // handles values with ':'
      result[key] = value;
    }
  }

  return result;
}
