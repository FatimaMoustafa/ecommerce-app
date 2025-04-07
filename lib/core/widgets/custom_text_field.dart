import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styling/app_colors.dart';
import '../styling/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool? isPassword;
  final Widget? suffixIcon;
  final Color? fieldColor;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final String? Function(String?)? validator;


  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.fieldColor,
    this.width,
    this.height,
    this.isPassword,
    this.controller,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      height: height ?? 56.h,
      child: TextFormField(
        controller: controller,
        validator: validator,
        autofocus: false,
        obscureText: isPassword ?? false,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: AppStyles.secondary15w15Style,
          contentPadding: EdgeInsets.all(18.sp),
          filled: true,
          fillColor: AppColors.whiteColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: Color(0xffE6E6E6),
              width: 1
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
                color: Colors.red,
                width: 1
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
                color: Colors.red,
                width: 1
            ),
          ),
          suffixIcon: suffixIcon
        ),
      ),
    );
  }
}
