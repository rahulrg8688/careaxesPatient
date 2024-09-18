import 'dart:ffi';
import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:careaxes_patient/Screens/MainScreens/AboutDoctorScreen/AboutDoctorController.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

///import 'package:get/get_connect/http/src/multipart/form_data.dart' as uuu;
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';


import '../../../../../ApiService/Api_service.dart';
import '../../../../../Apicalls/Apis.dart';
import '../../../../../GetStorage/HiveBox.dart';
import '../../../../../GetStorage/shared_prefs_service.dart';
import '../../../AboutDoctorScreen/custom_date_picker.dart';

class MyProfileController extends GetxController{
  TextEditingController Firstname=TextEditingController();

  TextEditingController Lastname=TextEditingController();
  TextEditingController MobileNumber=TextEditingController();
  TextEditingController EmailId=TextEditingController();
  TextEditingController Dob=TextEditingController();
  TextEditingController Age=TextEditingController();
  int selectedOption = 0;
  @override
  void onInit(){
    super.onInit();

    print("In profile controller ${ApiService.getInstance().hashCode}");


  }
  void updateGender(int value) {
    selectedOption = value;
    print("Selected option is $selectedOption");
    update();  // Trigger UI update
  }



  Future<void> ButtonClick() async{
    final dioClient = dio.Dio();
    print("Text is ${Firstname.text}");
    print("Text is ${Lastname.text}");
    // var dioForm=dio.FormData.fromMap({
    //   'patientId':12364,
    //   'firstName':Firstname.text,
    //   'fullName':Lastname.text,
    //   'mobile':8309484204,
    //   'countryId':1,
    //   'IsMobile':true,
    // });

// final response=await dioClient.post(
//     'https://uat.careaxes.net/uat-qa-api/api/patients/update',
//     data:dioForm,
//     options: Options(
//     headers: {
//       'Authorization':'Bearer ${HiveBox().getToken()}',
//     }
// )
// );
// if(response.statusCode==200){
//   print("Updated the profile");
//   Get.toNamed('/home');
// }
// else{
//   print("Error occunred");
//   print("response code is :: ${response.statusCode}");
//   print("response error is :: ${response.data}");
//   print("repnse error is :: > ${response.headers}");
//   print("response phrase ${response.toString()}");
// }
    final formData={
      'patientId':12364,
      'firstName':Firstname.text,
      'fullName':Lastname.text,
      'mobile':8309484204,
      'countryId':1,
      'IsMobile':true,


    };


    String Gender=selectedOption==1?"M":selectedOption==2?"F":'F';
//   var res=await
    var response=await  ApiService.getInstance().putRequest(Apis.PatientEditApi,{
      "age": Age.text,
      "countryid": 1,
      "dateofbirth": Dob.text,
      "email": EmailId.text,
      "firstName":Firstname.text ,
      "fullName": Firstname.text+" "+Lastname.text,
      "gender": Gender,
      "lastName": Lastname.text,
      "mobile": MobileNumber.text,
      "modifiedBy": SharedPrefsService().GetAccountIdForPatient(),
      "patientId": SharedPrefsService().GetReferenceIdForPatient(),
      "referralCode": ""
    },
    );
    if(response.statusCode==200){
      print("success ${response.data}");
      SharedPrefsService().SetPatientName(Firstname.text+" "+Lastname.text);
      Get.toNamed("/home")?.then((val){
        Firstname.clear();
        Lastname.clear();
        EmailId.clear();
        MobileNumber.clear();
        Age.clear();
        Dob.clear();

      });


    }
    else{
      print("Failure ${response.statusCode}");
      print("Fialure ${response.data}");
      print("Failure ${response.statusMessage}");
    }
    Firstname.clear();
    Lastname.clear();
    EmailId.clear();
    MobileNumber.clear();
    Age.clear();
    Dob.clear();

  }
  final ScrollController scrollController= ScrollController();
  Future<void> showCalendar(BuildContext context) async {
    DateTime currentYear = DateTime.now();
    DateTime startOfYear = DateTime(1997, 1, 1);
    DateTime endOfYear = DateTime(currentYear.year, 12, 31);

    final List<DateTime?>? selectedDates = await showModalBottomSheet<List<DateTime?>>(
      context: context,
      builder: (context) => CalendarDatePicker2(

        config: CalendarDatePicker2Config(
          firstDate: DateTime(1990),
          lastDate: endOfYear,
          calendarType: CalendarDatePicker2Type.single,
          selectableDayPredicate: (date) {
            return date.isAfter(startOfYear.subtract(Duration(days: 1))) && date.isBefore(endOfYear.add(Duration(days: 1)));
          }
        ),
        value: [],
        onValueChanged: (dates) {
          Navigator.pop(context, dates);
        },
      ),
    );

    if (selectedDates != null && selectedDates.isNotEmpty) {
print("Selectttted dates are ${selectedDates}");
print(selectedDates[0]?.toLocal());


        Dob.text = '${selectedDates[0]?.toLocal()}'.split(' ')[0];
        //DateTime(selectedDates[0])
        // var age=Dob.text-DateTime.now();
        // Format the date as needed
     update();
      print("Selected date: ${Dob.text}");
DateTime dob = DateTime.parse(Dob.text);
DateTime now=DateTime.now();
final difference=now.difference(dob).inDays;
final years=difference/365;
print("difference is ${difference}");
print("In years is ${years.round()}");
Age.text=years.round().toString();
update();
    }
  }
  // if (selectedDates != null && selectedDates.isNotEmpty) {
  //
  // Dob.text = '${selectedDates[0]?.toLocal()}'.split(' ')[0]; // Format the date as needed
  // update();
  // print("Selected date: ${Dob.text}");
  // }
  @override
  void onClose() {
    Firstname.dispose();
    Lastname.dispose();
    super.onClose();
  }

}