import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/models/login_model.dart';
import 'package:shop/modules/login/states.dart';
import 'package:shop/modules/register/states.dart';
import 'package:shop/sheard/sheard_network/remote/dio_helper.dart';

import '../../sheard/sheard_network/end_points.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>{

  ShopRegisterCubit() : super (ShopRegisterInitialState());

  static ShopRegisterCubit get(context)=> BlocProvider.of(context);

late  ShoploginModel loginModel;

  void userRegister({
  required String email,
  required String password,
  required String name,
  required String phone,
}){
    emit(ShopRegisterLodiningState());
    DioHelper.postData(
        url: REGISTER,
        data: {
          'email':email,
          'password':password,
          'name':name,
          'phone': phone
        }
    ).then((value) {
      print(value.data);
    loginModel =   ShoploginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(loginModel));
    }).catchError((erorr){

      emit(ShopRegisterErorrState(erorr.toString()));
    });
  }


   IconData sufix = Icons.visibility;
   bool isPassword = true;

   void changePasswordVisibilty()
   {
     isPassword= !isPassword;
     sufix =isPassword? Icons.visibility:Icons.visibility_off;
     emit(ShopRegisterChangePasswordVisibiltyState ());

   }

}