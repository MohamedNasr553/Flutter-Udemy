import 'package:flutter/material.dart';
import 'package:flutter_app/models/shop_app/shop_login_model.dart';
import 'package:flutter_app/modules/shop_app/login/cubit/states.dart';
import 'package:flutter_app/shared/network/endpoints.dart';
import 'package:flutter_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
}){
    emit(UserLoginLoadingState());

    DioHelper.postData(
        url: LOGIN,
        data:
        {
          'email' : email,
          'password' : password,
        },
    ).then((value){
      print(value.data);

      loginModel = ShopLoginModel.fromJson(value.data);
      print(loginModel!.status);
      print(loginModel!.message);
      print(loginModel!.data!.name);

      emit(UserLoginSuccessState(loginModel!));
    }).catchError((error){
      emit(UserLoginErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility;

  void changeVisibility(){
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }
}