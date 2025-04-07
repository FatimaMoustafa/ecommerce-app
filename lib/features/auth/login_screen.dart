import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:ecommerce_app/core/utils/animated_snack_dialog.dart';
import 'package:ecommerce_app/core/utils/storage_helper.dart';
import 'package:ecommerce_app/core/widgets/loading_widget.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/app_routes.dart';
import '../../core/styling/app_colors.dart';
import '../../core/styling/app_styles.dart';
import '../../core/utils/service_locator.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/spacing_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();

    sl<StorageHelper>().getToken().then((value){
      if(value != null && value.isNotEmpty){
        context.pushReplacementNamed(AppRoutes.mainScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state){
            if(state is ErrorAuthState){
              showAnimatedSnackDialog(
                  context,
                  message: state.message,
                  type: AnimatedSnackBarType.error
              );
            }
            if(state is SuccessAuthState){
              showAnimatedSnackDialog(
                  context,
                  message: state.message,
                  type: AnimatedSnackBarType.success
              );
              context.pushReplacementNamed(AppRoutes.mainScreen);
            }
          },
          builder: (context, state){
            if(state is LoadingAuthState) {
              return const LoadingWidget();
            }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpace(height: 28,),
                  SizedBox(
                    width: 335.w,
                    child: Text(
                      "Login to your account",
                      style: AppStyles.primaryHeadLinesStyle,
                    ),
                  ),
                  const HeightSpace(height: 8,),
                  SizedBox(
                    width: 264.w,
                    child: Text(
                      "It’s great to see you again.",
                      style: AppStyles.subtitlesStyle,
                    ),
                  ),
                  const HeightSpace(height: 24,),
                  Text("User Name", style: AppStyles.black16w500Style,),
                  const HeightSpace(height: 8,),
                  CustomTextField(
                    controller: userNameController,
                    hintText: "Enter Your User Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your User Name";
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(height: 16,),
                  Text("Password", style: AppStyles.black16w500Style,),
                  const HeightSpace(height: 8,),
                  CustomTextField(
                    hintText: "Enter Your Password",
                    controller: passwordController,
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: AppColors.secondaryColor,
                      size: 20.sp,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(height: 55,),
                  PrimaryButtonWidget(
                    buttonText: "Sign In",
                    onPress: (){
                      if(formKey.currentState!.validate()){
                        context.read<AuthCubit>().login(
                            username: userNameController.text,
                            password: passwordController.text
                        );
                      }
                    },
                  ),
                  const Spacer(),
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        context.pushNamed(AppRoutes.registerScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: AppStyles.black15w700Style
                              .copyWith(color: AppColors.secondaryColor),
                          children: [
                            TextSpan(
                                text: "Join",
                                style: AppStyles.black16w500Style)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const HeightSpace(height: 16,),
                ],
              ),
            ),
          );
        },
        ),
      ),
    );
  }
}