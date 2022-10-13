import 'package:shop/models/login_model.dart';

abstract class ShopRegisterStates{}

class ShopRegisterChangePasswordVisibiltyState extends ShopRegisterStates{}

class ShopRegisterInitialState extends ShopRegisterStates{}

class ShopRegisterLodiningState extends ShopRegisterStates{}

class ShopRegisterSuccessState extends ShopRegisterStates{
  final ShoploginModel loginModel;

  ShopRegisterSuccessState(this.loginModel);
}

class ShopRegisterErorrState extends ShopRegisterStates{
  final String erorr;

  ShopRegisterErorrState(this.erorr);

}



