import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget switchTile({
  required String title,
  required RxBool value,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Obx(
          () => Switch(
            value: value.value,
            onChanged: (val) => value.value = val,
            activeThumbColor: AppColors.white,
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: Colors.grey.shade300,
          ),
        ),
      ],
    ),
  );
}
