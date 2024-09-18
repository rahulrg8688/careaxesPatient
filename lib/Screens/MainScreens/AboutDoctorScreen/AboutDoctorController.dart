import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:careaxes_patient/Screens/MainScreens/ReviewAppointmentScreen/review_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../../ApiService/Api_service.dart';
import '../../../Apicalls/Apis.dart';
import '../../../GetStorage/shared_prefs_service.dart';
import '../../../ModelClass/AvailableDatesForDoctorModel.dart';

import '../../../ModelClass/AvailableTimeForDoctorModel.dart';
import '../../../ModelClass/DoctorsModel.dart';
import '../ReviewAppointmentScreen/appointment_success_page.dart';
import 'custom_date_picker.dart';

class Aboutdoctorcontroller extends GetxController {
  final ScrollController scrollController= ScrollController();
  int? SpecialityId = 0;
  int? DoctorId = 0;
  bool IsLoading = false;
  RxBool CalenderLoading = false.obs;
  String UserSelectedDate = '';
  bool IsTimeSelected = false;
  int SelectedTimeIndex = 0;
  String SelectedTime = '';
  String date = DateTime.now().toString();
  int DoctorSpecializationChargeModuleDetailsId = 0;
  int providerAvailabilityId = 0;
  int TokenNumber = 0;
  int DepartmentId = 0;
  double amountForConsultation = 0;
  Map<String, dynamic>? doctDetails = {};
  List<AvailableDates> DoctorAvailableDatesList = [];
  RxList<Map<String, dynamic>> AvailableDatesOnly =
      <Map<String, dynamic>>[].obs;
   final ReviewAppointmentController? reviewAppointmentController;
  Aboutdoctorcontroller({Map<String, dynamic>? DoctDetails,this.reviewAppointmentController
  }) {
    this.doctDetails = DoctDetails;
    print("Doctor details in home controller is $doctDetails");
    update();
  }
//   this.SpecialityId=this.SpecialityId;
//   this.DoctorId=this.DoctorId;
//
// }
  String ErrorMessage = '';
  int SlotCount=0;

  void setDoctorIdAndDoctorId(Map<String, dynamic> data) {
    this.doctDetails = data;
  }

  int ctr = 0;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
print("Scroll controller is about $scrollController");
    await DoctorAvailableDates();
    DoctorAvialableTimes();

  }

  List<AllDoctors> doctorabout = [];
  ApiService apiService = ApiService.getInstance();

