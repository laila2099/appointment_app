import 'package:flutter/material.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? border;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final Color? tfBackground;
  final bool? readOnly;
  final VoidCallback? onTap;
  final List<String>? autofillHints;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.tfBackground,
    this.readOnly = false,
    this.onTap,
    this.border,
    this.textStyle,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: validator,
      readOnly: readOnly ?? false,
      onTap: onTap,
      autofillHints: autofillHints,
      style: textStyle ??
          CustomTextStyles.custom(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.black,
          ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: CustomTextStyles.textField,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: tfBackground ?? const Color(0xffFDFDFF),
        contentPadding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: border ?? _border(),
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
