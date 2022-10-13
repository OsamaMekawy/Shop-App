import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/cubit.dart';
import 'package:shop/sheard/sheard_componunts/compunents.dart';
import 'package:shop/sheard/sheard_componunts/constanse.dart';

class SettingsScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        listener: (context,state) {},
      builder: (context,state) {
          var model = ShopCubit.get(context).usermodel;
          nameController.text = model.data.name!;
          emailController.text = model.data.email!;
          phoneController.text = model.data.phone!;

          return ConditionalBuilder(
              condition: ShopCubit.get(context).usermodel !=null,
              builder: (context)=> Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [

                      defultForm(
                          controller: nameController,
                          type: TextInputType.name,
                          lable: "Name",
                          prefix:Icons.person
                      ),
                      SizedBox(height: 20,),

                      defultForm(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          lable: "Email Addreess",
                          prefix:Icons.mail_outline
                      ),
                      SizedBox(height: 20,),

                      defultForm(
                          controller: phoneController,
                          type: TextInputType.phone,
                          lable: "Phone Number",
                          prefix:Icons.phone
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      defult_Button(text: "Logout", function: (){signOut(context);}),
                      SizedBox(
                        height: 15,
                      ),

                      defult_Button(text: "update", function: (){
                        ShopCubit.get(context).getupdateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text
                        );
                      })

                    ],
                  ),
                ),
              ),
              fallback:(context)=>Center(child: CircularProgressIndicator(),)
          );
      },
    );
  }
}
