import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/text_style.dart';

class PhoneFieldWidget extends StatelessWidget {
  final String hint;
  final String initialCountryCode;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const PhoneFieldWidget({
    super.key,
    this.hint = 'Phone Number',
    this.initialCountryCode = 'US',
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: initialCountryCode,
      disableLengthCheck: true,
      dropdownIconPosition: IconPosition.trailing,
      style: CustomTextStyles.textField,
      validator: (phone) {
        if (phone == null || phone.number.isEmpty) {
          return 'phone_number_required'.tr;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: CustomTextStyles.subtitle,
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(color: AppColors.primary),
        errorBorder: _border(color: Colors.red),
        focusedErrorBorder: _border(color: Colors.red),
      ),
      onChanged: (phone) {
        if (onChanged != null) {
          onChanged!(phone.completeNumber);
        }
      },
    );
  }

  OutlineInputBorder _border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: color ?? Colors.grey.shade300,
        width: 1,
      ),
    );
  }
}
