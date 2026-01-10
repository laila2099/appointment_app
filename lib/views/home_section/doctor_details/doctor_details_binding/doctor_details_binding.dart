import 'package:get/get.dart';

import '../../../../core/classes/repositories/doctor_repository.dart';
import '../../../../core/classes/repositories/review_repository.dart';
import '../doctor_details_controller/doctor_details_controller.dart';

class DoctorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorDetailsController>(
      () => DoctorDetailsController(
        doctorRepository: Get.find<DoctorRepository>(),
        reviewRepository: Get.find<ReviewRepository>(),
      ),
    );
  }
}
