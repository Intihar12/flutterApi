import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapis/auth/verifyemail/verifyemail.dart';
import 'package:flutterapis/controller/auth_controller.dart';
import 'package:flutterapis/widgets/customTextfield.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  //const LogIn({Key? key}) : super(key: key);
final _controller=Get.put(authController());
  @override
  Widget build(BuildContext context) {
    var mediaquery=MediaQuery.of(context).size.width;
    var mediaquerys=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            CustomTextField(
              controller: _controller.firstnameController,
              text: "First name",
              keyboardType: TextInputType.text,
              length:80,
              inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
            ),
            SizedBox(height: mediaquerys/10,),

            CustomTextField(
              controller: _controller.lastNameController,
              text: "Last name",
              keyboardType: TextInputType.text,
              length:80,
              inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
            ),
            SizedBox(height: mediaquerys/10,),
            CustomTextField(
              controller:  _controller.emailController,
              text: "Email",
              keyboardType: TextInputType.text,
              length:80,
              inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
            ),
            SizedBox(height: mediaquerys/10,),
            CustomTextField(
              controller: _controller.phoneNumberConteoller,
              text: "phone num",
              keyboardType: TextInputType.text,
              length:80,
              inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
            ),
            SizedBox(height: mediaquerys/10,),
            CustomTextField(
              controller: _controller.passwordController,
              text: "password",
              keyboardType: TextInputType.text,
              length:80,
              inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
            ),
            SizedBox(height: mediaquerys/15,),

            ElevatedButton(onPressed: (){

              _controller.signUpButton();
              Get.to(VeriffEmail());
            }, child: Text("SignUp")),
            SizedBox(height: mediaquerys/15,),
            TextButton(onPressed: (){}, child: Text("Forget password"))
          ],),
        ),
      ),
    );
  }
}
