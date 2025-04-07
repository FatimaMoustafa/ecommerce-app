import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/cart/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CartItemWidget extends StatelessWidget {
  final Product product;
  const CartItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 83.w,
              height: 79.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.grey
              ),
            ),
            const WidthSpace(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Product Item ${product.productId}", style: AppStyles.black15w700Style,),
                      const Spacer(),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                    ],
                  ),
                  const HeightSpace(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r"$ 1,190", style: AppStyles.black16w500Style,),
                      const Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 0.5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(Icons.add, size: 16.sp,),
                            ),
                          ),
                          const WidthSpace(width: 8),
                          Text("1", style: AppStyles.black15w700Style,),
                          const WidthSpace(width: 8),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 0.5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(Icons.minimize, size: 16.sp,),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
