
import 'package:get/get.dart';

import '../../models/products/products_modal.dart';
import '../../models/service_seller_modal/service_seller_modal.dart';

class FakeStoreProductsApi extends GetConnect{

  var baseUrl="https://zeeshannawaz.com/";

//loginToken="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbGx1QGdtYWlsLmNvbSIsImlkIjoxNiwiaWF0IjoxNjYyNzAzODkzfQ.19UgA_P_lQHOdWHnvvzOlPb7p7cOsFYGwSs2z-ldoxs";


  Future<Products> fakeProducts()async{
    httpClient.timeout = const Duration(seconds: 100);

    var response =await get("p_services/service/get_all_service", headers: {
      "access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbGx1QGdtYWlsLmNvbSIsImlkIjoxNiwiaWF0IjoxNjYyNzAzODkzfQ.19UgA_P_lQHOdWHnvvzOlPb7p7cOsFYGwSs2z-ldoxs",
    });


    if(response.hasError){
      return Future.error(response.statusText!);
    }else{
      Get.log("Product resp : ${response.body}");
      Products products=Products.fromJson(response.body);
      return products;
    }
  }


  Future<ServiceSellerModal>serviceSeller(var serviceid)async{
    
    var response=await post("p_services/users/service_sellers", {
      "serviceId":serviceid,
    }, headers: {
    'accessToken':"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhbmlzaEBnbWFpbC5jb20iLCJpZCI6MTgsImlhdCI6MTY2MjYyMDA2M30.0g_aNDeHa6VyCQGKwT7T3BBtarwjfxinEXw8wlTGwio",
    });
    if(response.hasError){
      Get.log("seller resp : ${response.statusText!}");

      return Future.error(response.statusText!);
    }else{
      ServiceSellerModal serviceSellerModal=ServiceSellerModal.fromJson(response.body);
      Get.log("seller resp : ${response.body}");
      return serviceSellerModal;
    }
    
  }

}