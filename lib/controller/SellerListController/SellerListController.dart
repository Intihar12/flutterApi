
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutterapis/data/singleton/singleton.dart';
import 'package:flutterapis/models/buy_subscription_modal/buy_subscription_modal.dart';
import 'package:flutterapis/models/cancle_booking_modal/cancle_booking_modal.dart';
import 'package:flutterapis/models/get_all_user_avalability/get_all_user_avalibility.dart';
import 'package:flutterapis/models/my_appointments/my_appointments_modal.dart';
import 'package:flutterapis/models/products/products_modal.dart' as product;
import 'package:flutterapis/models/sellerProfileModal/seller_profile_modal.dart';
import 'package:flutterapis/models/service_seller_modal/service_seller_modal.dart';
import 'package:flutterapis/ui/pricing/pricing.dart';
import 'package:flutterapis/widgets/progressBar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../../data/SellerListApi/SellerListApi.dart';
import '../../models/filter_seller_modal/filter_seller_modal.dart';
import '../../ui/home/home.dart';
import '../../ui/my_appoinments/my_appoinments.dart';
import '../../ui/profile_serviceses/profile_serviceses.dart';
import '../../ui/seller_list/seller_list.dart';
import '../../ui/seller_list_filters_applied/seller_list_filters_applied.dart';
import '../../widgets/toasts.dart';

class SellerListController extends GetxController {

  final fackStoreApi=SellerListApi();
  RxBool isgetAllUserAvalibility=false.obs;

  RxBool isIndividual=false.obs;
RxBool isUpComing=true.obs;
int isDistance=1;
int isMorning=1;
double sliderValue=0;
double starsRating=0;
String dateformet="";
//int selectedDate=0;
  DateTime dateTime = DateTime.now();

/// isloading
  RxBool isLoaded=false.obs;
  RxBool isSellersLoaded=false.obs;
  RxBool isSellerProfileLoading=false.obs;
  RxBool isFilterLoading=false.obs;
  RxBool isSellerFilterLoading=false.obs;
  ///
  ///
  product.Products products=product.Products();
  FilterSelectModal filterSelectModal=FilterSelectModal();
  CanceldBookingModal canceldBookingModal=CanceldBookingModal();
MyAppointmentModal myAppointmentModal=MyAppointmentModal();
  GetPlanModal getPlanModal=GetPlanModal();
  SellerProfileModal sellerProfileModal=SellerProfileModal();
  ServiceSellerModal serviceSellerModal=ServiceSellerModal();
GetAllUserAvalibility getAllUserAvalibility=GetAllUserAvalibility();

  final emailController=TextEditingController();
  final passwordController=TextEditingController();


  /// log in


  loginFunction(String email, String password)async{
    await fackStoreApi.logInApi(email: email, password: password).then((value) {

      if(value.status=="1"){
        GetStorage().write("logged_user", value);
     SingleToneValue.instance.assesToken=value.data!.accessToken;

        CustomToast.successToast(msg: "${value.message}");

        Get.to(()=> Home());
        fackStoreData();
      }else{
        CustomToast.failToast(msg: "${value.errors}");
      }
    });

  }

  /// LOGIN BUTTON

  loginButton(){

    loginFunction(emailController.text, passwordController.text);
  }

  ///
  List<product.Datum> productList=<product.Datum>[].obs;

  ///
  fackStoreData()async{
    Get.log("hello");
    await fackStoreApi.fakeProducts().then((value) {
     // Get.log("${value.toList()}");

      Get.log("hello2");
        if(value.status==true){
          CustomToast.successToast(msg: "success");
          products=value;

          isLoaded.value=!isLoaded.value;
          productList=products.data!;
          update();
        }else{

          CustomToast.failToast(msg: "fail");

        }

      } );

  }

  // RxList<selller.Data> foundIndividualList=<Data>[].obs;

