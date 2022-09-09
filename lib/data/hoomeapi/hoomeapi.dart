

import 'package:flutterapis/models/homeModel/homeModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomProviderApi extends GetConnect{


   var baseUrl = "https://backend.antrakdelivery.com/";


   ///
/// HoomeApi

Future<HomeModel>homeApi()async{
   httpClient.timeout = const Duration(seconds: 100);

   var response= await get('users/homepage',headers: {
   'Accept': 'application/json',
   //'accessToken': '${GetStorage().read("accessToken")}',
   'accessToken': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImludHV1aHVzc2FpbkBnbWFpbC5jb20iLCJpZCI6NDAwLCJpYXQiOjE2NTk0MTcxMjh9.tlAP6uL8Bh8YBacwQRaWskawALwp4VXoUn_XIYwCExM',
});
if(response.hasError){
   return Future.error(response.statusText!);
}
else{
   return HomeModel.fromJson(response.body);
}

}

}