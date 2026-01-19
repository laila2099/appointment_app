// import 'dart:io';

// import 'package:image_picker/image_picker.dart';

// enum PickImageSource { camera, gallery }

// class ImagePickerService {
//   ImagePickerService({ImagePicker? picker}) : _picker = picker ?? ImagePicker();
//   final ImagePicker _picker;

//   Future<XFile?> pickImage({
//     required PickImageSource source,
//     int imageQuality = 85,
//     double? maxWidth,
//     double? maxHeight,
//     CameraDevice preferredCameraDevice = CameraDevice.front,
//   }) async {
//     final ImageSource realSource = source == PickImageSource.camera
//         ? ImageSource.camera
//         : ImageSource.gallery;

//     return _picker.pickImage(
//       source: realSource,
//       imageQuality: imageQuality,
//       maxWidth: maxWidth,
//       maxHeight: maxHeight,
//       preferredCameraDevice: preferredCameraDevice,
//     );
//   }

//   Future<File?> pickImageFile({
//     required PickImageSource source,
//     int imageQuality = 85,
//     double? maxWidth,
//     double? maxHeight,
//     CameraDevice preferredCameraDevice = CameraDevice.front,
//   }) async {
//     final xfile = await pickImage(
//       source: source,
//       imageQuality: imageQuality,
//       maxWidth: maxWidth,
//       maxHeight: maxHeight,
//       preferredCameraDevice: preferredCameraDevice,
//     );
//     if (xfile == null) return null;
//     return File(xfile.path);
//   }
// }
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

enum PickImageSource { camera, gallery }

class ImagePickerService {
  ImagePickerService({ImagePicker? picker}) : _picker = picker ?? ImagePicker();
  final ImagePicker _picker;

  Future<File?> pickImageFile({
    required PickImageSource source,
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
    CameraDevice preferredCameraDevice = CameraDevice.front,
  }) async {
    final realSource = source == PickImageSource.camera
        ? ImageSource.camera
        : ImageSource.gallery;

    final xfile = await _picker.pickImage(
      source: realSource,
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      preferredCameraDevice: preferredCameraDevice,
    );

    if (xfile == null) return null;

    // 📂 مجلد دائم للتطبيق
    final dir = await getApplicationDocumentsDirectory();

    final fileName =
        'avatar_${DateTime.now().millisecondsSinceEpoch}${path.extension(xfile.path)}';

    final savedFile = await File(xfile.path).copy('${dir.path}/$fileName');

    return savedFile;
  }
}
