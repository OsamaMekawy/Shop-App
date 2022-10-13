

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/layout_states.dart';
import 'package:shop/models/categories_model.dart';
import 'package:shop/models/home_model.dart';
import 'package:shop/modules/categories/categories_screen.dart';
import 'package:shop/modules/favorities/favorities_screen.dart';
import 'package:shop/modules/login/shop_login.dart';
import 'package:shop/modules/products/product_screen.dart';
import 'package:shop/modules/settings/settings_screen.dart';
import 'package:shop/sheard/sheard_network/end_points.dart';
import 'package:shop/sheard/sheard_network/remote/dio_helper.dart';

import '../models/change_favourites_model.dart';
import '../models/login_model.dart';
import '../sheard/sheard_componunts/constanse.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super (ShopInicialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen = [
    ProductScreen(),
    CategoriesScreen(),
    FavoritiesScreen(),
    SettingsScreen()
  ];
 void changeBottomNav(int index){
   currentIndex = index;
   emit(ShopChangeBottomNavBar());
 }
 late HomeModel homeModel;
 Map<int,bool> favourite ={};

 void geData(){

   emit(ShopLodiningHomeDataState());
   DioHelper.getData(url: HOME,token: token ).then((value)
   {
     homeModel = HomeModel.fromJson(value.data);
     homeModel.data.product.forEach((element) {
       favourite.addAll({element.id:element.inFavorite});
     });

     emit(ShopSuccessHomeDataState());}).catchError((erorr){
     emit(ShopErorrHomeDataState());
   });

 }

  late CategorriesModel categorriesModel;
  void getCategorries(){


    DioHelper.getData(url: Get_Categories,token: token ).then((value)
    {
      categorriesModel = CategorriesModel.fromJson(value.data);

      emit(ShopSuccessCategorriesState());}).catchError((erorr){
      emit(ShopErorrCategorriesState());
    });

  }

 late ChangeFavouritemodel changeFavouritemodel;

  void changeFavourite(int productId){
    favourite[productId]= !favourite[productId]!;
    emit(ShopSuccessFavouritesState(changeFavouritemodel));
    DioHelper.postData(url: FAVOURITE,
        data: {'product_id':productId},
        token: token).then((value) {
      changeFavouritemodel=ChangeFavouritemodel.fromJson(value.data);
      if(!changeFavouritemodel.status)
        {
          favourite[productId]= !favourite[productId]!;
        }

      emit(ShopSuccessFavouritesState(changeFavouritemodel));}
      ).catchError((erorr){ShopErorrFavouritesState();
    favourite[productId]= !favourite[productId]!;}
      );

  }

  late ShoploginModel usermodel;
  void getuserdata(){


    DioHelper.getData(url: PROFILE,token: token ).then((value)
    {
      usermodel = ShoploginModel.fromJson(value.data);

      emit(ShopSuccessUserDataState(usermodel));}).catchError((erorr){
      emit(ShopErorrUserDataState());
    });

  }

  void getupdateUserData({
    required String name,
    required String email,
    required String phone,
  }){


    DioHelper.putData(url: UPDATE_PROFILE,token: token, data: {
      'name':name,
      'email': email,
      'phone': phone
    } ).then((value)
    {
      usermodel = ShoploginModel.fromJson(value.data);

      emit(ShopSuccessUpdateUserDataState(usermodel));}).catchError((erorr){
      emit(ShopErorrUpdateUserDataState());
    });

  }

}