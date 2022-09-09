
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutterapis/models/products/products_modal.dart';
import 'package:flutterapis/models/service_seller_modal/service_seller_modal.dart';
import 'package:get/get.dart';

import '../../data/fake_store_api/fake_store_api.dart';
import '../../data/fake_store_api/fake_store_api.dart';
import '../../ui/details_page/details_page.dart';
import '../../widgets/toasts.dart';

class FakeStoreController extends GetxController {

  final fackStoreApi=FakeStoreProductsApi();
  RxBool isLoaded=false.obs;
  RxBool isSellersLoaded=false.obs;

  Products products=Products();
  ServiceSellerModal serviceSellerModal=ServiceSellerModal();
  fackStoreData()async{
    Get.log("hello");
    await fackStoreApi.fakeProducts().then((value) {
     // Get.log("${value.toList()}");


        if(value.status==true){
          CustomToast.successToast(msg: "success");
          products=value;
          isLoaded.value=!isLoaded.value;
          update();
        }else{

          CustomToast.failToast(msg: "fail");

        }

      } );

  }

  serviceStoreFunction(var serviceID)async{
    await fackStoreApi.serviceSeller(serviceID).then((value) {

      if(value.status=="1"){
      //  change(value,status: RxStatus.success());
        CustomToast.successToast(msg: "${value.message}");
serviceSellerModal=value;
Get.log("servicesmodal 123 ${serviceSellerModal}");
        isSellersLoaded.value=!isSellersLoaded.value;
update();
Get.to(()=>DetailsPage());
      }else{
        CustomToast.failToast(msg: "error ${value.errors}");
      }
    });

  }



}

///
