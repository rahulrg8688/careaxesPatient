import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../../../../ApiService/Api_service.dart';
import '../../../../../Apicalls/Apis.dart';
import '../../../../../GetStorage/shared_prefs_service.dart';

class ChangePasswordController extends GetxController{
  TextEditingController password1=TextEditingController();
  ApiService apiService=ApiService.getInstance();
  TextEditingController password2=TextEditingController();
  String ErrMsg="";
  String SuccessMsg="";
bool IsTextAndCharform1=false;
bool IsTextAndCharform2=false;

  Future<void> changePasswordApi()async {
    print(password2.text);
    // print(StorageService.GetPatientAccountId());
    // print(StorageService.GetPatientMobileNo());
    if (password1.text == password2.text) {
      var response=await apiService.putRequest(Apis.ChangePasswordApi,{
        "accountId":SharedPrefsService().GetAccountIdForPatient(),
        "password":password2.text,"roleId":4,
        "userName":SharedPrefsService().GetMobileNumberForPatient(),
      });
      if(response.statusCode==200){
        SuccessMsg=response.data;
        print("success");
        Get.toNamed("/PhoneNumber");
      }
      else{
        ErrMsg=response.data;
        print("Failed");
      }
    }
    else{
      ErrMsg="password 1 and password 2 didnot match";
    }
  }

  textAndPasswordToggleForm1(){
    IsTextAndCharform1=!IsTextAndCharform1;
    update();
  }
  textAndPasswordToggleForm2(){
    IsTextAndCharform2=!IsTextAndCharform2;
    update();
  }
}