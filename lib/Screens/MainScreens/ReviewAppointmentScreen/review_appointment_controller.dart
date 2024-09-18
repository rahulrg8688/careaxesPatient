import 'dart:convert';

import 'package:careaxes_patient/Screens/MainScreens/ReviewAppointmentScreen/FailureScreen.dart';
import 'package:careaxes_patient/Screens/MainScreens/ReviewAppointmentScreen/appointment_success_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hypersdkflutter/hypersdkflutter.dart';
import 'package:intl/intl.dart';

import '../../../ApiService/Api_service.dart';
import '../../../Apicalls/Apis.dart';
import '../../../GetStorage/shared_prefs_service.dart';
import '../../../ModelClass/DoctorsModel.dart';
import '../AboutDoctorScreen/AboutDoctorController.dart';
import 'SuccessScreen.dart';

class ReviewAppointmentController extends GetxController {
  //Aboutdoctorcontroller AboutDoctor = Get.put(Aboutdoctorcontroller(reviewAppointmentController: Get.find<ReviewAppointmentController>()));
  Aboutdoctorcontroller AboutDoctor = Get.put(
    Aboutdoctorcontroller(

      reviewAppointmentController: Get.isRegistered<ReviewAppointmentController>() ? Get.find<ReviewAppointmentController>() : null,
    ),
  );


  late String date;
  late String Time;
  late int Spid;
  late int DoctId;
  late Map<String, dynamic> ReviewDoctor;
  late double consulationCharges;
  String ConvertedDate = '';

  ReviewAppointmentController() {
    this.date = AboutDoctor.date;
    this.Time = AboutDoctor.SelectedTime;
    this.Spid = AboutDoctor.doctDetails?['specialityId'];
    this.DoctId = AboutDoctor.doctDetails?['DoctorId'];
    this.ReviewDoctor = AboutDoctor.doctDetails!;
    this.consulationCharges=AboutDoctor.amountForConsultation;

    update();
  }
  int doctAvailabilityId = 0;
  int DoctorSpecializationModuleId = 0;
  int Token = 0;
  int DepartmentId = 0;
  bool IsLoading = false;
  var hyperSDK;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print("Review DOctor is $ReviewDoctor");

    doctAvailabilityId = AboutDoctor.providerAvailabilityId;
    DoctorSpecializationModuleId =
        AboutDoctor.DoctorSpecializationChargeModuleDetailsId;

    Token = AboutDoctor.TokenNumber;
    DepartmentId = AboutDoctor.DepartmentId;
    print("Token is $Token");
    print("Department is each $DepartmentId");
    print("DOctor Availability is :: $doctAvailabilityId");
    print("DoctorSpecilaizatio module isd is $DoctorSpecializationModuleId}");
    DateTime? datetime = DateTime.tryParse(date);
    print("Date is :: ${this.date}");

