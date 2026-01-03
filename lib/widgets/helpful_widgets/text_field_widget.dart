import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged; // <-- اضف هذا

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onChanged, // <-- اضف هذا
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: validator,
      style: CustomTextStyles.textField,
      onChanged: onChanged, // <-- اربط ال callback هنا
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: CustomTextStyles.subtitle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
