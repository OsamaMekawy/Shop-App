import 'package:shop/models/login_model.dart';

abstract class ShopLoginStates{}

class ShopLoginInitialState extends ShopLoginStates{}

class ShopLoginLodiningState extends ShopLoginStates{}

class ShopLoginSuccessState extends ShopLoginStates{
  final ShoploginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErorrState extends ShopLoginStates{
  final String erorr;

  ShopLoginErorrState(this.erorr);

}

class ShopChangePasswordVisibiltyState extends ShopLoginStates{}