//List<AvailableDates> DoctorAvailableDatesList=[];
  Future<void> DoctorAvailableDates(
      {String? StartDate, String? EndDate}) async {
    IsLoading = true;
    CalenderLoading.value = true;

    DateTime currentDate = DateTime.now();
    // String Date="${currentDate.year}-${currentDate.month}-${currentDate.day}";
    // String DateEnd="${currentDate.year}-${currentDate.month+1}-${currentDate.day}";
    DateTime startDate =
        DateTime(currentDate.year, currentDate.month, currentDate.day);
    DateTime endDate = DateTime(currentDate.year, currentDate.month + 1, 0);
    String startDateString =
        "${startDate.year}-${startDate.month}-${startDate.day}";
    String endDateString = "${endDate.year}-${endDate.month}-${endDate.day}";

    print("DoctorId is :: ${doctDetails}");
    print("Each id is ${doctDetails?['specialityId']}");
    // print("Date in available dates is :: ${date.toString()}");
    // print("Locations is :::::::: ${SharedPrefsService().GetPrefferedLocation()}");
    var response = await apiService
        .postRequest(Apis.SpecialityDcotors['DoctorAvailableDates']!, {
      "providerId": doctDetails?['DoctorId'],
      "providerLocationId": 0,
      "locationId": SharedPrefsService().GetPrefferedLocation(),
      "specializationId": doctDetails?['specialityId'],
      "startDate": StartDate ?? startDateString,
      "endDate": EndDate ?? endDateString,
      "consultationTypeId": 1
    });
    IsLoading=false;
    CalenderLoading.value = false;
    if (response.statusCode == 200) {
      AvailableDatesOnly.clear();

      update();
      var responseBody = response.data;
      print("response Body is : $responseBody");
      if (responseBody is List) {
        DoctorAvailableDatesList.clear();
        List<AvailableDates> doctrDatesList =
            responseBody.map((e) => AvailableDates.fromJson(e)).toList();
        DoctorAvailableDatesList.addAll(doctrDatesList);
      }
      if (DoctorAvailableDatesList.length > 0) {
        for (var i = 0; i < DoctorAvailableDatesList.length; i++) {
          DateTime? date = DateTime.tryParse(DoctorAvailableDatesList[i].date!);
          if (date != null) {
            AvailableDatesOnly.add({'Date': date, 'Day': getDayName(date.weekday), 'Index': i});
          }
        }

        date = AvailableDatesOnly[0]['Date'].toString();
        // print("Date in available is $date");
        update();
        if (ctr > 0) {
          await DoctorAvialableTimes(Date: date);
        }
      } else {
        // print("No Data");
        ErrorMessage = "No Data";
      }
    } else {
      print("Doctor Availability Dates Error :: ${response.statusCode}");
      print("Response Error is :: ${response.data}");
    }
  }

  int DatesClickedListIndex = -1;
  DatesClickedIndex(int index) {
    DatesClickedListIndex = index;
    update();
  }
  // void scrollToIndex(int index) {
  //
  //     if(index>0) {
  //       print("Index is $index");
  //       // Scroll to the selected index
  //       double itemWidth = 100 * 0.19; // Width of each item
  //       double margin = 10.0; // Margin ar
  //       double position = index *
  //           (80 + 10); // Assuming 80 is the width of the date card + margin
  //       scrollController.jumpTo(
  //         index*100.0,
  //       );
  //       update();
  //     }
  //
  //
  // }


  List<Slots> AvailableTimelist = [];

  Future<void> DoctorAvialableTimes({String? Date}) async {
    ctr++;
    update();
    DateTime currentDate = DateTime.now();
    // String date="${currentDate.year}-${currentDate.month}-${currentDate.day}";

    update();
    var patientId = SharedPrefsService().GetReferenceIdForPatient();
    print("Doctor details in slots is $doctDetails");
    // print("patient id s : $patientId");
    // print("checkig time date is :: $date");
    if(DoctorAvailableDatesList.isNotEmpty){
      var response = await apiService
          .postRequest(Apis.SpecialityDcotors['DoctorAvailableTime']!, {
        "chargeType": "payable",
        "chargeTypesId": 1,
        "consultationTypeId": 1,
        "fromDate": date,
        "isTelemedicine": false,
        "locationId": SharedPrefsService().GetPrefferedLocation(),
        "offset": "+05:30",
        "patientId": patientId,
        "providerId": doctDetails?['DoctorId'],
        "slotDate": date,
        "specializationId": doctDetails?['specialityId'],
        "timeZone": "India Standard Time",
        "toDate": date,
        "tokenNumber": TokenNumber,
        "type": "fromMobile",
        "visitType": "online appointment",
        "visitTypeId": 53
      });

      update();
      if (response.statusCode == 200) {
        var responsebody = response.data;
        print(responsebody);
        GetSlotsTimeForDoctors data =
        GetSlotsTimeForDoctors.fromJson(responsebody);
        print(data.status);
        print(data.data);
        if(data.status == "Success"&&data.data?.length==0){
          return  ;
        }
        else if( data.data!=[] &&data.data?[0].slots==null){
          return ;
        }
        else if (data.status == "Success"&&data.data!=[]) {
          AvailableTimelist.clear();
          if (data.data!=null) {
            DoctorSpecializationChargeModuleDetailsId = data
                .data![0].slots![0].doctorSpecializationChargeModuleDetailsId??0;
            providerAvailabilityId =
            data.data![0].slots![0].providerAvailabilityId!;
            for (var TimeSlots in data.data!) {
              // print('Date: ${TimeSlots.date}');

              if (TimeSlots.slots != null) {
                for (var slot in TimeSlots.slots!) {
                  // print('Slot: ${slot.slotName} at ${slot.slotValue}');
                  AvailableTimelist.add(slot);

                  update();
                }
              } else {
                // print('Message: ${TimeSlots.message}');
              }
            }
            // for (var items in AvailableTimelist) {
            //   print(items.slotName);
            //   print(items.availableDate);
            // }
            if (AvailableTimelist.isNotEmpty) {
              SlotsPerTime();
            } else {
              ErrorMessage = "No Time Slots Available";
            }
          } else {
            // print("No data");
          }
          update();
        }
      } else {
        print(
            "Failed to access the data with response code : ${response.statusCode}");
      }
      update();
    }
  }

  String getDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }

  Future<void> RescheduleAppointment() async {
print("Date is ${doctDetails?['Date']}");
print("Selected date is ${date}");
String selectedDate=date;
DateTime Date=DateTime.parse(selectedDate);
String isoDate=Date.toIso8601String();
print(isoDate);


print("Selecyed time is $SelectedTime");
    try{
      var response =
      await ApiService.getInstance().postRequest(Apis.RescheduleAppointment, {
        "ProviderAvailabilityId": doctDetails?['ProviderAvailabiityId'],
        "appointmentDate": isoDate,
        "appointmentId": doctDetails?['AppointmentId'],
        "appointmentNotes": "test",
        "appointmentTime": SelectedTime,
        "consultationTypeId": 1,
        "departmentId": DepartmentId,
        "appointmentEndTime": SelectedTime,
        "locationId": SharedPrefsService().GetPrefferedLocation(),
        "logFrom": 4,
        "modifiedBy": SharedPrefsService().GetAccountIdForPatient(),
        "providerId":doctDetails?['DoctorId'] ,
        "sessionId": 0,
        "slotCount":  0,
        "specializationId": doctDetails?['specialityId'],
        "tokenNumber": TokenNumber
      });
      if(response.statusCode==200){
        print("Appointment rescheduled successfully");
        Get.to(AppointmentSuccessPage());
        print(response.data);
      }
      else{
        print("Status code is ${response.statusCode}");
      }
    }
    catch(ex){
      print("Error occured $ex");
    }

  }

  TimeOfDay _time = new TimeOfDay.now();

  Future<void> selectedDate(BuildContext context) async {
    print("calender context is $context");
    final DateTime? picked = await showModalBottomSheet(
      context: context,
      builder: (context) => CustomDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2060),
        scrollController:scrollController
      ),
    );
    if (picked != null && picked != date) {
      print("Date selected ${date.toString()}");
      String formattedDate =
          "${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      print("Selected Date: $formattedDate");
      DatesClickedListIndex=-1;
      date = formattedDate;
      update();
      int index = AvailableDatesOnly.indexWhere(
              (element) => DateFormat('yyyy-MM-dd').format(element['Date']) == formattedDate);
      if (index != -1) {
        // Scroll to the selected date


        // Call to get available times for the selected date
        DoctorAvialableTimes(Date: date);

      }

    }
    //await DoctorAvailableDates();
  }

  selectDate(BuildContext context) {
    TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(2022, 12, 01),
      lastDay: DateTime(2035, 12, 01),
    );
  }

  GridAppointmentSessionClicked() {
    IsTimeSelected = !IsTimeSelected;
    update();
  }

  List<String> Sessions = ["Morning", "Afternoon", "Evening"];
  int index = 0;
  Click(int ind) {
    index = ind;
    // print("index selected is :: $index");
    SlotsPerTime();
    update();
  }

  List<String> TimeSlots = [];
  SlotsPerTime() {
    // print("Length of timelist is :: ${AvailableTimelist.length}");

    TimeSlots.clear();
    AvailableTimelist.forEach((e) {
      // print("slot is :: ${e?.slotValue}");
      final String timeStr = formatTime(e.slotValue!);
      final TimeOfDay time = TimeOfDay(
        hour: int.parse(timeStr.split(":")[0]),
        minute: int.parse(timeStr.split(":")[1]),
      );
      // print("Formatted Time: $timeStr");

      switch (index) {
        case 0:
          if (time.hour < 12) {
            TimeSlots.add(timeStr);
          }
          break;
        case 1:
          if (time.hour >= 12 && time.hour < 18) {
            TimeSlots.add(timeStr);
          }
          break;
        case 2:
          if (time.hour >= 18) {
            TimeSlots.add(timeStr);
          }
          break;
      }
    });

    update();
  }

  String formatTime(String timeOfDay) {
    final hour = int.parse(timeOfDay.split(":")[0]);
    final minute = int.parse(timeOfDay.split(":")[1]);
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  SlotTimes(int index) {
    SelectedTimeIndex = index;
    print("Selected time is in func is :: ${TimeSlots[index]}");
    SelectedTime = TimeSlots[index];
    print("Token number slots is :: ${AvailableTimelist[index].tokenNumber}");
    TokenNumber = AvailableTimelist[index].tokenNumber!;
    print("Slots count is ${AvailableTimelist[index].slotCount}");
    //SlotCount=AvailableTimelist[index].slotCount??0;
    update();
    amountForConsultation = AvailableTimelist[index].charge!;
    print("Amount for consulation is :: $amountForConsultation");
    print("Slotcount is $SlotCount");
    update();
  }

  NavigateToReviewScreen() {
    DepartmentId = doctDetails?['DepartmentId'];
    update();
    //ReviewAppointmentController(date: date,Time: SelectedTime,Spid:SpecialityId!,DoctId:DoctorId!);
    Get.toNamed("/ReviewAppointment");
  }

  @override
  void dispose() {
    this.IsLoading;
    this.AvailableDatesOnly;
    this;
    this.date;
    this.doctDetails = {};
    this.DoctorId;
    this.SpecialityId;
    Aboutdoctorcontroller;
    Get.delete<Aboutdoctorcontroller>();
    // TODO: implement dispose
    super.dispose();
  }
}
