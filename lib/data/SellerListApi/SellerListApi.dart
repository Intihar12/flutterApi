
import 'package:flutterapis/models/get_all_user_avalability/get_all_user_avalibility.dart';
import 'package:flutterapis/models/sellerProfileModal/seller_profile_modal.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/buy_subscription_modal/buy_subscription_modal.dart';
import '../../models/cancle_booking_modal/cancle_booking_modal.dart';
import '../../models/filter_seller_modal/filter_seller_modal.dart';
import '../../models/my_appointments/my_appointments_modal.dart';
import '../../models/products/products_modal.dart';
import '../../models/seller_user_plan_modal/seller_user_plan_modal.dart';
import '../../models/service_seller_modal/service_seller_modal.dart';
import '../../models/user_login_modal/user_login_modal.dart';
import '../singleton/singleton.dart';

class SellerListApi extends GetConnect{

  var baseUrl="https://zeeshannawaz.com/";

var loginToken="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhbmlzaEBnbWFpbC5jb20iLCJpZCI6MTgsImlhdCI6MTY2Mjk2OTQ1NH0.kBBiBqLrbbrTW1k_OqML7apVtDKOZiGA767QoMgc2RE";




/// login api


  Future<UserLoginModal>logInApi({required String email,required String password})async{
    httpClient.timeout = const Duration(seconds: 100);

    var response= await post("p_services/users/login",{
      "email":email,
      "password":password,

    },

    );
    Get.log("login ....${response.body}");
    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      //GetStorage().write("bearer_token", LoginModal.response![0].accessToken);
      UserLoginModal userLoginModal=UserLoginModal.fromJson(response.body);
      return userLoginModal;
    }

  }

  Future<Products> fakeProducts()async{
    httpClient.timeout = const Duration(seconds: 100);

    var response =await get("p_services/service/get_all_service", headers: {
    //  "accessToken":"$loginToken",
      "Accept": "application/json",
      "accessToken": "${SingleToneValue.instance.assesToken}"
    });

    Get.log(" token : ${SingleToneValue.instance.assesToken}");
    Get.log("hello3");
Get.log("repose hoom1 ${response.body}");
    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      Get.log("Product resp : ${response.body}");
      Products products=Products.fromJson(response.body);
      return products;
    }
  }


  Future<ServiceSellerModal>serviceSeller(var serviceid)async{
    Get.log("Token $loginToken");
    Get.log("id $serviceid");
    var response=await post("p_services/users/service_sellers", {
      "serviceId":serviceid,
    }, headers: {
      "Accept": "application/json",
     // "accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhbmlzaEBnbWFpbC5jb20iLCJpZCI6MTgsImlhdCI6MTY2Mjk2OTQ1NH0.kBBiBqLrbbrTW1k_OqML7apVtDKOZiGA767QoMgc2RE",
      "accessToken": "${SingleToneValue.instance.assesToken}"


    });
    Get.log("seller resp : ${response.body}");
    if(response.hasError){
      Get.log("seller resp : ${response.statusText!}");

      return Future.error(response.statusText!);
    }else{
      ServiceSellerModal serviceSellerModal=ServiceSellerModal.fromJson(response.body);
      Get.log("seller resp : ${response.body}");
      //Get.log("seller services ${}")
      return serviceSellerModal;

    }
    
  }

  /// seller profilr api

Future<SellerProfileModal> sellerProfileApi(var id)async{
  httpClient.timeout = const Duration(seconds: 100);

    var response=await post('p_services/users/view_seller_profile',{
      "sellerId":id,
    },
    headers: {
      "Accept": "application/json",

    //  "accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhbmlzaEBnbWFpbC5jb20iLCJpZCI6MTgsImlhdCI6MTY2Mjk2OTQ1NH0.kBBiBqLrbbrTW1k_OqML7apVtDKOZiGA767QoMgc2RE",

      "accessToken": "${SingleToneValue.instance.assesToken}"

    }
    );
    Get.log("sellerprofile resp : ${response.body}");
    if(response.hasError){
      return Future.error(response.statusText!);

    }else{
       SellerProfileModal sellerProfileModal= SellerProfileModal.fromJson(response.body);
       return sellerProfileModal;
    }
}

/// get user avalability

Future<GetAllUserAvalibility> getAlluserAvalabilityApi(var sellerId)async{
  httpClient.timeout = const Duration(seconds: 100);

  var response= await post('p_services/users/get_seller_availibity_time',{

  "seller_id":sellerId
},headers: {
  "Accept":"Application/json",
  "accessToken": "${SingleToneValue.instance.assesToken}"

});
Get.log("get all response avalability ${response.body}");
if(response.hasError){

  return Future.error(response.statusText!);
}else{
  GetAllUserAvalibility getAllUserAvalibility=GetAllUserAvalibility.fromJson(response.body);
  return getAllUserAvalibility;
}
}

/// get user plans

Future<GetPlanModal> getPalnApi()async{
    var response=await get("p_services/seller/get_plans",headers: {
      "Accept":"Application/json",
      "accessToken": "${SingleToneValue.instance.assesToken}"
    });
    Get.log("get planapi respnse:: ${response.body}");
    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      GetPlanModal getPlanModal=GetPlanModal.fromJson(response.body);
      return getPlanModal;

    }
}

/// my Appointments

Future<MyAppointmentModal>myAppointments()async{

    var response=await get("p_services/booking/user_booking",headers: {
      "Accept":"Application/json",
      "accessToken":"${SingleToneValue.instance.assesToken}"
    });
    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      MyAppointmentModal myAppointmentModal=MyAppointmentModal.fromJson(response.body);
      return myAppointmentModal;
    }
}


/// cancled bookin modal

Future<CanceldBookingModal>cancledBookingApi(var bookingid)async{
    var response=await post("p_services/booking/cancel_booking",{

      "booking_id":bookingid,
      "reason":"not avalable"
    },headers: {
      "Accept":"Application/json",
      "accessToken":"${SingleToneValue.instance.assesToken}"
    });
    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      CanceldBookingModal canceldBookingModal=CanceldBookingModal.fromJson(response.body);
      return canceldBookingModal;
    }
}

/// filter api

Future<FilterSelectModal>filterSellerApi(
    {String? distance, String? session, String? dat, String? rating, String? sortby})async{

  Map body={
    "distance":distance,
    "session":session,
    "date":dat,
    "rating":rating,
    "sortby":sortby,
   // "serviceId":serviceId
  };
  body.removeWhere((key, value)=>value=="");
  Get.log("Map Body is : $body");




  var response=await post("p_services/users/filter_sellers",body,headers: {
    "Accept":"Application/json",
    "accessToken":"${SingleToneValue.instance.assesToken}"
  });
  Get.log("jkddjkdjkd response sellet filter${response.body}");
  if(response.hasError){
    return Future.error(response.statusText!);
  }else{
    FilterSelectModal filterSelectModal=FilterSelectModal.fromJson(response.body);
    return filterSelectModal;
  }
}

}