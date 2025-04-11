// import 'package:auction_app/app/res/colors.dart';

import 'package:auction_app/app/data/postModels/auction_bid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/addnewbid_controller.dart';

class AddBidsScanner extends StatefulWidget {
  const AddBidsScanner({super.key});

  @override
  _AddBidsScannerState createState() => _AddBidsScannerState();
}

class _AddBidsScannerState extends State<AddBidsScanner>
    with SingleTickerProviderStateMixin {
  final MobileScannerController cameraController = MobileScannerController();
  final addnewbidcontroller = Get.put(AddnewbidController());
  String? barcode;
  bool _isTorchOn = false;
  CameraFacing _cameraFacing = CameraFacing.back;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

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
          // Full-screen camera preview
          MobileScanner(
            controller: cameraController,
            onDetect: (barcodeCapture) {
              final barcode = barcodeCapture.barcodes.firstOrNull;
              if (barcode != null) {
                if (barcode.rawValue != this.barcode) {
                  setState(() {
                    this.barcode = barcode.rawValue;
                  });

                  if (barcode.rawValue!.contains("Chasis No")) {
                    addnewbidcontroller.selectedItemType.value = "Vehicles";

                    try {
                      // Check if the raw value is JSON
                      final jsonString = barcode.rawValue!.trim();

                      final chasisno = RegExp(r'Chasis No:\s*([\w/]+)')
                          .firstMatch(jsonString);

                      final vehiclename =
                          RegExp(r'Name:\s*([\w\s]+)').firstMatch(jsonString);

                      final extractedChasisNumber =
                          chasisno?.group(1) ?? "Unknown";

                      final extractedVehicleName =
                          vehiclename?.group(1) ?? "Unknown";
                      addnewbidcontroller.auctions.value.vehicles ??= [];
                      addnewbidcontroller.auctions.value.vehicles!.add(
                        Vehicle(
                          chassisNumber: extractedChasisNumber,
                          name: extractedVehicleName,
                          bidAmount: "",
                        ),
                      );

                      addnewbidcontroller.update();
                    } catch (e) {
                      print("JSON Parsing Error: $e");
                    }
                    addnewbidcontroller.update();

                    Get.back();
                  } else {
                    addnewbidcontroller.selectedItemType.value = "Spare Parts";

                    try {
                      // Check if the raw value is JSON
                      final jsonString = barcode.rawValue!.trim();

                      final id = RegExp(r'ID:\s*(\d+)').firstMatch(jsonString);
                      final name =
                          RegExp(r'Name:\s*([\w\s]+)').firstMatch(jsonString);

                      final extractedId = id?.group(1) ?? "Unknown";
                      final extractedName = name?.group(1) ?? "Unknown";
                      addnewbidcontroller.auctions.value.parts ??= [];
                      addnewbidcontroller.auctions.value.parts!.add(
                        Part(
                            id: extractedId,
                            name: extractedName,
                            bidAmount: ""),
                      );
                    } catch (e) {
                      print("JSON Parsing Error: $e");
                    }
                    addnewbidcontroller.update();
                    Get.back();
                  }
                }
              }
            },
          ),

          // Overlay for the scanning area
          _buildScanningOverlay(),

          // Display the scanned barcode at the bottom
          if (barcode != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(((0.9) * 255).toInt()),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Product Details: $barcode',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Build the scanning overlay
  Widget _buildScanningOverlay() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.5,
        child: Stack(
          children: [
            // Top-left corner
            Positioned(
              top: 0,
              left: 0,
              child: _buildCornerShape(),
            ),
            // Top-right corner
            Positioned(
              top: 0,
              right: 0,
              child: Transform.rotate(
                angle: 1.5708, // 90 degrees in radians
                child: _buildCornerShape(),
              ),
            ),
            // Bottom-left corner
            Positioned(
              bottom: 0,
              left: 0,
              child: Transform.rotate(
                angle: -1.5708, // -90 degrees in radians
                child: _buildCornerShape(),
              ),
            ),
            // Bottom-right corner
            Positioned(
              bottom: 0,
              right: 0,
              child: Transform.rotate(
                angle: 3.1416, // 180 degrees in radians
                child: _buildCornerShape(),
              ),
            ),

            // Moving scanner bar
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
