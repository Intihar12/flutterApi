import 'package:get_storage/get_storage.dart';



class GetLocalStorage {


  void setUserId(String userId) {
    GetStorage().write("user_Id", userId);
  }

  String getUserId() {
    return GetStorage().read("user_Id");
  }

  void deleteUserId() {
    GetStorage().remove("user_Id");
  }


}