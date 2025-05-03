// import 'package:auction_app/app/res/colors.dart';

import 'package:auction_app/app/data/postModels/add_new_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/addcontainer_controller.dart';

class AddItemsToContainerScanner extends StatefulWidget {
  const AddItemsToContainerScanner({super.key});

  @override
  _AddItemsToContainerScannerState createState() =>
      _AddItemsToContainerScannerState();
}

class _AddItemsToContainerScannerState extends State<AddItemsToContainerScanner>
    with SingleTickerProviderStateMixin {
  final MobileScannerController cameraController = MobileScannerController();
  final addnewContainerController = Get.put(AddcontainerController());
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

                  if (barcode.rawValue!.contains("chassis_number")) {
                    addnewContainerController.selectedItemType.value =
                        "Vehicles";

                    try {
                      final rawString = barcode.rawValue!.trim();

                      final makeMatch =
                          RegExp(r'make:\s*([^,]+)', caseSensitive: false)
                              .firstMatch(rawString);
                      final modelMatch =
                          RegExp(r'model:\s*([^,]+)', caseSensitive: false)
                              .firstMatch(rawString);
                      final yearMatch =
                          RegExp(r'year:\s*(\d{4})', caseSensitive: false)
                              .firstMatch(rawString);
                      final chassisMatch = RegExp(
                              r'chassis_number:\s*([^\s,]+)',
                              caseSensitive: false)
                          .firstMatch(rawString);
                      final colorMatch =
                          RegExp(r'color:\s*([^,]+)', caseSensitive: false)
                              .firstMatch(rawString);

                      final extractedMake =
                          makeMatch?.group(1)?.trim() ?? "Unknown";
                      final extractedModel =
                          modelMatch?.group(1)?.trim() ?? "Unknown";
                      final extractedYear =
                          int.tryParse(yearMatch?.group(1) ?? '0') ?? 0;
                      final extractedChassis =
                          chassisMatch?.group(1)?.trim() ?? "Unknown";
                      final extractedColor =
                          colorMatch?.group(1)?.trim() ?? "Unknown";

                      addnewContainerController
                          .itemsInContainer.value.vehicles ??= [];

                      addnewContainerController.itemsInContainer.value.vehicles!
                          .add(
                        Vehicle(
                          make: extractedMake,
                          model: extractedModel,
                          year: extractedYear.toString(),
                          chassisNumber: extractedChassis,
                          color: extractedColor,
                        ),
                      );

                      addnewContainerController.update();
                      Get.back();
                    } catch (e) {
                      print("Parsing Error: $e");
                    }
                  } else {
                    addnewContainerController.selectedItemType.value =
                        "Spare Parts";
                    try {
                      final rawString = barcode.rawValue!.trim();

                      final idMatch =
                          RegExp(r'id:\s*(\d+)', caseSensitive: false)
                              .firstMatch(rawString);
                      final nameMatch =
                          RegExp(r'name:\s*([^,]+)', caseSensitive: false)
                              .firstMatch(rawString);
                      final makeMatch =
                          RegExp(r'make:\s*([^,]+)', caseSensitive: false)
                              .firstMatch(rawString);
                      final modelMatch =
                          RegExp(r'model:\s*([^,]+)', caseSensitive: false)
                              .firstMatch(rawString);
                      final extractedId =
                          idMatch?.group(1)?.trim() ?? "Unknown";
                      final extractedName =
                          nameMatch?.group(1)?.trim() ?? "Unknown";
                      final extractedMake =
                          makeMatch?.group(1)?.trim() ?? "Unknown";
                      final extractedModel =
                          modelMatch?.group(1)?.trim() ?? "Unknown";

                      addnewContainerController.itemsInContainer.value.parts ??=
                          [];

                      addnewContainerController.itemsInContainer.value.parts!
                          .add(
                        Part(
                          id: extractedId,
                          name: extractedName,
                          make: extractedMake,
                          model: extractedModel,
                        ),
                      );
                    } catch (e) {
                      print("Parsing Error: $e");
                    }

                    addnewContainerController.update();
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
