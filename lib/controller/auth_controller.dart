import 'package:flutter/cupertino.dart';
import 'package:flutterapis/auth/forgetpassword/changePassword.dart';
import 'package:flutterapis/auth/forgetpassword/forgetpassword.dart';
import 'package:flutterapis/auth/verifyemail/verifyemail.dart';
import 'package:flutterapis/data/repository.dart';
import 'package:flutterapis/data/singleton/singleton.dart';
import 'package:flutterapis/models/signupmole.dart';
import 'package:flutterapis/widgets/progressBar.dart';
import 'package:flutterapis/widgets/toasts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/local_storage/local_storage.dart';
import '../ui/home/home.dart';

class authController extends GetxController {
  final _repocontroller = Reposity();
  String? otp;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countrycodeController = TextEditingController();
  TextEditingController phoneNumberConteoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController resetOtpController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController confromPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();

  sinUpUser(
      {required String fname,
      required String lname,
      required String email,
      required String password,
      required String Countrycode,
      required String phonenum,
      required String deviceToken,
      required String gkey}) async {
    _repocontroller
        .signUpRpo(
            firstNmae: fname,
            lastName: lname,
            email: email,
            Countrycode: Countrycode,
            phoneNumber: phonenum,
            Password: password,
            deviceToken: deviceToken,
            gkey: "0")
        .then((value) {
      if (value.responseCode == "1") {
        SingleToneValue.instance.resendEmail = value.response![0].email!;
        //  SingleToneValue.instance.resendEmail = value.data!.email!;
        //   GetStorage().write("userId", );
        // GetLocalStorage().setUserId(value.response![0].userId!);
        //   SingleToneValue.instance.userId =value.response![0].userId!;
        GetStorage().write('email', value.response![0].email);
        GetStorage().write('firstName', value.response![0].firstName);
        GetStorage().write('lastName', value.response![0].lastName);

        GetStorage().write("user_id", value.response![0].userId!);
        GetStorage().write("accessToken", value.response![0].accessToken!);
        CustomToast.successToast(
          msg: "${value.responseMessage}",
        );
        Get.to(Home());
      } else {
        CustomToast.failToast(msg: "${value.errors}");
      }
    }, onError: (error) {
      CustomToast.failToast(
        msg: "Error: ${error.toString()}",
      );
    });
  }

  signUpButton() {
    // Get.dialog(ProgressBar(), barrierDismissible: false);

    sinUpUser(
        fname: firstnameController.text,
        lname: lastNameController.text,
        email: emailController.text,
        phonenum: phoneNumberConteoller.text,
        password: passwordController.text,
        deviceToken: "",
        Countrycode: "+92",
        gkey: "0");
  }

  /// login
  loginUser(
      {required String email,
      required String password,
      required String deviceTocken}) {
    _repocontroller
        .loginUser(email: email, password: password, deviceTocken: deviceTocken)
        .then((value) {
      if (value.responseCode == "1") {
        SingleToneValue.instance.userId = value.response![0]
            .userId!; // GetLocalStorage().setUserId(value.response![0].userId!);
        SingleToneValue.instance.email = value.response![0]
            .email!; // GetLocalStorage().setUserId(value.response![0].userId!);
        CustomToast.successToast(msg: "${value.responseMessage}");
        GetStorage().write('email', value.response![0].email);
        GetStorage().write('fname', value.response![0].firstName);
        GetStorage().write('lname', value.response![0].lastName);
        GetStorage().write('user_id', value.response![0].userId);
        GetStorage().write("accessToken", value.response![0].accessToken!);
Get.to(Home());
      } else if (value.responseCode == "2") {
        Get.to(VeriffEmail());
        CustomToast.successToast(msg: "${value.responseMessage}");
      } else {
        CustomToast.failToast(msg: "${value.errors}");
      }
    }, onError: (error) {
      CustomToast.failToast(msg: "Error  ${error.toString()}");
    });
  }

  loginButton() {
    loginUser(
        email: emailController.text,
        password: passwordController.text,
        deviceTocken: "");
  }

  /// verifyEmail

  verifyEmailButton() {
    print(otp);
    Get.dialog(ProgressBar(), barrierDismissible: false);
    _repocontroller.verifyEmailRpo(otp: otp!).then((value) {
      if (value.responseCode == "1") {
        // GetStorage().write("user_Id", value.response);
        Get.back();
        SingleToneValue.instance.resendEmail = value.response![0].email!;
        SingleToneValue.instance.userId = value.response![0].userId!;
        GetStorage().write("accessToken", value.response![0].accessToken!);

        CustomToast.successToast(msg: "${value.responseMessage}");
      } else {
        CustomToast.failToast(msg: "${value.errors}");
      }
    }, onError: (error) {
      CustomToast.failToast(msg: "Error  ${error}");
    });
  }


  /// forget password

forgetpasswordFunction({required String email})async{
    await _repocontroller.forgetPasswordApiRpo(email: email).then((value) {
      if(value.responseCode=="1"){
        CustomToast.successToast(msg: "${value.responseMessage}");
        Get.to(ChangePassword());
      }
      else{
        CustomToast.failToast(msg:  "${value.errors}");
      }
    });
}

forgetPasswordButton(){
  forgetpasswordFunction(email: emailController.text);
}

/// resetpassword

resetPasswordFunction()async{
return await _repocontroller.resetPasswordRpo(otp: resetOtpController.text, password: resetPasswordController.text).then((value) {
  if(value.responseCode=="1"){
    CustomToast.successToast(msg: "${value.responseMessage}");
  }else{
    CustomToast.failToast(msg: "${value.errors}");
  }
},onError: (error) {
  CustomToast.failToast(msg: "Error  ${error.toString()}");
});
}

resetPasswordButton(){
if(resetPasswordController.text==confromPasswordController.text){
  resetPasswordFunction();

}else {
  CustomToast.failToast(
    msg: "please Enter same password in both fields",
  );
}
}

/// changePassword

changePassword({required String oldPassword,required String newPassword})async{
    return await _repocontroller.changePasswordApiRpo(oldPassword: oldPassword, newPassword: newPassword).then((value) {
      if(value.responseCode=="1"){
        CustomToast.successToast(msg: "${value.responseMessage}");
      }else{
        CustomToast.failToast(msg: "${value.errors}");
      }
    },onError: (error) {
      CustomToast.failToast(msg: "Error  ${error.toString()}");
    });
}

changePasswordButton(){

    if(newPasswordController.text == confirmNewPasswordController.text){
      changePassword(oldPassword: oldPasswordController.text, newPassword: newPasswordController.text);
    }else{
      CustomToast.failToast(msg: "New Password ans confirmPassword must be sam");
    }
}

}
