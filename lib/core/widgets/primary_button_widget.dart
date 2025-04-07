import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styling/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? borderRaduis;
  final Color? textColor;
  final double? fontSize;
  final Widget? icon;
  final void Function()? onPress;
  final Widget? trailingIcon;
  final bool isLoading;
  
  const PrimaryButtonWidget({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.width,
    this.height,
    this.borderRaduis,
    this.textColor,
    this.fontSize,
    this.onPress,
    this.icon,
    this.trailingIcon,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRaduis?? 8.r),
          ),
          fixedSize: Size(width ?? 331.w, height ?? 56.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? icon! : const SizedBox.shrink(),
            icon != null ? const WidthSpace(width: 8) : const SizedBox.shrink(),
            isLoading ? SizedBox(
              width: 30.sp,
              height: 30.sp,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              )
            ) :
            Text(
              buttonText ?? "",
              style: TextStyle(
                  color: textColor ?? AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize ?? 15.sp
              ),
            ),
            trailingIcon != null ? const WidthSpace(width: 8) : const SizedBox.shrink(),
            trailingIcon != null ? trailingIcon! : const SizedBox.shrink(),
          ],
        )
    );
  }
}
