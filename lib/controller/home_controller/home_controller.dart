
import 'package:flutterapis/data/singleton/singleton.dart';
import 'package:flutterapis/models/homeModel/homeModel.dart';
import 'package:flutterapis/widgets/toasts.dart';
import 'package:get/get.dart';

import '../../data/repository.dart';
import '../../ui/home/home.dart';

//class HomeController extends GetxController with StateMixin<HomePageModel>

class HomeController extends GetxController with StateMixin<HomeModel>{
  int current=0;
  final _rpoHome=Reposity();



  getHomeData()async {
try{
    await _rpoHome.homeApiRpo().then((value) {
      SingleToneValue.instance.contactname = value.response![0].name;

      SingleToneValue.instance.contactEmail = value.response![0].email;
      SingleToneValue.instance.contactPhone = value.response![0].contact;
      if (value.responseCode == "1") {
        change(value,status: RxStatus.success());
        CustomToast.successToast(msg: "${value.responseMessage}");
      } else {
        CustomToast.failToast(msg: "${value.errors}");
      }
    }, onError: (error) {
      return error.toString();
    });
  }catch(e){
  Get.snackbar(
      "Error", e.toString().replaceAll('Error:', "Something Went Wrong"));
}
  }

  onPopScope(){
    Get.offAll(Home());
  }

  @override
  void onInit() {
    getHomeData();
    // TODO: implement onInit
    super.onInit();
  }

}