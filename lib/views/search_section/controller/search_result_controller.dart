import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home_section/home_screen/model/doctor_model.dart';

class SearchResultController extends GetxController {
  final searchController = TextEditingController();
  final doctorsList = <DoctorModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    doctorsList.assignAll([
      DoctorModel(
        image: 'assets/images/doctor1.png',
        name: 'Dr. Randy Wigham',
        department: 'General',
        hospital: 'City Hospital',
        rating: 4.8,
        reviews: 120,
      ),
      DoctorModel(
        image: 'assets/images/doctor2.png',
        name: 'Dr. Jack Sulivan',
        department: 'General',
        hospital: 'Green Clinic',
        rating: 4.5,
        reviews: 90,
      ),
      DoctorModel(
        image: 'assets/images/doctor3.png',
        name: 'Dr. Hanna Stanton',
        department: 'Neurologic',
        hospital: 'Neuro Center',
        rating: 4.7,
        reviews: 75,
      ),
    ]);
  }

  void searchDoctors(String query) {
    final results = doctorsList.where((doctor) =>
        doctor.name.toLowerCase().contains(query.toLowerCase())
    ).toList();

    doctorsList.assignAll(results);
  }
}
