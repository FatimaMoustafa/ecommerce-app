import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/styling/app_colors.dart';
import '../../core/styling/app_styles.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/spacing_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController userNameController;
  late TextEditingController password;
  late TextEditingController confirmPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    password = TextEditingController();
    fullNameController = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpace(height: 28,),
                SizedBox(
                  width: 266.w,
                  child: Text(
                    "Create an account",
                    style: AppStyles.primaryHeadLinesStyle,
                  ),
                ),
                const HeightSpace(height: 4),
                SizedBox(
                  width: 264.w,
                  child: Text(
                    "Let's create your account.",
                    style: AppStyles.subtitlesStyle,
                  ),
                ),
                const HeightSpace(height: 24),
                Text("Full Name", style: AppStyles.black16w500Style,),
                const HeightSpace(height: 8),
                CustomTextField(
                  controller: fullNameController,
                  hintText: "Enter Your Full Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Full Name";
                    }
                    return null;
                  },
                ),
                const HeightSpace(height: 16),
                Text("User Name", style: AppStyles.black16w500Style,),
                const HeightSpace(height: 8),
                CustomTextField(
                  controller: userNameController,
                  hintText: "Enter Your email address",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your email address";
                    }
                    return null;
                  },
                ),
                const HeightSpace(height: 16),
                Text("Password", style: AppStyles.black16w500Style,),
                const HeightSpace(height: 8),
                CustomTextField(
                  hintText: "Enter Your Password",
                  controller: password,
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: AppColors.secondaryColor,
                    size: 20.sp,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                const HeightSpace(height: 26),
                Text("Confirm Password", style: AppStyles.black16w500Style,),
                const HeightSpace(height: 8),
                CustomTextField(
                  hintText: "Enter Your Password",
                  controller: confirmPassword,
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: AppColors.secondaryColor,
                    size: 20.sp,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                const HeightSpace(height: 40),
                PrimaryButtonWidget(
                  buttonText: "Create Account",
                  onPress: () {
                    //    if (formKey.currentState!.validate()) {
                    context.pop();
                    //  }
                  },
                ),
                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      context.pop();
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: AppStyles.black15w700Style
                            .copyWith(color: AppColors.secondaryColor),
                        children: [
                          TextSpan(
                              text: "Log In",
                              style: AppStyles.black16w500Style)
                        ],
                      ),
                    ),
                  ),
                ),
                const HeightSpace(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
