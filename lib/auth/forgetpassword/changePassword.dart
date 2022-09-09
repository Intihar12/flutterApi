import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapis/controller/auth_controller.dart';
import 'package:flutterapis/widgets/customTextfield.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
 // const ChangePassword({Key? key}) : super(key: key);
final _authController= Get.put(authController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Password"),),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          CustomTextField(
            controller: _authController.resetOtpController,
            text: "otp",
            keyboardType: TextInputType.emailAddress,
            length:80,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          SizedBox(height: 15,),
          CustomTextField(
            controller: _authController.resetPasswordController,
            text: "******",
            keyboardType: TextInputType.emailAddress,
            length:80,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),          SizedBox(height: 15,),

          CustomTextField(
            controller: _authController.confromPasswordController,
            text: "******",
            keyboardType: TextInputType.emailAddress,
            length:80,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          SizedBox(height: 15,),

          TextButton(onPressed: (){

            _authController.resetPasswordButton();
          },
          child:  Text("Confrom Password"),)

        ],),
      ),
    );
  }
}
