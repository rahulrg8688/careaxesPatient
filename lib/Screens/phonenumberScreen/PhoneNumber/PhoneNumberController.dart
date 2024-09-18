import 'dart:convert';

import 'package:careaxes_patient/Screens/phonenumberScreen/PhoneNumber/phonenumber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
// import 'package:patient_application/ApiService/Api_service.dart';
// import 'package:patient_application/GetStorage/HiveBox.dart';
// import 'package:patient_application/GetStorage/StorageService.dart';
// import 'package:patient_application/GetStorage/shared_prefs_service.dart';
// import 'package:patient_application/Screens/phonenumberScreen/PasswordLogin/PasswordController.dart';
// import 'package:patient_application/Screens/phonenumberScreen/PhoneNumber/phonenumber.dart';
// import 'package:patient_application/Screens/phonenumberScreen/VerifyOtp/VerifyOtpController.dart';

import '../../../ApiService/Api_service.dart';
import '../../../Apicalls/Apis.dart';

import '../../../GetStorage/HiveBox.dart';
import '../../../GetStorage/shared_prefs_service.dart';
import '../../../ModelClass/CheckUserList/checkUser.dart';
import '../../../ModelClass/OtpModel/Otp.dart';
import '../PasswordLogin/PasswordController.dart';
import '../VerifyOtp/VerifyOtpController.dart';
// import '../VerifyOtp/VerifyOtpScreen.dart';

class Phonenumbercontroller extends GetxController{
  bool GotResult=false;

  var ResponseErrormsg='';
  var otp='';
  int countryId=0;
  int accountId=0;
  int referenceId=0;
  bool IsLoading=false;
  String PatientName='';
  bool PasswordButton=false;
  TextEditingController phoneNumber=TextEditingController();
  GetStorage storage=GetStorage();
  ApiService apiService=ApiService.getInstance();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    SharedPrefsService().init();
  }
  void RemoveStates(){
    GotResult=false;
    otp='';
    IsLoading=false;
    phoneNumber.clear();
  }
  void EnteringNewMobileNum(){
    GotResult=false;
    PasswordButton=false;
    update();
  }
  String mobileno='';
  Future<void> MobileNumber() async{
    IsLoading=true;
    update();
    print("Device token getting from Storage is :: ${HiveBox().GetDeviceToken()}");
    var response=await apiService.putRequest(Apis.CheckUserApi,{
      "userName": "1:${phoneNumber.text}",
      "password" : "",
      "accountTypes" : ["Patient"],
      "deviceToken" :HiveBox().GetDeviceToken(),
      "deviceId":"",
      "description":"quick registration",
      "patientId":0,
      "accountId":0
    });
    if(response.statusCode==200){
      var res=checkUserList.fromJson(response.data);
      print(IsLoading);
      print(res.item1![0].accountId);
      IsLoading=false;
      GotResult=true;
      if(res.item1!=null) {
        countryId = res.item1![0].countryId ?? 0;
        referenceId = res.item1![0].referenceId ?? 0;
        print("patientId is : ${referenceId}");
        accountId = res.item1![0].accountId ?? 0;
        PatientName=(res.item1![0].fullName??'');
        print("Patient name value is :: ${PatientName}");
        print("Patient name value is :: ${PatientName}");
        SharedPrefsService().SetPatientName(res.item1![0].fullName??"");
        SharedPrefsService().setAccountIdForPatient(accountId);
        SharedPrefsService().setReferenceIdForPatient(referenceId);
        print("Shared :: ${SharedPrefsService().GetAccountIdForPatient()}");
        print("Shared :: ${SharedPrefsService().GetReferenceIdForPatient()}");
        storage.write('referenceId',referenceId);
        storage.write('accountId', accountId);
        mobileno=res.item1![0].mobile??'';
        SharedPrefsService().setMobileNumberForPatient(mobileno);

        //print("Shared :: ${SharedPrefsService().GetMobileNumberForPatient()}");
        //storage.write('mobileNo',mobileno);
        update();
      }
      if(res.item2!=null){
        PasswordButton=false;
        update();

      }
      if(res.item2==null){
        PasswordButton=true;
        update();
      }
    }
    else if (response.statusCode == 500) {
      Get.dialog(
        AlertDialog(
          title: Column(
            children: [
              Text("Something went wrong, please try again."),
              ElevatedButton(
                onPressed: () {
                  Get.back(); // Close the dialog
                },
                child: Text("Back"),
              ),
            ],
          ),
          content: Text("Something went wrong, please try again."),
        ),
      );
    }

    else{
      print(response.statusCode);
      print(response.requestOptions);
      throw Exception("Some thing went wrong");
    }

  }


  Future<void> SendOtp() async{

    var response=await apiService.postRequest(Apis.sendOtpApi,{
      "Username": "1:${phoneNumber.text}",
      "AccountTypes" : ["Patient"],
      "deviceToken" : HiveBox().GetDeviceToken(),
      "deviceId": "2",
      "deviceType":"IOS",
      "patientId":(referenceId),
      "accountId":(accountId),
      "CountryId":(countryId)
    });
    if(response.statusCode==200){
      var res=Otp.fromJson(response.data);
      Verifyotpcontroller verifyotpcontroller=Get.put(Verifyotpcontroller());
      verifyotpcontroller.Setotp(res.otp??"");
      Get.toNamed("/VerifyOtp")?.then((val){
        verifyotpcontroller.onInit();
      });
    }
    else{
      Get.defaultDialog(
          title: ("Alert"),
          middleText: "${response.data}",

          onCancel: (){
            Get.to(phonenumber());
          }
      );
      print("Response body : ${response.headers}");

      //print("Response body : ${response.reasonPhrase}");
      print("Res: ${response.data}");
      ResponseErrormsg=response.data;
      update();
      print("Response error : ${response.statusCode}");
    }
  }





  Future<void> LoginWithPassword() async{

    Passwordcontroller password=Get.put(Passwordcontroller());
    print("Checking Login method :: $referenceId");
    print("Checking Login accountId LL $accountId");
    password.SetMobileNumber(phoneNumber.text,referenceId,accountId);

    Get.toNamed("/passwordLogin")?.then((value){
      password.passwordValue.clear();
    });

  }
}
