import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/SellerListController/SellerListController.dart';
import '../../widgets/customTextfield.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
   final controller = Get.put(SellerListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTextField(
                text: "Email",
                controller: controller.emailController,
                keyboardType: TextInputType.text,
                length:80,
                inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
              ),
              SizedBox(height: 20,),


              CustomTextField(
                controller: controller.passwordController,
                text: "password",
                keyboardType: TextInputType.text,
                length:80,
                inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
              ),

              ElevatedButton(onPressed: (){
                controller.loginButton();

              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
