abstract class ShopRegisterStates{}

class ShopRegisterInitialState extends ShopRegisterStates{}

class ShopRegisterLoadingState extends ShopRegisterStates{}

class ShopRegisterSuccessState extends ShopRegisterStates{}

class ShopRegisterErrorState extends ShopRegisterStates{
  final String error;

  ShopRegisterErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends ShopRegisterStates{}
