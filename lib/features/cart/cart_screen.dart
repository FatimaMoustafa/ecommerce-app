import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/widgets/loading_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_state.dart';
import 'package:ecommerce_app/features/cart/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/primary_button_widget.dart';
import '../home_screen/widgets/title_price_widget.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        leading: Container(),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if(state is LoadingCarts){
            return LoadingWidget(
              height: MediaQuery.of(context).size.height * 0.7,
            );
          }
          if(state is SuccessGettingCarts) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpace(height: 20),
                    ...state.cart.products!.map((product){
                      return CartItemWidget(product: product);
                    }).toList(),
                    const HeightSpace(height: 145),
                    TitlePriceWidget(title: 'Sub-total', price: r'$ 5,870',),
                    TitlePriceWidget(title: 'VAT (%)', price: r'$ 0,00',),
                    TitlePriceWidget(title: 'Shipping fee', price: r'$ 80',),
                    const HeightSpace(height: 20),
                    const Divider(),
                    const HeightSpace(height: 20),
                    TotalPriceWidget(title: "Total", price: r"$ 1,190"),
                    const HeightSpace(height: 20),
                    PrimaryButtonWidget(
                      onPress: () {},
                      trailingIcon: Icon(
                        Icons.payment,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                      buttonText: "Go To Checkout",
                      // width: 240,
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        }
      ),
    );
  }
}
