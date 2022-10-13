import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/models/login_model.dart';
import 'package:shop/modules/login/states.dart';
import 'package:shop/sheard/sheard_network/remote/dio_helper.dart';

import '../../sheard/sheard_network/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{

  ShopLoginCubit() : super (ShopLoginInitialState());

  static ShopLoginCubit get(context)=> BlocProvider.of(context);

late  ShoploginModel loginModel;

  void user({
  required String email,
  required String password,
}){
    emit(ShopLoginLodiningState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email':email,
          'password':password,
        }
    ).then((value) {
      print(value.data);
    loginModel =   ShoploginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((erorr){

      emit(ShopLoginErorrState(erorr.toString()));
    });
  }


  // IconData sufix = Icons.visibility;
  // bool isPassword = true;
  //
  // void changePasswordVisibilty()
  // {
  //   isPassword= !isPassword;
  //   sufix =isPassword? Icons.visibility:Icons.visibility_off;
  //   emit(ShopChangePasswordVisibiltyState ());
  //
  // }

}