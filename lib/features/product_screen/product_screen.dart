import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/utils/animated_snack_dialog.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_state.dart';
import 'package:ecommerce_app/features/home_screen/models/products_model.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatelessWidget {
  final ProductsModel product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Stack(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpace(height: 20),
                  Container(
                    width: 341.w,
                    height: 368.h,
                    child: Hero(
                      tag: "product${product.title}",
                      child: CachedNetworkImage(imageUrl: product.image ?? "")
                    ),
                  ),
                  const HeightSpace(height: 12),
                  Text(
                    product.title ?? "",
                    style: AppStyles.black16w500Style
                        .copyWith(fontSize: 24.sp),
                  ),
                  HeightSpace(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffFFA928), size: 18.sp ,),
                      const WidthSpace(width: 2),
                      product.rating != null ?
                      Text("${product.rating?.rate}/5", style: AppStyles.black16w500Style.copyWith(decoration: TextDecoration.underline),)
                      : const SizedBox.shrink(),
                      const WidthSpace(width: 2),
                      product.rating != null ?
                      Text("(${product.rating!.count} reviews)", style: AppStyles.subtitlesStyle,)
                      : const SizedBox.shrink(),
                    ],
                  ),
                  const HeightSpace(height: 10),
                  Text(
                    product.description ?? "",
                    style: AppStyles.subtitlesStyle,
                  ),
                  const HeightSpace(height: 200),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              color: AppColors.whiteColor,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Divider(),
                  const HeightSpace(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price", style: AppStyles.subtitlesStyle,),
                          HeightSpace(height: 4),
                          Text("${product.price} \$", style: AppStyles.black16w500Style.copyWith(fontSize: 24),)
                        ],
                      ),
                      const WidthSpace(width: 22),
                      BlocConsumer<CartCubit, CartState>(
                        listener: (context, state) {
                          if(state is SuccessAddingToCart){
                            showAnimatedSnackDialog(
                                context,
                                message:
                                 "Product Added Successfully To Our Cart.",
                              type: AnimatedSnackBarType.success
                            );
                          }
                        },
                        builder: (context, state) {
                          if(state is AddingToCart){
                            return PrimaryButtonWidget(
                              width: MediaQuery.of(context).size.width * 0.6,
                              isLoading: true,
                              buttonText: "Add To Cart",
                              onPress: (){},
                            );
                          }
                          return PrimaryButtonWidget(
                            onPress: (){
                              context.read<CartCubit>().addingToCart(product: product, quantity: 1);
                            },
                            width: MediaQuery.of(context).size.width * 0.6,
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                            buttonText: "Add To Cart",
                            // width: 240,
                          );
                        }
                      )
                    ],
                  ),
                  const HeightSpace(height: 8),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
