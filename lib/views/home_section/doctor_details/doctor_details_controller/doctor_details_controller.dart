import 'package:get/get.dart';

import '../../../../models/doctor_model.dart';
import '../../../../models/review_model.dart';
import '../../../../routes/app_routes.dart';

class DoctorDetailsController extends GetxController {
  final isLoading = true.obs;

  final doctor = Rxn<Doctor>();
  final reviews = <Review>[].obs;

  final dummyDoctor = Doctor(
    id: "1",
    name: "Dr Randy Wigham",
    specialty: "General",
    clinic: "RSUD Gatot Subroto",
    ratingAvg: 4.8,
    ratingCount: 4279,
    avatarUrl: null,
    about:
        "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. "
        "She achieved several awards for her wonderful contribution in medical field. "
        "She is available for private consultation.",
    workingTime: "Monday - Friday, 08.00 AM - 20.00 PM",
    strNumber: "4726482464",
    experiencePlace: "RSPAD Gatot Soebroto",
    experiencePeriod: "2017 - sekarang",
    locationText: "Cairo, Egypt",
    lat: 30.0444,
    lng: 31.2357,
  );

  final dummyReviews = <Review>[
    Review(
      id: "r1",
      doctorId: "1",
      userName: "Jane Cooper",
      stars: 5,
      comment:
          "As someone who lives in a remote area with limited access to healthcare, this app has been a game changer for me.",
      dateLabel: "Today",
    ),
    Review(
      id: "r2",
      doctorId: "1",
      userName: "Robert Fox",
      stars: 5,
      comment:
          "I was initially skeptical but this app has exceeded my expectations. The doctors are highly qualified.",
      dateLabel: "Today",
    ),
    Review(
      id: "r3",
      doctorId: "1",
      userName: "Jacob Jones",
      stars: 5,
      comment: "Great experience and very professional doctor.",
      dateLabel: "Today",
    ),
  ];

  @override
  void onInit() {
    super.onInit();

    _load();
  }

  void _load() {
    doctor.value = dummyDoctor;
    reviews.assignAll(dummyReviews);
    isLoading.value = false;
  }

  void onMakeAppointment() {
    Get.toNamed(AppRoutes.bookingAppointment);
  }
}
