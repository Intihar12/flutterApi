import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapis/controller/auth_controller.dart';
import 'package:flutterapis/widgets/customTextfield.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';

class ChangePassword extends StatelessWidget {
//  const ChangePassword({Key? key}) : super(key: key);
final _authController= Get.put(authController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Password"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          CustomTextField(
            controller: _authController.oldPasswordController,
            text: "old password",
            keyboardType: TextInputType.text,
            length:80,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),SizedBox(height: 15,),
          CustomTextField(
            controller: _authController.newPasswordController,
            text: "new password",
            keyboardType: TextInputType.text,
            length:80,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          SizedBox(height: 15,),
          CustomTextField(
            controller: _authController.confirmNewPasswordController,
            text: "confirm password",
            keyboardType: TextInputType.text,
            length:80,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),

          TextButton(onPressed: (){
            _authController.changePasswordButton();
          }, child: Text("Submit"))
        ],),
      ),
    );
  }
}
