import 'package:shop/models/change_favourites_model.dart';
import 'package:shop/models/login_model.dart';

abstract class ShopStates{}

class ShopInicialState extends ShopStates{}

class ShopChangeBottomNavBar extends ShopStates{}

class ShopLodiningHomeDataState extends ShopStates{}

class ShopSuccessHomeDataState extends ShopStates{}

class ShopErorrHomeDataState extends ShopStates{}

class ShopSuccessCategorriesState extends ShopStates{}

class ShopErorrCategorriesState extends ShopStates{}

class ShopSuccessFavouritesState extends ShopStates{
  final ChangeFavouritemodel model;

  ShopSuccessFavouritesState(this.model);
}

class ShopChangeFavouritesState extends ShopStates{}

class ShopErorrFavouritesState extends ShopStates{}

class ShopLodiningUserDataState extends ShopStates{}

class ShopSuccessUserDataState extends ShopStates{
  final ShoploginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopErorrUserDataState extends ShopStates{}

class ShopLodiningUpdateUserDataState extends ShopStates{}

class ShopSuccessUpdateUserDataState extends ShopStates{
  final ShoploginModel loginModel;

  ShopSuccessUpdateUserDataState(this.loginModel);
}

class ShopErorrUpdateUserDataState extends ShopStates{}