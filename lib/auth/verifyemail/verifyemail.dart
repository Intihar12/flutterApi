import 'package:flutter/material.dart';
import 'package:flutterapis/controller/auth_controller.dart';
import 'package:flutterapis/widgets/verifyemailwidget.dart';
import 'package:get/get.dart';

class VeriffEmail extends StatelessWidget {
//  const VeriffEmail({Key? key}) : super(key: key);
final _authController=Get.put(authController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify Email"),),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          CustomPinEntryField(
            onSubmit: (value){
              _authController.otp = value;
            },
            fields: 4,
          ),

          TextButton(onPressed: (){

            _authController.verifyEmailButton();
          }, child: Text("VerifyOtp"))
        ],),
      ),
    );
  }
}
