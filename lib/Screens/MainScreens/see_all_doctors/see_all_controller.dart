import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:get/get.dart';

import '../../../ApiService/Api_service.dart';
import '../../../Apicalls/Apis.dart';
import '../../../ModelClass/DoctorsModel.dart';
import '../../../ModelClass/GetSpeciality.dart';
import '../../../ModelClass/search_doctors_modelList.dart';
import '../Dashboard/HomeScreen/homeController.dart';

class SeeAllController extends GetxController{
  late homeController homecontroller=
  homecontroller=Get.find<homeController>();
  bool IsSpecialityClicked=false;
  ApiService apiService=ApiService.getInstance();
  int SpecialityId=0;
  homeController obj1=Get.put(homeController());
  var DoctorNameSearched=TextEditingController();
  ScrollController scrollController=ScrollController();
  List<AllDoctors> doctorList=[];
  List<AllDoctors> AllDoctorsList=[];
  List<dynamic> AllSpeciality=[];
  List<AllDoctors> doctorsWithOutSpeciality=[];
  int selectedSpecialityIndexGrid=-1;
  List<SearchedDoctorsModel> SearchedDoctor=[] ;
  int pageIndex=2;
  int selectedLocation=0;
  bool IsSeeAllSpecialityClicked=false;
  bool IsLoading=false;
  bool IsVisible=false;
  int OnlineOffline=0;
  int AppointmentIndex=0;
  @override
  void onInit() async{
    selectedLocation=homecontroller.selectedLocation.value;
    OnlineOffline=homecontroller.OfflineOnline;
    print("Selected Location is : $selectedLocation");
    fetchDoctors(1);

    AllSpeciality=await homecontroller.Specialities;
    //AllSpeciality=await homecontroller.GetSpecialitiesOfDoctors();
//AllDoctorsList=await homecontroller.GetAllDoctors();
    //print("All doctors List length is :${AllDoctorsList.length}");
    // print("All speculaity list length is : ${AllSpeciality.length}");
    // print("Speciality of each is : ${AllSpeciality[0]['specialityId']}");

    scrollController.addListener((){

      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        _getMoreDoctors();
      }
    });
    // TODO: implement onInit
    super.onInit();
  }

  void SetSpeciality(int val){
    SpecialityId=val;
    update();
  }

  void SelectedSpeciality(int val){
    selectedSpecialityIndexGrid=val;
    update();
  }
  void filterDoctors() {
    if (SpecialityId== 0) {
      //print("DOctors speciality is ${doctorList.length}");
      doctorsWithOutSpeciality = doctorList;
      update();
      //print("Specuality Id is zero doctor list vlue is :: $doctorsWithOutSpeciality");
    } else {
      doctorsWithOutSpeciality= doctorList.where((doctor) => doctor.specializationId == SpecialityId).toList();
      //print("Specuality Id is some doctor list vlue is :: $doctorsWithOutSpeciality");
    update();
    }
  }
  Click(int index){
    AppointmentIndex=index;
    print("Appointment Index is $AppointmentIndex");
    homecontroller.SetOfflineOnline(AppointmentIndex+1);
    print("Home controller oindex is ${homecontroller.OfflineOnline}");
    homecontroller.OfflineOnline=AppointmentIndex+1;
    print("Home contriller Index update is ${homecontroller.OfflineOnline}");
    update();
    fetchDoctors(1);

  }
  void IsSpecialityClickedByUser(){
    IsSpecialityClicked=!IsSpecialityClicked;
    update();
    fetchDoctors(1);
  }
