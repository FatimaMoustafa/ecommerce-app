import 'package:ecommerce_app/features/cart/models/cart_model.dart';

abstract class CartState{}

class InitialCart extends CartState{}

class LoadingCarts extends CartState{}

class SuccessGettingCarts extends CartState {
  final CartModel cart;
  SuccessGettingCarts(this.cart);
}

class ErrorGettingCarts extends CartState{
  final String message;
  ErrorGettingCarts(this.message);
}

class AddingToCart extends CartState{}

class SuccessAddingToCart extends CartState {
  final CartModel cart;
  SuccessAddingToCart(this.cart);
}

class ErrorAddingToCart extends CartState{
  final String message;
  ErrorAddingToCart(this.message);
}