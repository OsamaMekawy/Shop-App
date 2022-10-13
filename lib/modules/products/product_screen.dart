
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/cubit.dart';
import 'package:shop/layout/layout_states.dart';
import 'package:shop/models/categories_model.dart';
import 'package:shop/models/home_model.dart';
import 'package:shop/sheard/sheard_componunts/compunents.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){
          if(state is ShopSuccessFavouritesState)
            if(!state.model.status)
              {
                showToast(text: state.model.message, state: ToastStates.ERORR);
              }
        },
        builder: (contex,index){
          return ConditionalBuilder(
              condition: ShopCubit.get(context).homeModel!=null && ShopCubit.get(context).categorriesModel!=null,
              builder: (context)=>productBuilder(ShopCubit.get(context).homeModel,ShopCubit.get(context).categorriesModel,context),
              fallback: (context) => Center(child: CircularProgressIndicator(),)
          );
    },
    );
  }
  Widget productBuilder(HomeModel model,CategorriesModel categorriesModel,context)=> SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      children: [
        CarouselSlider(
            items:
            model.data.banners.map((e) => Image(image: NetworkImage("${e.image}",),fit: BoxFit.cover,width: double.infinity,) ).toList(),

            options: CarouselOptions(
              height: 250,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,

            )
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Categories",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
              SizedBox(height: 20,),
              Container(
                height: 100,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>buildCategoriesItem(categorriesModel.data.data[index]),
                    separatorBuilder:(context,index)=> SizedBox(width: 10,),
                    itemCount: categorriesModel.data.data.length
                ),
              ),
              Text("New Product",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
            ],
          ),
        ),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            shrinkWrap: true,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1/1.58,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(model.data.product.length, (index) => buildGridProduct(model.data.product[index],context))
          ),
        )
      ],
    ),
  );

  Widget buildGridProduct(ProductModel model,context)=>Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(image: NetworkImage(model.image),
              width: double.infinity,
            ),
            if(model.discount!=0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              color: Colors.red,
              child: Text("Descount",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.white),),
            )
          ],
        ),
        Text(model.name,
        maxLines: 2,
        overflow:TextOverflow.ellipsis ,
          style: TextStyle(fontSize: 14,height: 1.2),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${model.price.round()}",
                style: TextStyle(fontSize: 12,color: Colors.deepOrange),
              ),
              if(model.discount!=0)
              Row(
                children: [
                  Text("${model.oldPrice.round()}",
                    style: TextStyle(fontSize: 12,color: Colors.grey,decoration: TextDecoration.lineThrough),
                  ),
                  Text("${model.discount.round()}",
                    style: TextStyle(fontSize: 12,color: Colors.grey,decoration: TextDecoration.lineThrough),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){ShopCubit.get(context).changeFavourite(model.id);
                  },
                    icon: CircleAvatar(
                    radius: 15,
                 //   backgroundColor: ShopCubit.get(context).favourite[model..id ] ? Colors.blue :Colors.grey,
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
  );

  Widget buildCategoriesItem(DataModel model)=>Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(image: NetworkImage(model.image),height: 100,width: 100,fit: BoxFit.cover,),
      Container(
        color: Colors.black.withOpacity(0.8),
        width: 100,
        child: Text(
          model.name,style: TextStyle(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      )
    ],
  );

}