List<String> AppointmentType=["Online Consultation","Physical Consultation"];
  fetchDoctors(pageIndex,{int? pageSize=70}) async {
    doctorList=[];
    IsLoading = true;
    try {
      var requestBody = {
        "consultationName": AppointmentIndex==1?"Physical Consultation":"Online Consultation",
        "pageIndex": pageIndex ?? 1,
        "pageSize": pageSize != 10 ? 70 : 10
      };
      if (SpecialityId >= 0) {
        requestBody['specializationId'] = (SpecialityId).toString();
      } //
      //SpecilaizationId based
      if (selectedLocation > 0) {
        requestBody['locationId'] = selectedLocation.toString();
      }
      //List<AllDoctors> ListOfFreshDoctors=[];
      var response = await apiService.postRequest(
          Apis.SpecialityDcotors['AllDoctorsList']!, requestBody);
      IsLoading = false;
      if (response.statusCode == 200) {
        List responsebody = response.data;
       // print("Body is :: $responsebody");
        // print("Response body length is ${responsebody.length}");

        //print("response is data ${response.data.length}");
        if (response.data.isNotEmpty) {
          List<AllDoctors> ListOfFreshDoctors = (responsebody as List<dynamic>)
              .map((e) => AllDoctors.fromJson(e as Map<String, dynamic>))
              .toList();
          if (response.data.length > 0) {
            List<AllDoctors> ListOfFreshDoctors = [];
            // print("Body length is :: ${responsebody
            //     .toString()
            //     .length}");
            ListOfFreshDoctors = (responsebody as List<dynamic>).map((e) =>
                AllDoctors.fromJson(e as Map<String, dynamic>)).toList();
            //print("DoctorList length is :: ${ListOfFreshDoctors.length}");

            if (ListOfFreshDoctors.isNotEmpty) {
              doctorList.addAll(ListOfFreshDoctors);
              update();
              filterDoctors();
            } else {
              // No new doctors, don't update the list
             // print("No new doctors to add.");
            }
            // doctorList.addAll(ListOfFreshDoctors);
            // update();
            // filterDoctors();
          }
          else {
            //print("No data received");
          }
        }
      }
    }
    catch (ex) {
      IsLoading = false;
      print("Exception :: $ex");
    }
  }

void showSearchBar(){
  IsVisible=!IsVisible;
  update();
}
  // fetchDoctors(pageIndex) async{
  //   try {
  //    List<AllDoctors> res = await homecontroller.GetAllDoctors(pageIndex: pageIndex,pageSize: 10);
  //    doctorList.addAll(res);
  //    doctorsWithOutSpeciality=doctorList;
  //     print("Response length: ${doctorList.length}");
  //     print("Response content: ${doctorList[0].providerName}");
  //    filterDoctors();
  //     // Verify that each element in the response is a Map
  //
  //   } catch (e) {
  //     print("Error fetching doctors: $e");
  //   }
  // }
  _getMoreDoctors(){
    fetchDoctors(pageIndex).then((_) {
      if (doctorList.isNotEmpty) {
        pageIndex += 1;
        update();
        //print("Getting data from $pageIndex");
      } else {
        // If no data is fetched, keep the previous data intact
       // print("No new data fetched, keeping previous data.");
      }
    });
  }
  void SelectedSpecialityIduser(int val){
    if(SpecialityId==val){

      SpecialityId=0;

    }
    else{
      SpecialityId=val;
    }

    update();
    filterDoctors();

  }
  void SelectedItemSpeciality(){
    IsSeeAllSpecialityClicked=!IsSeeAllSpecialityClicked;
    update();
  }
  GetSpecialityDoctor(val){
    homecontroller.selectedSpecialityIdByuser=val;
    update();
    fetchDoctors(pageIndex);
  }
  List Specialities=[];


  Timer? _debounce;
  Future<void> SearchedDoctorsList(String val) async {
    print("function called");
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () async {
      await fetchDoctorsSearched(val);
    });
  }
  Future<void> fetchDoctorsSearched(String val) async{
    SearchedDoctor=await homecontroller.fetchSearchDoctors(val) ;
    print("SearchedDoctors Length is : ${SearchedDoctor.length}");
    print("Patient id is : ${SearchedDoctor[0]}");
    print("doctor name is : ${SearchedDoctor[0]}");
    update();
  }
  void DoctorClick(Map<String,dynamic> data){
    homecontroller.DoctorParticularClick(data:data);
  }
  void Function(){
  Specialities=homecontroller.Specialities;
  homecontroller.SelectedItemSpeciality();

}
String ImagePath(String Text){
    String path='';
      homecontroller.ImageCall(Text).then((value){
    path= value;
    print("Value in Images is ${value}");
    update();
    });
      return path;

}
}