import 'package:flutterapis/data/Profile_api/profile_api.dart';
import 'package:flutterapis/data/auth_api.dart';
import 'package:flutterapis/models/forgetpassword/changepassmodel.dart';
import 'package:flutterapis/models/forgetpassword/forgetpassword.dart';
import 'package:flutterapis/models/grt_usermodel/get_usermodel.dart';
import 'package:flutterapis/models/homeModel/homeModel.dart';
import 'package:flutterapis/models/signupmole.dart';
import 'package:flutterapis/models/update_pro_model/update_profile_model.dart';

import 'hoomeapi/hoomeapi.dart';

class Reposity implements Closeable {
  final _authClient = authConnectApi();
final _profileClient= ProfileApiController();
final _homProviderApi=HomProviderApi();
  @override
  void close() {
    // TODO: implement close
  }

  /// SIGNuP

  Future<SignUpModel> signUpRpo(
      {required String firstNmae,
      required String lastName,
      required String email,



      required String Password,
        required String Countrycode,
        required String phoneNumber,
      required String deviceToken,
        required String gkey,}) async {
    return await _authClient.signUp(
        fname: firstNmae,
        lname: lastName,
        email: email,
        password: Password,
        countrycode: Countrycode,
        phonenum: phoneNumber,
        deviceToken: deviceToken,
        gkey: "0");
  }


  /// login

Future<SignUpModel>loginUser({required String email, required String password, required String deviceTocken})async{
   return await _authClient.login(email: email, password: password, deviceTocken: deviceTocken);

}

///   verifyEmail
Future<SignUpModel>verifyEmailRpo({required String otp})async{
    print('Otp: $otp');
    return await _authClient.verifyEmail(otp: otp);
}

/// forget password

Future<ForgetPasswordModel>forgetPasswordApiRpo({required String email})async{
    return await _authClient.forgetPasswordApi(email: email);

}

/// reset password

Future<ForgetPasswordModel> resetPasswordRpo({required String otp, required String password})async{
    return await _authClient.resetPasswordApi(otp: otp, password: password);
}
///  changePassword


Future<ChangePasswordModel>changePasswordApiRpo({required String oldPassword,required String newPassword})async{
    return await _authClient.changePasswordApi(oldPassword: oldPassword, newPassword: newPassword);
}

/// getuser

Future<GetUserModal>getUserRpo()async{
    return await _profileClient.getUser();
}

/// update
 Future<UpdateProfileModel> updateProfileRpo({required String fName,required String lName, required String countryCode,required String phone})async{
    return await _profileClient.updatProfile(fName: fName, lName: lName, countruCode: countryCode, phone: phone);

}
/// HomeApi
Future<HomeModel>homeApiRpo()async{
   return await _homProviderApi.homeApi();
}

}

abstract class Closeable {
  void close();
}
