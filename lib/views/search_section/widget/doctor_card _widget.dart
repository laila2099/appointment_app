import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import '../../../../core/constant/app_colors.dart';
import '../../home_section/home_screen/model/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(doctor.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: AppColors.primary),
            SizedBox(width: 4),
            Text(doctor.rating.toString()),
          ],
        ),
      ),
    );
  }
}
