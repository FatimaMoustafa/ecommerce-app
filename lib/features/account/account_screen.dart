import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/account/widgets/account_item_widget.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/service_locator.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account", style: AppStyles.primaryHeadLinesStyle,),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(),
          ),
          const HeightSpace(height: 20),
          AccountItemWidget(title: "My Orders", iconPath: AppAssets.box, onTap: (){}),
          const Divider(thickness: 8, color: Color(0xffE6E6E6),),
          AccountItemWidget(title: "My Details", iconPath: AppAssets.details, onTap: (){}),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(),
          ),
          AccountItemWidget(
              title: "Address Book",
              iconPath: AppAssets.address,
              onTap: (){
                context.pushNamed(AppRoutes.addressScreen);
              }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(),
          ),
          AccountItemWidget(title: "FAQs", iconPath: AppAssets.question, onTap: (){}),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(),
          ),
          AccountItemWidget(title: "Help Center", iconPath: AppAssets.headPhones, onTap: (){}),
          const HeightSpace(height: 16),
          const Divider(thickness: 8, color: Color(0xffE6E6E6),),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: InkWell(
              onTap: (){
                showLogoutDialog(context);
              },
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.red, size: 25.sp,),
                  const WidthSpace(width: 8),
                  Text(
                    "Logout",
                    style: AppStyles.black15w700Style.copyWith(color: Colors.red),
                  )
                ],
              ),
            ),
          ),
          const HeightSpace(height: 16),
        ],
      ),
    );
  }
  showLogoutDialog(BuildContext parentContext ){
    showDialog(
        context: parentContext,
        builder: (context){
          return Dialog(
            backgroundColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: SizedBox(
              height: 400.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.warning_amber_outlined, color: Colors.red, size: 50.sp,),
                    const HeightSpace(height: 20),
                    Text(
                      "Logout",
                      style: AppStyles.primaryHeadLinesStyle,
                    ),
                    const HeightSpace(height: 8),
                    Text(
                      "Are you sure You Want to Logout?",
                      style: AppStyles.grey14w600Style,
                    ),
                    const HeightSpace(height: 16),
                    PrimaryButtonWidget(
                      buttonColor: Colors.red,
                      buttonText: "Yes Logout",
                      onPress: (){
                        parentContext.read<AuthCubit>().logout();
                        parentContext.pushReplacementNamed(AppRoutes.loginScreen);
                      },
                    ),
                    const HeightSpace(height: 16),
                    PrimaryButtonWidget(
                      buttonColor: AppColors.greyColor,
                      buttonText: "No Cancel",
                      onPress: (){
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
