import 'package:appointment_app/core/constant/app_icons.dart';

import '../model/category_model.dart';

class CategoryController {
  final List<CategoryModel> categories = [
    CategoryModel(icon: AppIcons.general, title: "General"),
    CategoryModel(icon: AppIcons.neurologic, title: "Neurologic"),
    CategoryModel(icon: AppIcons.pediatric, title: "Pediatric"),
    CategoryModel(icon: AppIcons.urologist, title: "Radiology"),
    CategoryModel(icon: AppIcons.ent, title: "ENT"),
    CategoryModel(icon: AppIcons.dentistry, title: "Dentistry"),
    CategoryModel(icon: AppIcons.intestine, title: "intestine"),
    CategoryModel(icon: AppIcons.histologist, title: "Histologist"),
    CategoryModel(icon: AppIcons.hepatology, title: "Hepatology"),
    CategoryModel(icon: AppIcons.cardiologist, title: "Cardiologist"),
    CategoryModel(icon: AppIcons.pulmonary, title: "Pulmonary"),
    CategoryModel(icon: AppIcons.optometry, title: "Optometry"),
  ];
}
