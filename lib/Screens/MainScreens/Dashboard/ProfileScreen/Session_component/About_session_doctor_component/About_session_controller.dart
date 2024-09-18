import 'dart:convert';

import 'package:careaxes_patient/ApiService/Api_service.dart';
import 'package:careaxes_patient/Apicalls/Apis.dart';
import 'package:careaxes_patient/GetStorage/shared_prefs_service.dart';
import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/Session_component/session_invoice_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../ModelClass/about_session_doctor_model.dart';
import 'DatePicker.dart';

class AboutSessionController extends GetxController {
  SessionInvoiceController sessionInvoiceController = Get.put(
      SessionInvoiceController());
  int? specialityId = 0;
  int? doctorId = 0;

  AboutSessionController() {
    this.specialityId = sessionInvoiceController.SessionSpid;
    this.doctorId = sessionInvoiceController.SessionProviderId;
  }

  List<String> SessionDoctorDates = [];
  List<String> SessionDoctorTimes = [];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
     
     
     
     
    await GetSlotsForSessionDoctors();
  }

  ApiService apiService = ApiService.getInstance();
  List<AboutSessionDoctorModel> AboutSessionDoctorList = [];
  List<String> sessionDates = [];
  List<String> AvailableSlotTime = [];
  bool IsLoading=false;

  Future<void> GetSlotsForSessionDoctors() async {
    IsLoading=true;
    var response = await apiService.postRequest(Apis.SessionDoctorSlotsApi, {
      "chargeTypesId": 60,
      "consultationTypeId": sessionInvoiceController.TypeOfConsultation + 1,
      "fromDate": "2024-08-12",
      "locationId": 2,
      "offset": "+05:30",
      "patientId": 12364,
      "providerId": doctorId,
      "slotDate": "2024-08-12",
      "specializationId": specialityId,
      "timeZone": "India Standard Time",
      "toDate": "2024-12-07",
      "visitTypeId": 69
    });
IsLoading=false;
    if (response.statusCode == 200) {
      var responseBody = response.data;
       
      AboutSessionDoctorModel data = AboutSessionDoctorModel.fromJson(
          responseBody);

      if (data.status == "Success") {
        AboutSessionDoctorList.add(data);
         
        sessionDates = AboutSessionDoctorList
            .expand((each) => each.data?.map((dates) => dates.date) ?? [])
            .whereType<String>().toSet()
            .toList();

         
         
        update();
      }
    }
  }

  List<Slots> SlotsTimes = [];
  List<String?> foundTimes=[];
  List<Data>? foundData=[];
  String SelectedDate='';
  FilterDates(String Date) {
    SelectedDate=Date;
    foundData = AboutSessionDoctorList
        .expand((each) => each.data?.where((item) => item.date == Date) ?? []).cast<Data>()
        .toList();
print("found data is $foundData");
    foundTimes = foundData?.map((item) => item.time).toList() ?? [];
    update();
    print("FOund times are :: $foundTimes");
    print("Found times ln are ${foundTimes.length}");

  }
  List<Slots>? slots=[];
  FilterSlotsSelection(String PreferredSlots){
slots?.clear();
print("List is ${AboutSessionDoctorList}");
Iterable<Slots> filteredSlots = AboutSessionDoctorList
    .expand((each) => each.data ?? []) // Flatten the list of DataItem
    .where((item) => item.date == SelectedDate)
    .where((item) => item.time == PreferredSlots)
    .expand((item) => item.slots ?? []) // Flatten the list of slots
    .whereType<Slots>(); // Ensure all items are of type Slots

   slots=filteredSlots.toList();
       update();
    print("Slots are ${slots}");
    print("Slots length ${slots?.length}");
  }
  Future<void> selectedDate(BuildContext context) async {

    print("calender context is $context");
    final DateTime? picked = await showModalBottomSheet(
      context: context,
      builder: (context)=>DatePicker(

        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2060),
      ),
    );
    if (picked != null && picked != SelectedDate) {
      print("Date selected ${SelectedDate.toString()}");
      String formattedDate = "${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      print("Selected Date: $formattedDate");


      SelectedDate=formattedDate;
      update();
      FilterDates(SelectedDate);

    }


  }
  int SelectedTimeIndex = 0;
int? SlotCount=0;
int? tokenNumber=0;
String AppointmentTime='';
  selectedTime(int index) {
    SelectedTimeIndex = index;
    SlotCount=slots![index].slotCount;
    tokenNumber=slots![index].tokenNumber;
    AppointmentTime=slots![index].slotValue!;
    print("Slot count is $SlotCount");
    print("Token no is $tokenNumber");
    print("Index is ${SelectedTimeIndex}");
    print("Appointment time is $AppointmentTime");
    update();
  }

  Future<void>BookFreeSession()async{
    IsLoading=true;
final formData={
  "ProviderId":doctorId,
  "OccupationDetail":"",
  "AppointmentEndTime":"09:30",
  "Email":"",
  "ThumbnailUrl":"",
  "ConsultationTypeId":sessionInvoiceController.TypeOfConsultation + 1,
  "LoginLocationId":"",
  "AppointmentTime":AppointmentTime,
  "AppointmentTypeId":"null",
  "PatientDiscountInRupees":0.0,
  "AppointmentDiscountInRupees":0.0,
  "ChargeTypesId":60,
  "VisitTypeId":69,
  "UpdatePatient":false,
  "PatientId":SharedPrefsService().GetReferenceIdForPatient(),
  "DoctorSpecializationChargeModuleDetailsId":slots?[0].doctorSpecializationChargeModuleDetailsId,
  "PaymentStatus":false,
  "CountryId":1,
  "CreatedBy":SharedPrefsService().GetAccountIdForPatient(),
  "SpecializationId":specialityId,
  "PatientDiscountInPercentage":0.0,
  "AppointmentDate":SelectedDate,
  "Active":false,
  "LastName":"",
  "IsUnidentified":false,
  "CountryName":"",
  "AppointmentDiscountInPercentage":0.0,
  "SlotCount":SlotCount,
  "UMRNo":"",
  "Salutation":"",
  "PatientTotal":0,
  "ConvertAspatient":false,
  "IsEmergency":false,
  "Charges":0,
  "CountryCode":"",
  "TypeOfPayment":"FullPayment",
  "IsMobile":true,
  "AfterDiscount":10.0,
  "AadharNo":"",
  "Amount":10.0,
  "LocationId":2,
  "TotalAmount":10.0,
  "MiddleName":"",
  "ProfileImageUrl":"",
  "IsSalucroAppointment":false,
  "ProviderAvailabilityId":slots?[0].providerAvailabilityId,
  "FatherOrHusband":"",
  "AppointmentTotal":10.0,
  "Total":10.0,
  "FullName":"",
  "DepartmentId":0,
  "TokenNumber":tokenNumber,
  "LogFrom":4
};
    IsLoading=false;
var response=await ApiService.getInstance().PostFormData(Apis.BookingFreeAppointment, formData);
if(response.statusCode==200){

  print("Appointmnet booked successfully");
  Get.toNamed("/home");
}
else{
  print("Appointment not booked");
  Get.back();
}
update();
  }
}
