import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/text_style.dart';

class PhoneFieldWidget extends StatelessWidget {
  final Country country;
  final VoidCallback onTapCountry;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String hint;

  const PhoneFieldWidget({
    super.key,
    required this.country,
    required this.onTapCountry,
    required this.controller,
    this.validator,
    this.onChanged,
    this.hint = 'Your number',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      style: CustomTextStyles.textField.copyWith(color: Colors.black),
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:
        CustomTextStyles.subtitle.copyWith(color: Colors.grey.shade400),
        filled: true,
        fillColor: const Color(0xfffdfdff),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

        prefixIcon: GestureDetector(
          onTap: onTapCountry,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 12),
              Text(
                country.flagEmoji,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: Colors.grey,
              ),
              const SizedBox(width: 8),
              Container(
                height: 24,
                width: 1,
                color: Colors.grey.shade300,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),

        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(color: AppColors.primary),
      ),
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
