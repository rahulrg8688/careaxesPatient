import 'dart:async';

import 'package:careaxes_patient/Apicalls/Apis.dart';
import 'package:get/get.dart';


import '../../../../../ApiService/Api_service.dart';
import '../../../../../GetStorage/shared_prefs_service.dart';
import '../../../../../ModelClass/GetDoctorBookings.dart';
import '../../HomeScreen/homeController.dart';
import '../../web_view_screen.dart';

class AppointmentController extends GetxController{

  homeController homecontroller=Get.put(homeController());
  List<GetDoctorBookings> AppointmentDoctors=[];
  bool IsLoading=false;
  ApiService apiService=ApiService.getInstance();
  Timer? _timer;
  @override
  void onInit() {
    GetAppointmentDoctors();
   // _startPeriodicUpdate();
    // TODO: implement onInit
    super.onInit();
  }
  // void _startPeriodicUpdate() {
  //   // Call GetAppointmentDoctors every 5 seconds
  //   _timer = Timer.periodic(Duration(seconds: 3), (timer) {
  //     GetAppointmentDoctors();
  //   });
  // }

  Future<void> GetAppointmentDoctors() async{
    IsLoading=true;
    AppointmentDoctors=await homecontroller.GetBookingsDoctors();
    print("Appointmnet length is : ${AppointmentDoctors.length}");

    IsLoading=false;
    update();
  }
List<String> RecentAndScheduledText=["Scheduled","Cancelled"];
  int indexOfScheduledAndRecentText=0;
  GetDataBasedOnIndex() async{
    IsLoading=true;
    if(indexOfScheduledAndRecentText==1){
      AppointmentDoctors=await homecontroller.GetBookingsDoctors(value: 1);
    }
    else{
      AppointmentDoctors=await homecontroller.GetBookingsDoctors();
    }
    IsLoading=false;
    update();
  }
  Click(int ind){
    indexOfScheduledAndRecentText=ind;
    AppointmentDoctors=[];
    update();
    print("Index of scheduled and recent Text is ${indexOfScheduledAndRecentText}");
    GetDataBasedOnIndex();

  }
  bool CancelLoading=false;
  Future<void> CancelAppointment(GetDoctorBookings AppointmentDetails) async{
    CancelLoading=true;
    update();
    var response=await apiService.putRequest(Apis.CancelAppointment,
      {
        "afterDiscount": AppointmentDetails.afterDiscount,
        "amount": 1500,//AppointmentDetails.amount,
        "appCharges": AppointmentDetails.appCharges,
        "appointmentDate": AppointmentDetails.appointmentDate,
        "appointmentEndTime":AppointmentDetails.appointmentEndTime,
        "appointmentId": AppointmentDetails.appointmentId,
        "appointmentNo": AppointmentDetails.appointmentNo,
        "appointmentStatusId": AppointmentDetails.appointmentStatusId,
        "appointmentTime": AppointmentDetails.appointmentTime,
        "appointmentTimeString": AppointmentDetails.appointmentTimeString,
        "appointmentTotal": AppointmentDetails.appointmentTotal,
        "cancelType": AppointmentDetails.isHdfcAppt==true?"CAppC":"CApp".toString(),
        "chargeTypesId": AppointmentDetails.chargeTypesId,
        "consultationTypeId": AppointmentDetails.consultationTypeId,
        "createdBy": AppointmentDetails.createdBy,
        "createdDate": AppointmentDetails.createdDate,
        "currencySymbol": "₹",
        "departmentName": AppointmentDetails.departmentName,
        "discount": AppointmentDetails.discount,
        "domain": AppointmentDetails.domain,
        "encryptedappointmentid": AppointmentDetails.encryptedAppointmentId,
        "encryptedpatientid": AppointmentDetails.encryptedPatientId,
        "encryptedproviderid": AppointmentDetails.encryptedProviderId,
        "active": AppointmentDetails.active,
        "enablemobileaudiocall": AppointmentDetails.enableMobileAudioCall,
        "isexpired": false,
        "isfollowupcompleted": false,
        "ishdfcappt": true,
        "isfulltranscript": false,
        "isonline": true,
        "isprescription": false,
        "isweb": false,
        "languages": "english,telugu,hindi",
        "locationid": AppointmentDetails.locationId,
        "logfrom": 0,
        "modifiedby": AppointmentDetails.patientAccountId,
        "patientaccountid": AppointmentDetails.patientAccountId,
        "patientage": AppointmentDetails.patientAge,
        "patientcountrycode": "91",
        "patientcountryid": 1,
        "patientemail": AppointmentDetails.patientEmail,
        "patientGender": AppointmentDetails.patientGender,
        "patientGuid": AppointmentDetails.patientGuid,
        "patientId": AppointmentDetails.patientId,
        "patientMobile": AppointmentDetails.patientMobile,
        "patientName": AppointmentDetails.patientName,
        "patientPaymentStatus":AppointmentDetails.patientPaymentStatus,
        "patientThumbnailUrl": "UAT/8e868928-61cd-4978-a6da-534cebdd9095/ProfileImage/kaatu paven_638562063082262043.jpg",
        "patientType": "O",
        "payTypeId": 45,//AppointmentDetails.payTypeId,
        "paymentStatus": AppointmentDetails.paymentStatus,
        "practiceName": AppointmentDetails.practiceName,
        "providerAccountId": AppointmentDetails.providerAccountId,
        "providerAvailabilityId": AppointmentDetails.providerAvailabilityId,
        "providerCountryId": AppointmentDetails.providerCountryId,
        "providerGender": AppointmentDetails.providerGender,
        "providerGuid": AppointmentDetails.providerGuid,
        "providerId": AppointmentDetails.providerId,
        "providerLocation": AppointmentDetails.providerLocation,
        "providerLocationId": AppointmentDetails.providerLocationId,
        "providerName": AppointmentDetails.providerName,
        "providerThumbnailUrl": "UAT/9a96780a-9494-4276-affd-afa6b1bbd6f0/ProfileImage/asma sajid_638192344632986931.jpg",
        "queueStatus": AppointmentDetails.queueStatus,
        "queueStatusId": AppointmentDetails.queueStatusId,
        "reason": "",
        "roomName": AppointmentDetails.roomName,
        "specializationId": AppointmentDetails.specializationId,
        "specializationName": AppointmentDetails.specializationName,
        "status": AppointmentDetails.status,
        "StatusCode": 0,
        "statusName": AppointmentDetails.statusName,
        "tokenNumber": AppointmentDetails.tokenNumber,
        "total": AppointmentDetails.total,
        "totalItems": AppointmentDetails.totalItems,
        "visitTypeId": AppointmentDetails.visitTypeId,
        "walletAmount": 0

    });
    CancelLoading=false;
    update();
    if(response.statusCode==200){
      print("Success data is ${response.data}");
    }
    else{
      print("Response is :: ${response.statusCode}");
      print("Response data Error is ${response.data}");

    }
    
  }
  onNavigateToWebView(String AppointmentEncryptedId,{bool? ReceiptId,String? Key}){
    Get.to(()=>WebViewScreen(Path:'appointment-invoice',Id: AppointmentEncryptedId,IsActive: ReceiptId,Key:Key));
  }



}