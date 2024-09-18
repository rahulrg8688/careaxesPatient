import 'dart:async';
import 'package:careaxes_patient/ApiService/Api_service.dart';
import 'package:careaxes_patient/GetStorage/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Apicalls/Apis.dart';
import '../../../GetStorage/HiveBox.dart';
import '../../../ModelClass/PatientAuthenticate/patientauthenticate.dart';
import '../PhoneNumber/PhoneNumberController.dart';

class Verifyotpcontroller extends GetxController {
  var otp = ''.obs;
  var Otpuser = ''.obs;
  var isLoading = false.obs;
  var OtpErr = ''.obs;


  Phonenumbercontroller phonenumbercontroller = Get.put(Phonenumbercontroller());
  TextEditingController Otp1 = TextEditingController();
  TextEditingController Otp2 = TextEditingController();
  TextEditingController Otp3 = TextEditingController();
  TextEditingController Otp4 = TextEditingController();

  ApiService apiService = ApiService.getInstance();
  PatientAuthenticate patient = PatientAuthenticate();

  Timer? timer; // Use a nullable Timer
  int duration = 180;

  // Convert OTP from text fields to a single value
  String ConvertOtp() {
    Otpuser.value = Otp1.text + Otp2.text + Otp3.text + Otp4.text;
    return Otpuser.value;
  }

  // Set OTP value
  void Setotp(String Otp) {
    otp.value = Otp;
  }

  // Compare OTP values
  Future<void> CompareOtpsValues() async {
    var response = await apiService.postRequest(Apis.CompareOtp, {
      "accountId": SharedPrefsService().GetAccountIdForPatient(),
      "accountTypes": ["Patient"],
      "deviceType": "Android",
      "deviceToken": HiveBox().GetDeviceToken(),
      "description": "samsung",
      "deviceId": ""
    });

    if (response.statusCode == 200) {
      print("response data is ${response.data}");
      patient = PatientAuthenticate.fromJson(response.data);
      await HiveBox().StoreToken(patient.token!.split(' ')[1]);
      await HiveBox().StoreReferenceToken(patient.referenceToken);

      if (SharedPrefsService().GetPatientName() == "") {
        Get.toNamed("/MyprofileUpdate");
      } else {
        Get.toNamed("/home");
      }
    } else {
      print("response error is $response");
    }
  }

  // Compare OTP when the user submits
  void CompareOtp(BuildContext context) {
    isLoading.value = true;
    OtpErr.value = '';
    update();

    String UserOtp = ConvertOtp();

    if (duration > 0) {
      if (UserOtp == otp.value) {
        CompareOtpsValues();
      } else {
        handleOtpError(context, "Wrong verification code");
      }
    } else {
      handleOtpError(context, "Otp Expired");
    }
  }

  // Handle OTP input errors
  void handleOtpError(BuildContext context, String errorMessage) {
    isLoading.value = false;
    OtpErr.value = errorMessage;

    Timer(Duration(seconds: 2), () {
      OtpErr.value = '';
    });

    Otp1.clear();
    Otp2.clear();
    Otp3.clear();
    Otp4.clear();
    FocusScope.of(context).unfocus();
    update();
  }

  // Send OTP again and restart the timer
  Future<void> SendOtp() async {
    stopTimer(); // Stop existing timer
    resetOtpFields();
    OtpErr.value = '';

    await startTimer(); // Restart the timer
    await phonenumbercontroller.SendOtp();
  }

  // Reset OTP fields
  void resetOtpFields() {
    Otp1.clear();
    Otp2.clear();
    Otp3.clear();
    Otp4.clear();
  }

  @override
  void onInit() {
    super.onInit();
    resetOtpFields();
    otp.value = '';
    duration = 180;
    startTimer(); // Start timer on initialization
  }

  // Start the timer
  Future<void> startTimer() async {
    stopTimer(); // Cancel any existing timer

    duration = 180; // Reset the duration to 180 seconds
    const oneSec = Duration(seconds: 1); // Set interval to 1 second

    timer = Timer.periodic(oneSec, (Timer t) {
      if (duration == 0) {
        t.cancel();
      } else {
        duration--;
        update(); // Refresh the UI
      }
    });
  }

  // Stop the timer
  void stopTimer() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
  }

  // Get the timer text in minutes:seconds format
  String get timerText {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    return "${minutes}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    stopTimer();
    resetOtpFields();
    duration = 180;
    otp.value = '';
    OtpErr.value = '';
    super.dispose();
  }
}
