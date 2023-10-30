import 'package:flutter_app/models/shop_app/shop_login_model.dart';

abstract class ShopLoginStates{}

class ShopLoginInitialState extends ShopLoginStates{}

class UserLoginLoadingState extends ShopLoginStates{}

class UserLoginSuccessState extends ShopLoginStates{
  final ShopLoginModel loginModel;

  UserLoginSuccessState(this.loginModel);
}

class UserLoginErrorState extends ShopLoginStates{
  final String error;

  UserLoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends ShopLoginStates{}
