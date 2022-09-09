import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapis/controller/auth_controller.dart';
import 'package:flutterapis/widgets/customTextfield.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
 // const ForgetPassword({Key? key}) : super(key: key);
final _authController=Get.put(authController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forget Passrord"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          CustomTextField(
            controller: _authController.emailController,
            text: "password",
            keyboardType: TextInputType.emailAddress,
            length:80,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),

          ElevatedButton(onPressed: (){
            _authController.forgetPasswordButton();
          }, child: Text("Next"))
        ],),
      ),
    );
  }
}
