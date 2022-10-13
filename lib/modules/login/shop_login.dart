import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/layout/shop_layout.dart';
import 'package:shop/modules/login/cubit.dart';
import 'package:shop/modules/login/states.dart';
import 'package:shop/sheard/sheard_componunts/compunents.dart';
import 'package:shop/sheard/sheard_componunts/constanse.dart';
import 'package:shop/sheard/sheard_componunts/navigate.dart';
import 'package:shop/sheard/sheard_network/local/cache_helper.dart';

import '../register/register_screen.dart';


class ShopLogin extends StatelessWidget {

  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
       listener: (context,state){
         if(state is ShopLoginSuccessState)
           {
             if(state.loginModel.status)
               {
                 print(state.loginModel.message);
                 print(state.loginModel.data.token );



                 CacheHelper.saveData(key: 'token', value: state.loginModel.data.token ).then((value) {
                   token = state.loginModel.data.token!;
                   navigateFinish(context, Shoplayout());
                 });
               }else{
               print(state.loginModel.message);
               showToast(
                 text: state.loginModel.message,
                 state: ToastStates.ERORR
               );



             }
           }
       },
        builder: (context,state){
         return Scaffold(
           appBar: AppBar(),
           body: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Center(
               child: SingleChildScrollView(
                 child: Form(
                   key: formkey,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
                       SizedBox(height: 20,),
                       Text("Login in our braows to enjoy offers ",style: TextStyle(fontSize: 13,color: Colors.grey),),
                       SizedBox(height: 30,),

                       defultForm(controller: emailController,
                           type: TextInputType.emailAddress,
                           lable: "Enter your email",
                           prefix: Icons.mail_outline
                       ),
                       SizedBox(height: 20,),
                       defultForm(controller: PasswordController,
                           type: TextInputType.visiblePassword,

                           lable: "Enter your password",
                           prefix: Icons.lock,
                           isPassword: true,
                           sufix: Icons.visibility

                       ),
                       SizedBox(height: 20,),
                       ConditionalBuilder(condition: state is! ShopLoginLodiningState,
                           builder: (context)=>defult_Button(text: "Login", function: (){
                             if(formkey.currentState!.validate()){
                               ShopLoginCubit.get(context).user(email: emailController.text, password: PasswordController.text);
                             }

                           },isUpperCase: true),
                           fallback: (context)=> Center(child: CircularProgressIndicator(),)
                       ),

                       SizedBox(height: 15,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("Dont have an account"),
                           TextButton(
                               onPressed: (){
                                 navigateTo(context, RegisterScreen());
                               },
                               child: Text("register",style: TextStyle(color: Colors.deepOrange),)
                           ),
                         ],
                       )

                     ],
                   ),
                 ),
               ),
             ),
           ),
         );
        },
      ),
    );
  }
}
