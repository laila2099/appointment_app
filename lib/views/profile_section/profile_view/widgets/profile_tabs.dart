import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:appoitment_app/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
<<<<<<< Updated upstream
              child: Container(
                alignment: Alignment.center,
                child:  Text(
                  'My Appointment',
                  style:CustomTextStyles.body14 ,
=======
              child: InkWell(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'my_appointment'.tr,
                    style: CustomTextStyles.body14,
                  ),
>>>>>>> Stashed changes
                ),
              ),
              
            ),
            VerticalDivider( indent: 6,endIndent: 6,),
            Expanded(
              child: InkWell(
                onTap: (){},
                child: Container(
                  child: Center(
                    child: Text(
                      'medical_records'.tr,
                      style: CustomTextStyles.body14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
