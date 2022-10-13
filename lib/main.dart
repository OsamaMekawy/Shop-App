import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/cubit.dart';
import 'package:shop/layout/layout_states.dart';
import 'package:shop/layout/shop_layout.dart';
import 'package:shop/modules/login/shop_login.dart';
import 'package:shop/modules/onBoarding/onboarding_screen.dart';
import 'package:shop/sheard/sheard_network/local/cache_helper.dart';
import 'package:shop/sheard/sheard_network/remote/dio_helper.dart';
import 'package:shop/sheard/style/thems.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

   String token = CacheHelper.getBoolen(key: 'token');
   bool onBoarding = CacheHelper.getBoolen(key: 'onBoarding');
   late Widget widget;


    if(onBoarding!=null)
      {
        if(token!=null)Shoplayout();
        else widget = ShopLogin();
      }else {
      widget =onBoardingScreen();
    }

  runApp( MyApp(
      startwidget :widget
  ));
}

class MyApp extends StatelessWidget {
 final Widget  startwidget;

   MyApp({required this.startwidget, });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ShopCubit()..geData()..getCategorries()..getuserdata()
          )
        ],
        child: BlocConsumer<ShopCubit,ShopStates>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lighttheme,
                darkTheme: darktheme,

                home:startwidget
            );
          },
        )
    );
  }
}

// MaterialApp(
// debugShowCheckedModeBanner: false,
// theme: lighttheme,
// darkTheme: darktheme,
//
// home:startwidget
// );

