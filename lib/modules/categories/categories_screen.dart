import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/cubit.dart';
import 'package:shop/layout/layout_states.dart';
import 'package:shop/models/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
        builder: (context,state){
        return ListView.separated(itemBuilder: (context,index)=>buildCatItems(ShopCubit.get(context).categorriesModel.data.data[index]),
            separatorBuilder: (context,index)=>Divider(),
            itemCount: ShopCubit.get(context).categorriesModel.data.data.length
        );
    },

    );

  }

  Widget buildCatItems(DataModel model)=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
  children: [
  Image(image: NetworkImage(model.image),height: 120,fit: BoxFit.cover,),
  SizedBox(width:15 ,),
  Text(model.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
  Spacer(),
  Icon(Icons.arrow_forward_ios)
  ],
  ),
  );
}
