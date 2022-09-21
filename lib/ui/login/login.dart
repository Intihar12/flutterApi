import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';

import '../../controller/SellerListController/SellerListController.dart';
import '../../widgets/customTextfield.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
   final controller = Get.put(SellerListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.cardGrey,


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20, top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Login",style: TextStyle(fontSize: 20,color: MyColors.viewcolor,fontWeight: FontWeight.bold),),
              SizedBox(height: 90,),
              CustomTextField(
                icon: Icon(Icons.email,color: MyColors.black.withOpacity(0.4),),
                text: "Email",
                controller: controller.emailController,
                keyboardType: TextInputType.text,
                length:80,
                inputFormatters: FilteringTextInputFormatter.singleLineFormatter,

              ),
              SizedBox(height: 20,),


              CustomTextField(
                icon: Icon(Icons.lock,color: MyColors.black.withOpacity(0.4),),

                controller: controller.passwordController,
                text: "password",
                keyboardType: TextInputType.text,
                length:80,
                inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
              ),
SizedBox(height: 30,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: MyColors.viewcolor, // Background color
                  ),
                  onPressed: (){
                controller.loginButton();

              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