  serviceStoreFunction(var serviceID)async{
   // Get.dialog(ProgressBar(),barrierDismissible: false);
    await fackStoreApi.serviceSeller(serviceID).then((value) {

      if(value.status=="1"){
    //    Get.back();
      //  change(value,status: RxStatus.success());
        CustomToast.successToast(msg: "${value.message}");
serviceSellerModal=value;
Get.log("servicesmodal 123 ${serviceSellerModal}");
       // isSellersLoaded.value=!isSellersLoaded.value;
update();
Get.to(()=>SellerListPage());
      }else{
        CustomToast.failToast(msg: "error ${value.errors}");
      }
    });

  }

/// seller profilr modal

sellerProfileFunction(var sellerId)async{
  Get.dialog(ProgressBar(),barrierDismissible: false);

  Get.log("id intuuu ${sellerId}");
    try{
    await fackStoreApi.sellerProfileApi(sellerId).then((value) {
      if(value.status=="1"){
        Get.back();

        CustomToast.successToast(msg: "${value.message}");
        sellerProfileModal=value;
        Get.log("servicesmodal 123 ${sellerProfileModal}");
        isSellerProfileLoading.value=!isSellerProfileLoading.value;
        update();
        Get.to(()=>ProfileServicess());
      }else{
        CustomToast.failToast(msg: "error ${value.errors}");
      }

    });} catch(e){
      Get.snackbar(     "Error", e.toString().replaceAll('Error:', "Something Went Wrong"));
    }
}


/// get all users Avalibility

  gatAllUsersAvalabilityFunction(var sellerid)async{
   // Get.dialog(ProgressBar(),barrierDismissible: false);

    await fackStoreApi.getAlluserAvalabilityApi(sellerid).then((value) {
      if(value.status=="1"){
      // Get.back();
        update();
        getAllUserAvalibility=value;
        isgetAllUserAvalibility.value=!isgetAllUserAvalibility.value;
        CustomToast.successToast(msg: "${value.message}");
      }else{
        CustomToast.failToast(msg: "${value.errors}");
      }
    });

  }

  /// get plan user


  getPlanFunction()async{
    await fackStoreApi.getPalnApi().then((value) {
      if(value.status=="1"){
        getPlanModal=value;
        update();
        CustomToast.successToast(msg: "${value.message}");
        Get.to(()=>Pricing());
      }else{
        CustomToast.failToast(msg: "${value.errors}");
      }
    });
  }

  /// my Appointment function

  myAppointmentFunction()async{
    await fackStoreApi.myAppointments().then((value) {
      if(value.status=="1"){
        myAppointmentModal=value;
        update();
        CustomToast.successToast(msg: "${value.message}");
        Get.to(()=>MyAppointments());
      }else{
        CustomToast.failToast(msg: "${value.errors}");
      }
    });
  }
/// Cancled booking

  cancledBookingFunction(var bookingid)async{
    await fackStoreApi.cancledBookingApi(bookingid).then((value) {

      if(value.status=="1"){
        canceldBookingModal=value;
        update();
        Get.back();
        myAppointmentFunction();
        CustomToast.successToast(msg: "${value.message}");
      }else{
        CustomToast.failToast(msg: "${value.errors}");
      }
    });
  }
/// filter sellers function




  var totalFilter=0;

  filterSellerFunctions()async{

   try{
    await fackStoreApi.filterSellerApi(
        distance:sliderValue==0?"":sliderValue.toString(),
        session: isMorning==1?"1":"2",
        dat:dateformet==""?"":dateformet, rating: starsRating==0?"":starsRating.toString(), sortby: isDistance==1?"distance":"ratings").then((value) {

      if(value.status=="1"){
        filterSelectModal=value;
        isSellerFilterLoading.value=!isSellerFilterLoading.value;
        totalFilter=filterSelectModal.data!.company!.length + filterSelectModal.data!.individual!.length;
        update();
        CustomToast.successToast(msg: "${value.message}");
        Get.to(()=>FilterSellerListPage());
      }else{
        CustomToast.failToast(msg: "${value.errors}");
      }
    });}catch(e){
  Get.snackbar(     "Error", e.toString().replaceAll('Error:', "Something Went Wrong"));
  }
  }


  // Rx<D> allUsers= Rx <List<Map<String, dynamic>>> ([]);
 // final String? allsellers=[];


  @override


  void onInit() {
    // TODO: implement onInit
    // fackStoreData();
    super.onInit();


  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

  }


   filterSearch(String? names){
    List<product.Datum> results=[];

    if(names!.isEmpty){
      results=productList;
      update();
    }else{
      results=productList.where((element) => element.name.toString().toLowerCase().contains(names.toLowerCase())).toList();
    }
    productList=results;
  }
}

///
