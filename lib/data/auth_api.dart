import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterapis/models/forgetpassword/changepassmodel.dart';
import 'package:flutterapis/models/forgetpassword/forgetpassword.dart';

//import 'package:flutterapis/data/local_storage/local_storage.dart';
import 'package:flutterapis/models/signupmole.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class authConnectApi extends GetConnect {
  var baseUrl = "https://backend.antrakdelivery.com/";



  /// LOGIN API
  ///
  Future<SignUpModel> signUp(
      {required String fname,
      required String lname,
      required String email,
      required String password,
      required String countrycode,
      required String phonenum,
      required String deviceToken,
      required String gkey}) async {
    httpClient.timeout = const Duration(seconds: 100);
    var response = await post('users/register', {
      "firstName": fname,
      "lastName": lname,
      "email": email,
      "password": password,
      "countryCode": countrycode,
      "phoneNum": phonenum,
      "gkey": "0",
      "deviceToken": deviceToken
    }, headers: {
      'Accept': 'application/json'
    });
    if (response.hasError) {
      Get.log("errrrrsss    ${response.statusText.toString()}");
      return Future.error(response.statusText!);
    } else {
      Get.log("errrrrty    ${response.body}");

      SignUpModel? value = SignUpModel.fromJson(response.body);
      GetStorage().write('email', value.response![0].email);
      GetStorage().write('firstName', value.response![0].firstName);
      GetStorage().write('lastName', value.response![0].lastName);
      GetStorage().write("user_id", value.response![0].userId!);
      GetStorage().write("accessToken", value.response![0].accessToken!);
      return value;
    }
  }

  /// login

  Future<SignUpModel> login(
      {required String email,
      required String password,
      required String deviceTocken}) async {
    httpClient.timeout = const Duration(seconds: 100);
    Get.log("login email : $email");
    var response = await post("users/login",
        {"email": email, "password": password, "deviceToken": deviceTocken});
    Get.log("login response : ${response.body}");
    if (response.hasError) {
      return Future.error(response.statusText!);
    } else {
      return SignUpModel.fromJson(response.body);
    }
  }

  /// varefy email

  Future<SignUpModel> verifyEmail({required String otp}) async {
    httpClient.timeout = const Duration(seconds: 100);

    var user_id = GetStorage().read('user_id');
    Get.log("userid:${user_id}");

    var response = await post("users/vemail", {
      //  "userId": GetLocalStorage().getUserId(),
      "userId": "$user_id",
      "OTP": "$otp",
    }, headers: {
      'Accept': 'application/json'
    });
    Get.log("verify email:${response.body}");
    if (response.hasError) {
      return Future.error(response.statusText!);
    } else {
      return SignUpModel.fromJson(response.body);
    }
  }

  ///  forget passwor

  Future<ForgetPasswordModel>forgetPasswordApi({required String email})async{
    httpClient.timeout = const Duration(seconds: 100);

    // ForgetPasswordModel? modal;
    var response= await post('users/femail',{
      "email":email
    }, headers: {
      'Accept': 'application/json',
    });
    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      ForgetPasswordModel? model = ForgetPasswordModel.fromJson(response.body);
      GetStorage().write("user_Id", model.response![0].userId);

      GetStorage().write("forget_pass_id", model.response![0].forgetRequestId);
      return model;
    }
  }

  /// resetpassword
Future<ForgetPasswordModel>resetPasswordApi({required String otp, required String password})async{
  httpClient.timeout = const Duration(seconds: 100);

  var response=await post('users/femail/verify',{
      "userId":GetStorage().read("user_Id"),
      "forgetRequestId":GetStorage().read("forget_pass_id"),
      "password" : password,
      "OTP" : otp,
    }, headers: {
    'Accept': 'application/json',
  });
    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      ForgetPasswordModel? model=ForgetPasswordModel.fromJson(response.body);
      return model;
    }
}

/// changePassword

Future<ChangePasswordModel>changePasswordApi({
  required String oldPassword, required String newPassword
})async{
  httpClient.timeout = const Duration(seconds: 100);

  var response= await put('users/updatepassword', {


      "oldPassword": oldPassword,
      "newPassword": newPassword,

    }, headers: {
    'Accept': 'application/json',
  //  'accessToken':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imh1c3NhaW5pbnRpaGFyQGdtYWlsLmNvbSIsImlkIjoxNDgsImlhdCI6MTY1ODkyNjc2NH0.Yatu_26M5MG7F1lX-CchymWu5s_1rJw7sUSodUFf9Bc'
   'accessToken': GetStorage().read('accessToken')

  });
  Get.log("update response : ${response.body}");
    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      return ChangePasswordModel.fromJson(response.body);

    }
}




}


