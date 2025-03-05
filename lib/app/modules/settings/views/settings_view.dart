import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('SettingsView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Obx(() => SwitchListTile(
                  title: Text('Enable Fingerprint Authentication'),
                  value: controller.isFingerprintEnabled.value,
                  onChanged: controller.toggleFingerprint,
                )),
          ],
        ));
  }
}
