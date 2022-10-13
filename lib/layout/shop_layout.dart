import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/cubit.dart';
import 'package:shop/layout/layout_states.dart';
import 'package:shop/modules/login/shop_login.dart';
import 'package:shop/modules/search/search_screen.dart';
import 'package:shop/sheard/sheard_componunts/navigate.dart';
import 'package:shop/sheard/sheard_network/local/cache_helper.dart';

class Shoplayout extends StatelessWidget {
  const Shoplayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){},
        builder: (context, state) {
          var cubit  = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(

              title: Text("Salla"),
              actions: [
                IconButton(onPressed: (){navigateTo(context, SearchScreen()); }, icon: Icon(Icons.search))
              ],
            ),

            body: cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index)
              {
                cubit.changeBottomNav(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),

              ],
            )
          );

        }
    );
  }
}
