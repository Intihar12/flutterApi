import 'package:get_storage/get_storage.dart';

//import '../local_storage/get_storage.dart';

class SingleToneValue {
  String? code = "+1";
  var storage = GetStorage();
  String? status;
  double currentLat = 31.464557856296594;
  String? customLocation;
  String resendEmail = "";
  String userId = "";
  String? deviceToken;
  double currentLng = 74.24347511142429;
String? contactname;
  String? email;
  String? contactEmail;
  String? contactPhone;
  //GetLocalStorage? localStorage = GetLocalStorage();

  SingleToneValue._privateConstructor();

  static SingleToneValue get instance => _instance;

  static final SingleToneValue _instance =
      SingleToneValue._privateConstructor();

  factory SingleToneValue() {
    return _instance;
  }
}
