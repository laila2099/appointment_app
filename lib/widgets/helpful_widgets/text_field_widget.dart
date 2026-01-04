// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // <-- لازم تضيفها

// import '../../core/constant/app_colors.dart';
// import '../../core/constant/text_style.dart';

// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final TextEditingController? controller;
//   final TextInputType keyboardType;
//   final bool isPassword;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final String? prefixIconPath; // <-- مسار أيقونة SVG
//   final String? suffixIconPath; // <-- مسار أيقونة SVG
//   final String? Function(String?)? validator;
//   final ValueChanged<String>? onChanged;
//   final TextStyle? style; // ← خاصية style اختيارية
//   final ValueChanged<String>? onFieldSubmitted; // ← أضفنا onFieldSubmitted

//   const CustomTextField({
//     super.key,
//     required this.hint,
//     this.controller,
//     this.keyboardType = TextInputType.text,
//     this.isPassword = false,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.prefixIconPath,
//     this.suffixIconPath,
//     this.validator,
//     this.onChanged,
//     this.style,
//     this.onFieldSubmitted,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: isPassword,
//       validator: validator,
//       style:
//           style ?? CustomTextStyles.textField.copyWith(color: AppColors.black),
//       onChanged: onChanged,
//       onFieldSubmitted: onFieldSubmitted,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: CustomTextStyles.subtitle,
//         prefixIcon: prefixIcon ??
//             (prefixIconPath != null
//                 ? Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: SvgPicture.asset(
//                       prefixIconPath!,
//                       width: 20,
//                       height: 20,
//                       color: AppColors.textField,
//                     ),
//                   )
//                 : null),
//         suffixIcon: suffixIcon ??
//             (suffixIconPath != null
//                 ? Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: SvgPicture.asset(
//                       suffixIconPath!,
//                       width: 20,
//                       height: 20,
//                       color: AppColors.textField,
//                     ),
//                   )
//                 : null),
//         filled: true,
//         fillColor: AppColors.light2Grey,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 18,
//         ),
//         border: _border(),
//         enabledBorder: _border(),
//         focusedBorder: _border(color: AppColors.primary),
//         errorBorder: _border(color: Colors.red),
//         focusedErrorBorder: _border(color: Colors.red),
//       ),
//     );
//   }

//   OutlineInputBorder _border({Color? color}) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(30),
//       borderSide: BorderSide(
//         color: color ?? Colors.grey.shade300,
//         width: 1,
//       ),
//     );
//   }
// }
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
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: validator,
      style: CustomTextStyles.textField,
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
