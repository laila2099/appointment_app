import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SortModel {
  final String title;
  final IconData? icon;

  SortModel({required this.title, this.icon});
}

class SortController extends GetxController {
  int specialityIndex = 0;
  int ratingIndex = 0;

  List<SortModel> specialityList = [
    SortModel(title: "All"),
    SortModel(title: "General"),
    SortModel(title: "Neurologic"),
    SortModel(title: "Pediatric"),
    SortModel(title: "Radiology"),
    SortModel(title: "ENT"),
    SortModel(title: "Dentistry"),
    SortModel(title: "intestine"),
    SortModel(title: "Histologist"),
    SortModel(title: "Hepatology"),
    SortModel(title: "Cardiologist"),
    SortModel(title: "Pulmonary"),
    SortModel(title: "Optometry"),
  ];

  List<SortModel> ratingList = [
    SortModel(title: "All", icon: Icons.star),
    SortModel(title: "5", icon: Icons.star),
    SortModel(title: "4", icon: Icons.star),
    SortModel(title: "3", icon: Icons.star),
    SortModel(title: "2", icon: Icons.star),
    SortModel(title: "1", icon: Icons.star),
  ];

  void selectSpeciality(int index) {
    specialityIndex = index;
    update();
  }

  void selectRating(int index) {
    ratingIndex = index;
    update();
  }
}