    ConvertedDate = DateFormat.yMMMEd().format(DateTime.parse(date));
    update();
  }

  Future<void> BookAppointment() async {
    IsLoading = true;
    update();

    // Create FormData map for appointment
    final formData = {
      'ProviderId': DoctId,
      'AppointmentEndTime': Time,
      'OccupationDetail': '',
      'Email': '',
      'ThumbnailUrl': '',
      'ConsultationTypeId': 1,
      'LoginLocationId': '',
      'AppointmentTime': Time,
      'AppointmentTypeId': '',
      'PatientDiscountInRupees': 0.0,
      'AppointmentDiscountInRupees': 0.0,
      'ChargeTypesId': 1,
      'VisitTypeId': 8,
      'UpdatePatient': false,
      'PatientId': SharedPrefsService().GetReferenceIdForPatient(),
      'DoctorSpecializationChargeModuleDetailsId': DoctorSpecializationModuleId,
      'PaymentStatus': false,
      'CountryId': 1,
      'CreatedBy': SharedPrefsService().GetAccountIdForPatient(),
      'SpecializationId': Spid,
      'PatientDiscountInPercentage': 0.0,
      'AppointmentDate': date,
      'Active': false,
      'LastName': '',
      'IsUnidentified': false,
      'AppointmentDiscountInPercentage': 0.0,
      'UMRNo': '',
      'Salutation': '',
      'PatientTotal': 0.0,
      'ConvertAspatient': false,
      'IsEmergency': false,
      'Charges': 0.0,
      'CountryCode': '',
      'TypeOfPayment': 'FullPayment',
      'IsMobile': true,
      'AfterDiscount': 0,
      'AadharNo': '',
      'Amount': 0.0,
      'LocationId': SharedPrefsService().GetPrefferedLocation(),
      'TotalAmount': 0.0,
      'MiddleName': '',
      'ProfileImageUrl': '',
      'IsSalucroAppointment': false,
      'ProviderAvailabilityId': doctAvailabilityId,
      'FatherOrHusband': '',
      'AppointmentTotal': '',
      'Total': 0.0,
      'FullName': '',
      'DepartmentId': DepartmentId,
      'TokenNumber': Token,
      'LogFrom': 4
    };

    try {
      ApiService.getInstance().defaultHeaders(
        {
          'LocationId': SharedPrefsService().GetPrefferedLocation(),
        }
      );
      // Send the POST request with FormData
      var response = await ApiService.getInstance().PostFormData(Apis.BookingFreeAppointment, formData);

      // Update loading state

      IsLoading = false;
      update();

      // Handle response based on status code
      if (response.statusCode == 200) {
        print("Appointment booked successfully");
        Get.to(AppointmentSuccessPage());
      } else {
        print("Appointment not booked");
        Get.back();
      }
    } catch (e) {
      // Handle exceptions and provide feedback
      IsLoading = false;
      update();
      print("Error occurred: $e");
      Get.back();  // Optional: Navigate back in case of error
    }
  }
