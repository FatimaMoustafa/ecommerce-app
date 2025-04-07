import 'package:ecommerce_app/features/account/account_screen.dart';
import 'package:ecommerce_app/features/address/address_screen.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/register_screen.dart';
import 'package:ecommerce_app/features/cart/cart_screen.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/home_screen/models/products_model.dart';
import 'package:ecommerce_app/features/main_screen/main_screen.dart';
import 'package:ecommerce_app/features/product_screen/product_screen.dart';
import 'package:ecommerce_app/features/splash_screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import '../../features/auth/login_screen.dart';
import '../utils/service_locator.dart';
import 'app_routes.dart';

class RouterGenerationConfig{
  static GoRouter goRouter = GoRouter(
      initialLocation: AppRoutes.splashScreen, routes: [
    GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen()
    ),
    GoRoute(
            path: AppRoutes.loginScreen,
            name: AppRoutes.loginScreen,
            builder: (context, state) => BlocProvider(
              create: (context) => sl<AuthCubit>(),
                child: LoginScreen()
            )
        ),
        GoRoute(
            path: AppRoutes.registerScreen,
            name: AppRoutes.registerScreen,
            builder: (context, state) => const RegisterScreen()
        ),
        GoRoute(
            path: AppRoutes.mainScreen,
            name: AppRoutes.mainScreen,
            builder: (context, state) => BlocProvider(
                create: (context) => sl<CartCubit>(),
                child: const MainScreen(),
            )
        ),
        GoRoute(
            path: AppRoutes.productScreen,
            name: AppRoutes.productScreen,
            builder: (context, state) {
              ProductsModel product = state.extra as ProductsModel;
              return BlocProvider(
                  create: (context) => sl<CartCubit>(),
                  child: ProductScreen(product: product,)
              );
            }
        ),
        GoRoute(
        path: AppRoutes.cartScreen,
        name: AppRoutes.cartScreen,
        builder: (context, state) => CartScreen()
    ),
        GoRoute(
          path: AppRoutes.accountScreen,
          name: AppRoutes.accountScreen,
          builder: (context, state) => AccountScreen()
        ),
        GoRoute(
            path: AppRoutes.addressScreen,
            name: AppRoutes.addressScreen,
            builder: (context, state) => AddressScreen(),
          // pageBuilder: GoTransitions.slide.toRight.withFade,
        ),

  ]
  );
}