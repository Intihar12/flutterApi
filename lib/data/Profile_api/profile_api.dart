

import 'package:flutterapis/models/grt_usermodel/get_usermodel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/update_pro_model/update_profile_model.dart';

class ProfileApiController  extends GetConnect{
  var baseUrl = "https://backend.antrakdelivery.com/";


  Future<GetUserModal>getUser()async{
    var response=await get('users/getuser',headers: {
      'Accept': 'application/json',
      'accessToken': GetStorage().read('accessToken')
    });
    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      return GetUserModal.fromJson(response.body);
    }

  }

/// update profile

  Future<UpdateProfileModel> updatProfile({required String fName, required String lName, required String countruCode, required String phone})async{
    httpClient.timeout = const Duration(seconds: 100);

    var response=await put('users/updateuser', {

      "firstName": fName,
      "lastName": lName,
      "countryCode": countruCode,
      "phoneNum": phone
    },headers: {
      'Accept': 'application/json',

     //  'accessToken':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imh1c3NhaW5pbnRpaGFyQGdtYWlsLmNvbSIsImlkIjoxNDgsImlhdCI6MTY1ODkyNjc2NH0.Yatu_26M5MG7F1lX-CchymWu5s_1rJw7sUSodUFf9Bc'

        'accessToken':GetStorage().read('accessToken')
    });
    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      return UpdateProfileModel.fromJson(response.body);
    }


}

}