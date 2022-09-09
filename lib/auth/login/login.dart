import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapis/auth/forgetpassword/forgetpassword.dart';
import 'package:flutterapis/auth/signup/signup.dart';
import 'package:flutterapis/controller/auth_controller.dart';
import 'package:flutterapis/ui/profiledit/profileedit.dart';
import 'package:flutterapis/widgets/customTextfield.dart';
import 'package:get/get.dart';

import '../changepassword/changePassword.dart';

class LogIn extends StatelessWidget {
  //const LogIn({Key? key}) : super(key: key);
final _authController=Get.put(authController());
  @override
  Widget build(BuildContext context) {
    var mediaquery=MediaQuery.of(context).size.width;
    var mediaquerys=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(children: [


            CustomTextField(
              text: "Email",
              controller: _authController.emailController,
              keyboardType: TextInputType.text,
              length:80,
              inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
            ),
            SizedBox(height: mediaquerys/10,),


            CustomTextField(
              controller: _authController.passwordController,
              text: "password",
              keyboardType: TextInputType.text,
              length:80,
              inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
            ),
            SizedBox(height: mediaquerys/15,),

            ElevatedButton(onPressed: (){
              _authController.loginButton();

            }, child: Text("Login")),
            SizedBox(height: mediaquerys/15,),
            TextButton(onPressed: (){

              Get.to(SignUp());
            }, child: Text("SignUp")),
            TextButton(onPressed: (){

              Get.to(ForgetPassword());
            }, child: Text("Forget Password")),


            TextButton(onPressed: (){

              Get.to(ChangePassword());
            }, child: Text("Change Password")),

            TextButton(onPressed: (){
              Get.to(EditProfile());
            }, child: Text("Edit Profile"))
          ],),
        ),
      ),
    );
  }
}
