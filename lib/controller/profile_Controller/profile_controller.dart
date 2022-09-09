import 'package:flutter/cupertino.dart';
import 'package:flutterapis/data/Profile_api/profile_api.dart';
import 'package:flutterapis/data/repository.dart';
import 'package:flutterapis/widgets/toasts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController{
final profileapiclint= ProfileApiController();
final _repocontroller = Reposity();

var fnameController = TextEditingController();
var lnameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();
var countrycodeController = TextEditingController();
var isEdit=true.obs;
var f1 = new FocusNode().obs;

/// get data

getData()async{
  await _repocontroller.getUserRpo().then((value) {
    if(value.responseCode=="1"){
fnameController.text= value.response![0].firstName!;
lnameController.text=value.response![0].lastName!;
emailController.text=value.response![0].email!;
phoneController.text=value.response![0].phoneNum!;
CustomToast.successToast(msg: '${value.response}');
    }else{
      CustomToast.failToast(msg: "${value.errors}");
    }
  },onError: (error){
    return error.toString();
  });
  }
/// update


updateFunction({
  required String fName,required String lName, required String countryCode, required String phone
})async{
  return await _repocontroller.updateProfileRpo(fName: fName, lName: lName, countryCode: countryCode, phone: phone).then((value){
    if(value.responseCode=="1"){
      GetStorage().write("name", value.response![0].firstName!);
      GetStorage().write("last_name", value.response![0].lastName!);
      isEdit.value = true;
      CustomToast.successToast(msg: "${value.responseMessage}");
    }else{
      CustomToast.failToast(msg: "${value.errors}");
    }
  },onError: (error){
    return error.toString();
  });
}

/// update  button

updateButton(){
  updateFunction(fName: fnameController.text, lName: lnameController.text, countryCode:"+92", phone: phoneController.text);

}

  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }
}

