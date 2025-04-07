import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/core/widgets/loading_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/home_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home_screen/cubit/categories_state.dart';
import 'package:ecommerce_app/features/home_screen/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/home_screen/cubit/product_state.dart';
import 'package:ecommerce_app/features/home_screen/models/products_model.dart';
import 'package:ecommerce_app/features/home_screen/widgets/category_item_widget.dart';
import 'package:ecommerce_app/features/home_screen/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String selectedCategory = "All";
  @override
  void initState(){
    context.read<ProductCubit>().fetchProducts();
    context.read<CategoriesCubit>().fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpace(height: 28),
          SizedBox(
            width: 128.w,
            child: Text(
              "Discover",
              style: AppStyles.primaryHeadLinesStyle,
            ),
          ),
          const HeightSpace(height: 16),
          Row(
            children: [
              CustomTextField(
                width: 270.w,
                hintText: "Search for clothes...",
              ),
              const WidthSpace(width: 8),
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const HeightSpace(height: 16),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context,state) {
              if(state is CategoriesLoaded){
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.categories.map((category){
                      return CategoryItemWidget(
                        categoryName: category,
                        isSelected: selectedCategory == category ? true : false,
                        onPress: (){
                          setState(() {
                            selectedCategory = category;
                            if(selectedCategory == "All"){
                              context.read<ProductCubit>().fetchProducts();
                            }else{
                              context.read<ProductCubit>().fetchProductCategories(category);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
          const HeightSpace(height: 16),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context,state) {
              if(state is ProductLoading){
                return LoadingWidget(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                );
              }
              if(state is ProductLoaded){
                List<ProductsModel> products = state.products;
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    backgroundColor: AppColors.whiteColor,
                    onRefresh: () async{
                      selectedCategory = "All";
                      setState(() {

                      });
                      context.read<ProductCubit>().fetchProducts();
                    },
                    child: AnimationLimiter(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.sp,
                          crossAxisSpacing: 16.sp,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index){
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 600),
                            child: SlideAnimation(
                              verticalOffset: 80.0,
                              child: FadeInAnimation(
                                child: ProductItemWidget(
                                  image: products[index].image ?? "",
                                  title: products[index].title ?? "",
                                  price: products[index].price.toString(),
                                  onTap: (){
                                    GoRouter.of(context)
                                        .pushNamed(AppRoutes.productScreen, extra: products[index]);
                                  },
                                ),
                              ),
                            ),
                          );                        },
                      ),
                    ),
                  ),
                );
              }
              return Text("there is an error in fetching products");
            },
          )
        ],
      ),
    );
  }
}