String PaymentResponse="";
Future<void> PaymentBookAppointment() async{
  hyperSDK = HyperSDK();

    var jsonData = {

      "afterDiscount": consulationCharges,
      "amount": consulationCharges,
      "appCharges": 0,
      "appointmentDate": date,
      "appointmentEndTime": Time,
      "appointmentId": 0,
      "appointmentTime": Time,
      "appointmentTypeId": 3,
      "charges": 0,
      "chargeType": "",
      "chargeTypesId": 1,
      "consultationTypeId": 1,
      "createdBy": SharedPrefsService().GetAccountIdForPatient(),
      "discount": 0,
      "doctorSpecializationChargeModuleDetailsId": DoctorSpecializationModuleId,
      "locationId": SharedPrefsService().GetPrefferedLocation(),
      "logFrom": 4,
      "patientId": SharedPrefsService().GetReferenceIdForPatient(),
      "patientTotal": 0,
      "patientType": "O",
      "paymentType": "F",
      "payTypeId": 45,
      "providerAvailabilityId": doctAvailabilityId,
      "providerId": DoctId,
      "providerLocationId": 0,
      "slotCount": 0,
      "specializationId": Spid,
      "tokenNumber": Token,
      "total": consulationCharges,
      "totalAmount": consulationCharges,
      "visitType": "",
      "visitTypeId": 53,
      "walletAmount": 0
    };
    final formData={
      'json':jsonEncode(jsonData),
      'type':'Appointment',
      'mode':'Payment',
      'isMobile':true,
      'updatePatient':false
    };
    try{

      var response=await ApiService.getInstance().PostFormData(Apis.PaymentInitializationApi,formData);

      IsLoading = false;
      update();
      print("Response status is ${response.statusCode}");
      // Handle response based on status code
      if (response.statusCode == 200) {
        print("response data is :: ${(response.data)}");

        PaymentResponse=response.data;
        initiateHyperSDK();


        update();
      }
      else{
        print("Response status code is ${response.statusCode}");
      }
    }
    catch(ex){
      print("Exception occured while in $ex");
      print("response ");
      throw ex;

  }
}
bool PaymentLoading=false;
  void initiateHyperSDK() async {
  PaymentLoading=true;
  update();
  print("payment response in $PaymentResponse");
  bool isInitialized=!await hyperSDK.isInitialised();
  print("Initialized is $isInitialized");
  if(isInitialized==false){
    hyperSDK=HyperSDK();
    isInitialized=await hyperSDK.isInitialised();
  }
  print("Is Initialzed $isInitialized");
    // Check whether hyperSDK is already initialised
    if (isInitialized) {
      // Getting initiate payload
      // block:start:get-initiate-payload
      var initiatePayload = jsonDecode(PaymentResponse);
      Map<String,dynamic> data=initiatePayload;
  print("Initiate payload $initiatePayload");

      // block:end:get-initiate-payload

      // Calling initiate on hyperSDK instance to boot up payment engine.
      // block:start:initiate-sdk
      var responsedata=await hyperSDK.initiate(data, initiateCallbackHandler);
      print("responsed data is $responsedata");
      // block:end:initiate-sdk
      PaymentLoading=false;
    if(responsedata=="true"){
      callProcess(data);
    }
    }
  }
  void callProcess(Map<String,dynamic> data) async {
    //processCalled = true;
    print("data in call process is $data");
    //var processPayload = await makeApiCall(10);
    // Get process payload from backend
    // block:start:fetch-process-payload
    var processPayload =  data;
    print("Process payload is $processPayload");
    // block:end:fetch-process-payload

    // Calling process on hyperSDK to open the Hypercheckout screen
    // block:start:process-sdk
    var res=await hyperSDK.process(data, hyperSDKCallbackHandler);
    // block:end:process-sdk
    print("response is ${res}");
  }
  bool showLoader=true;
  void initiateCallbackHandler(MethodCall methodCall) {
    if (methodCall.method == "initiate_result") {
      // check initiate result
    }
  }
  void hyperSDKCallbackHandler(MethodCall methodCall) {
    switch (methodCall.method) {
      case "hide_loader":

          showLoader = false;

        break;
      case "process_result":
        var args = {};

        try {
          args = json.decode(methodCall.arguments);
        } catch (e) {
          print(e);
        }

        var error = args["error"] ?? false;

        var innerPayload = args["payload"] ?? {};

        var status = innerPayload["status"] ?? " ";
        var pi = innerPayload["paymentInstrument"] ?? " ";
        var pig = innerPayload["paymentInstrumentGroup"] ?? " ";

        if (!error) {
          switch (status) {
            case "charged":
              {
                // block:start:check-order-status
                // Successful Transaction
                // check order status via S2S API
                // block:end:check-order-status
                Get.to(AppointmentSuccessPage());
              }
              break;
            case "cod_initiated":
              {
                // User opted for cash on delivery option displayed on the Hypercheckout screen
                Get.to(AppointmentSuccessPage());
              }
              break;
          }
        } else {
          var errorCode = args["errorCode"] ?? " ";
          var errorMessage = args["errorMessage"] ?? " ";

          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   Navigator.pushReplacement(context,
          //       MaterialPageRoute(builder: (context) => const SuccessScreen()));
          // });
          switch (status) {
            case "backpressed":
              {
                // user back-pressed from PP without initiating any txn
                Get.to(FailedScreen());
              }
              break;
            case "user_aborted":
              {
                // user initiated a txn and pressed back
                // check order status via S2S API
                Get.to(FailedScreen());
              }
              break;
            case "pending_vbv":
              {
                Get.to(FailedScreen());
              }
              break;
            case "authorizing":
              {
                // txn in pending state
                // check order status via S2S API
                Get.to(FailedScreen());
              }
              break;
            case "authorization_failed":
              {
                Get.to(FailedScreen());
              }
              break;
            case "authentication_failed":
              {
                Get.to(FailedScreen());
              }
              break;
            case "api_failure":
              {
                // txn failed
                // check order status via S2S API
                Get.to(FailedScreen());
              }
              break;
            case "new":
              {
                // order created but txn failed
                // check order status via S2S API
                Get.to(FailedScreen());
              }
              break;
            default:
              {
                Get.to(FailedScreen());
              }
          }
        }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose of review appoinment $this");
    this;
  }
}
