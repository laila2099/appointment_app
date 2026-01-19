import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/image_picker_service.dart';

class PickImageSheet {
  static Future<PickImageSource?> show() async {
    return Get.bottomSheet<PickImageSource>(
      SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Gallery'),
                onTap: () => Get.back(result: PickImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera_outlined),
                title: const Text('Camera'),
                onTap: () => Get.back(result: PickImageSource.camera),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: false,
    );
  }
}
