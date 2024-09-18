import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../ApiService/Api_service.dart';
import '../../../Apicalls/Apis.dart';
import '../../../GetStorage/HiveBox.dart';
import '../../../GetStorage/shared_prefs_service.dart';
import '../../../ModelClass/PatientAuthenticate/patientauthenticate.dart';




class Passwordcontroller extends GetxController{
  bool togglepassword=false;
  var mobileNumber='';
  int referenceId=0;
  int AccountId=0;
  bool IsTapped=false;
  bool GotResult=false;
  TextEditingController passwordValue=TextEditingController();
  final GetStorage storage=GetStorage();
  void SetMobileNumber(String mobile,int referenceId,int Account){
    mobileNumber=mobile;
    this.referenceId=referenceId;
    this.AccountId=Account;
  }
  String? deviceId='';
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    deviceId = await _getId();
    passwordValue.clear();
    print("device Id is $deviceId");
    resetStates();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    print("Called dispose in password");
    passwordValue.clear();
    Get.delete<Passwordcontroller>();
    Get.deleteAll();
    super.dispose();
    togglepassword=false;
    mobileNumber='';
    referenceId=0;
    AccountId=0;
    IsTapped=false;
    GotResult=false;

  }
  void  resetStates(){
    togglepassword=false;
    mobileNumber='';
    passwordValue.clear();
    IsTapped=false;
    GotResult=false;
    update();
  }

  void passwordChange()
  {
    togglepassword=!togglepassword;
    update();

  }

  void IsTappedChange(){
    IsTapped=true;
    update();
  }


  ApiService apiService=ApiService.getInstance();
  PatientAuthenticate patient=PatientAuthenticate();

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
  }
  @override
  void onClose() {
    // Clear data when the screen is closed
    Get.delete<Passwordcontroller>();
    passwordValue.clear();
    super.onClose();
  }

  Future<void> PasswordLogin() async {
    print("patientId $referenceId");
    print("Device token from password login screen is  ::: ${HiveBox().GetDeviceToken()}");

    try {
     var response = await apiService.postRequest(Apis.LoginApi, {
        "accountId": AccountId,
        "accountTypes": ["Patient"],
        "description": "samsung - SM-G990B2 - 14",
        "deviceId": deviceId,
        "deviceToken": HiveBox().GetDeviceToken(),
        "deviceType": "Android",
        "locationId": 0,
        "password": passwordValue.text,
        "patientId": referenceId,
        "username": "1:${mobileNumber}"
      });
      print("response is ${response}");
      if (response.statusCode == 200) {
        GotResult = true;
        patient = PatientAuthenticate.fromJson(response.data);
        print("patient session is :: ${patient.sessionId}");
        print(patient.token!.split(' ')[1]);

        await HiveBox().StoreToken(patient.token!.split(' ')[1]);
        print("Hive token is :: ${HiveBox().getToken()}");
        print("patient token is :: ${patient.token}");

        print(patient.referenceToken);
        await HiveBox().StoreReferenceToken(patient.referenceToken);

        resetStates();

        if (SharedPrefsService().GetPatientName() == "") {
          print("Navigating to MyProfileUpdate");
          Get.toNamed("/MyprofileUpdate");
        } else {
          Get.toNamed("/home");
        }
      } else if (response!.statusCode == 400) {
        print("Handling error response");

        // Showing the dialog with custom handling for back button and cancellation
        Get.defaultDialog(
          title: ("Alert"),
          middleText: "Incorrect Password",
          onCancel: () {
            // This will handle explicit dialog cancellation
            Get.toNamed("/passwordLogin");
             // Close the dialog
            // You can navigate elsewhere if needed
            // Get.toNamed("/PhoneNumber");
          },
          // onWillPop: () async {
          //   // This handles the physical back button
          //   if (Get.isDialogOpen == true) {
          //     Get.back(); // Close the dialog if it's open
          //     return false; // Prevent further navigation
          //   }
          //   return true; // Allow navigation if no dialog is open
          // },
        );
      }
      else{
        Get.defaultDialog(
          title:"Alert",
          middleText: "Some thing went wrong",
          onCancel: () {
            // This will handle explicit dialog cancellation
            Get.toNamed("/passwordLogin");
            // Close the dialog
            // You can navigate elsewhere if needed
            // Get.toNamed("/PhoneNumber");
          },
        );
      }
    } catch (ex) {
      print("Caught an exception");


      // Handling the error response and showing a dialog
      Get.defaultDialog(
        title: ("Alert"),
        middleText: "Invalid password",
        onCancel: () {
          // Handle explicit cancellation (like clicking cancel button)
          Get.toNamed("/passwordLogin"); // Close the dialog
        },

      );

      passwordValue.clear();
      update();
    }
  }

}






