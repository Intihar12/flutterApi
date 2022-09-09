import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/profile_Controller/profile_controller.dart';
import '../../widgets/customTextfield.dart';

class EditProfile extends StatelessWidget {
  //const EditProfile({Key? key}) : super(key: key);
final _authController=Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,

        actions: [
          Center(
              child: GestureDetector(
                onTap: () {
                  _authController.isEdit.value = false;
                  _authController.f1.value.requestFocus();
                },
                child: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: _authController.isEdit.value
                        ? Text('edit')
                        : Container(),
                  );
                }),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(children: [


            Obx(() {
              return CustomTextField(
                 // focusNode: _authController.f1.value,
                  Readonly: _authController.isEdit.value,
                  text: '',
                  controller: _authController.fnameController,
                  length: 30,
                  keyboardType: TextInputType.text,
                  inputFormatters:
                  FilteringTextInputFormatter.singleLineFormatter);
            }),

            SizedBox(height: 15,),

          CustomTextField(

                  Readonly: _authController.isEdit.value,
                  text: '',
                  controller: _authController.lnameController,
                  length: 30,
                  keyboardType: TextInputType.text,
                  inputFormatters:
                  FilteringTextInputFormatter.singleLineFormatter),

            SizedBox(height: 15,),
            Obx(() {
              return CustomTextField(
                  Readonly: _authController.isEdit.value,
                 // Readonly: true,
                  text: '',
                  controller: _authController.emailController,
                  length: 30,
                  keyboardType: TextInputType.text,
                  inputFormatters:
                  FilteringTextInputFormatter.singleLineFormatter);
            }),
            SizedBox(height: 15,),

            Obx(() {
              return CustomTextField(

                  Readonly: _authController.isEdit.value,
                  text: '',
                  controller: _authController.phoneController,
                  length: 30,
                  keyboardType: TextInputType.text,
                  inputFormatters:
                  FilteringTextInputFormatter.singleLineFormatter);
            }),
            SizedBox(height: 15,),

       TextButton(onPressed: (){

         _authController.updateButton();

       }, child: Text("Save"))


          ],),
        ),
      ),
    );
  }
}
