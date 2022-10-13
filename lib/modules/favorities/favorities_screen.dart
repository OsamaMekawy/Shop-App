import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/cubit.dart';
import 'package:shop/layout/layout_states.dart';

class FavoritiesScreen extends StatelessWidget {
  const FavoritiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
        builder: (context,state){
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildFavItem(),
            separatorBuilder:(context,index)=> Divider(),
            itemCount: 10
        );
    },

    );
  }

  Widget buildFavItem() => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
  height: 120,
  child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Stack(
  alignment: AlignmentDirectional.bottomStart,
  children: [
  Image(image: NetworkImage("model.image"),
  width: double.infinity,
  ),
  if(1!=0)
  Container(
  padding: EdgeInsets.symmetric(horizontal: 5),
  color: Colors.red,
  child: Text("Descount",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.white),),
  )
  ],
  ),
  Text("model.name",
  maxLines: 2,
  overflow:TextOverflow.ellipsis ,
  style: TextStyle(fontSize: 14,height: 1.2),
  ),
  SizedBox(width: 20,),
  Expanded(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text("",

  style: TextStyle(fontSize: 12,color: Colors.deepOrange),
  ),
  if(1!=0)
  Spacer(),

  Row(
  children: [
  Text("",

  style: TextStyle(fontSize: 12,color: Colors.grey,decoration: TextDecoration.lineThrough),

  ),
  Text("",

  style: TextStyle(fontSize: 12,color: Colors.grey,decoration: TextDecoration.lineThrough),

  ),
  Spacer(),
  IconButton(
  onPressed: (){
  // ShopCubit.get(context).changeFavourite(model.id);
  },
  icon: CircleAvatar(
  radius: 15,
  // backgroundColor: ShopCubit.get(context).favourite[model.id ] ? Colors.blue :Colors.grey,
  child: Icon(Icons.favorite_border,size: 12,color: Colors.white,)
  )
  )
  ],
  ),
  ],
  ),
  ),
  ],
  ),
  ),
  );
}
