



import '../../modules/login/shop_login.dart';
import '../sheard_network/local/cache_helper.dart';
import 'navigate.dart';

void signOut(context){
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      navigateFinish(context, ShopLogin());
    }
  });

}

String token="";