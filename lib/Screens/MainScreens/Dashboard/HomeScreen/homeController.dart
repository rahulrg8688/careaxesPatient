import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../ApiService/Api_service.dart';
import '../../../../Apicalls/Apis.dart';
import '../../../../GetStorage/HiveBox.dart';
import '../../../../GetStorage/shared_prefs_service.dart';
import '../../../../Jitse/call_service.dart';
import '../../../../ModelClass/DoctorsModel.dart';
import '../../../../ModelClass/GetDoctorBookings.dart';
import '../../../../ModelClass/GetLocations.dart';
import '../../../../ModelClass/GetSpeciality.dart';
import '../../../../ModelClass/search_doctors_modelList.dart';
import '../../JitseScreen/Jitse.dart';


class homeController extends GetxController with WidgetsBindingObserver{
  int currentSlide=0;
  var BottomNavBarIndex=0.obs;
  var IsClicked=false.obs;
  var selectedSpecialityIndexGrid=-1;
  var selectedSpecialityIdByuser=0;
  bool IsLoading=false;
  bool IsSeeAllSpecialityClicked=false;
  var DoctorNameSearched=TextEditingController();
HiveBox hiveBox=HiveBox();

  List<dynamic> carousals(){
   return [
     GetAppointmentRecentDetails(),
     Image.asset('assets/Carousals/Carousal_gyne.png'),
     Image.asset('assets/Carousals/Carousal_gyne.png'),


   ];
  }
  Widget GetAppointmentRecentDetails() {
     
    homeController controller = Get.find(); // Use Get.find() if controller is already initialized

    if (controller.DoctorBookings.isEmpty) {
      return Container(
        height:20,
        color: Colors.grey[200],
        child: Center(child: Text("No Appointments Available")),
      );
    }

    GetDoctorBookings doctorBooking = GetBookings[0];
    for(int i=0;i<3;i++){

    }

     

    return Container(
      padding: EdgeInsets.all(16),
      color: Color(0xFF5E55EA),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctorBooking.providerName ?? "Unknown Doctor",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            doctorBooking.specializationName ?? "Unknown Specialization",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  doctorBooking.appointmentDate ?? "Unknown Date",
                  style: TextStyle(color: Color(0xFF5E55EA), fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 8),
              Text(
                doctorBooking.appointmentTime ?? "Unknown Time",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }


  @override
  void onInit()async{
    super.onInit();
    print("shared prefs patient name is ${SharedPrefsService().GetPatientName()}");
    SharedPrefsService().SetPreferredLocation(1);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // Example of using Get.toNamed for navigation
    //   if(SharedPrefsService().GetPatientName()==""){
    //     print("ture");
    //     Get.toNamed("/MyprofileUpdate");
    //   }
    //
    // });
    // TODO: implement onInit
    // if(SharedPrefsService().GetPatientName()==""){
    //   print("ture");
    //   Get.toNamed("/MyprofileUpdate");
    // }
    // else {
      WidgetsBinding.instance.addObserver(this);
    HiveBoxSpecialities=hiveBox.GetSpecializationList()??[];
print("Init function ${HiveBoxSpecialities.length}");
      await Future.wait([
        GetLocation(),

        GetSpecialitiesOfDoctors(),

        GetAllDoctors(),

        GetBookingsDoctors(),

      ]);

  }
int OfflineOnline=0;

  GetLocations locations=GetLocations();
  List<GetLocations> location=[];
  List<GetDoctorBookings> GetBookings=[];
  List<GetDoctorBookings> CancelledBooking=[];
  List<SearchedDoctorsModel> SearchedDoctors=[];
  List SearchedDoctorList=[];
  List DoctorBookings=[];
  List addlocation=[];
  List<AllDoctors> doctorsList=[];
  RxInt selectedLocation=1.obs;
  List Specialities=[];
  List doctorList=[];
  List HiveBoxSpecialities=[];
  List SpecializiedDoctors=[];
  ApiService apiService=ApiService.getInstance();

  Future<void> GetLocation() async{
    var response=await apiService.getRequest(Apis.GetLocations['LocationApi']!);
    if(response.statusCode==200){
      List<dynamic> res=(response.data);
      location=res.map((e)=>GetLocations.fromJson(e)).toList();
      location.forEach((location) {
         

        var locationList={
          'name':location.name,
          'id':location.id
        };
        addlocation.add(locationList);

        update();

      });

      addlocation.forEach((loc){
         
      });
      update();

       
       
    }
    else{
       
      print(response.statusCode);

    }
  }

  void LocationSelected(String val){
    selectedLocation.value=int.parse(val);
    update();
    print("Selected Location is :: $selectedLocation");
    SharedPrefsService().SetPreferredLocation(int.parse(val));
    GetAllDoctors();
  }
  void CarouralIndex(int val){
    currentSlide=val;
    update();
  }
  void bottomNavBarIndexFunc(int val){
    BottomNavBarIndex.value=val;

    update();
  }
  SetOfflineOnline(int id){
    print("selecyed id");
    OfflineOnline=id;
    update();
  }

  Future<List<dynamic>> GetSpecialitiesOfDoctors() async{
    String Endpoint=Apis.GetSpecialities();
    print(Endpoint);

      var response=await apiService.postRequest(Endpoint,{
      }
      );
      if(response.statusCode==200){
        dynamic responseBody = (response.data);

        if (responseBody is List) {
          List<Specialitions> doctorSpecialities = responseBody.map((e) => Specialitions.fromJson(e)).toList();
          doctorSpecialities.forEach((speciality) {
            if (speciality.specializations != null &&
                speciality.specializations!.isNotEmpty) {
              print("Iam from list : ${speciality.specializations}");
            }
          });
        } else if (responseBody is Map<String, dynamic>) {
          // Handle single object case
          Specialitions doctorSpeciality = Specialitions.fromJson(responseBody);
          if (doctorSpeciality.specializations != null && doctorSpeciality.specializations!.isNotEmpty) {
            print("I am from object specialities");
            //print("single object : ${doctorSpeciality.specializations![1].value}");
            doctorSpeciality.specializations!.forEach((spec){

              if(!(Specialities.contains(spec.id) && Specialities.contains(spec.value))){
                print(spec.value);
                print(spec.id);
                print("second \n");
                var eachspecialityById={

                  'specialityId':spec.id,
                  'specialityname':spec.value,
                };
                Specialities.add(eachspecialityById);

              }
            });
            // Specialities.insert(0,{'specialityId':0,'specialityname':"See All"});

            print("length of specialiies is ${Specialities.length}");
          }
        } else {
          print("Unexpected response format");
        }
      } else {
        print("Failed to fetch specialities: ${response.requestOptions}");
      }
      if(HiveBoxSpecialities.length!=Specialities.length){
        hiveBox.StoreSpecializationList(Specialities);
        HiveBoxSpecialities=hiveBox.GetSpecializationList()??[];
        print("Hivebox Specialitions list is ${HiveBoxSpecialities.length}");
        update();
    }


      //print("Hivebox Specialitions list is ${HiveBoxSpecialities.length}");

      return Specialities;





  }

  void SelectedItemSpeciality(){
    IsSeeAllSpecialityClicked=!IsSeeAllSpecialityClicked;
    update();
  }
  void SeeAllSpecialityButtonClicked(){
    IsSeeAllSpecialityClicked=!IsSeeAllSpecialityClicked;
    update();
  }



  Future<List<AllDoctors>> GetAllDoctors({int? pageIndex, int? pageSize}) async {
    IsLoading = true;
    print("GetAllDoctors function called");
    print("APi service is ${apiService.baseUrl}");

    var requestBody = {
      "consultationName": "Physical Consultation",
      "pageIndex": pageIndex ?? 1,
      "pageSize": pageSize != 10 ? 70 : 10
    };

    if (selectedSpecialityIdByuser >= 0) {
      requestBody['specializationId'] = selectedSpecialityIdByuser.toString();
    }

    if (selectedLocation > 0) {
      requestBody['locationId'] = selectedLocation.toString();
    }

    // Construct the full URL for debugging
    var fullUrl = '${Apis.SpecialityDcotors['AllDoctorsList']}';
    print("Making request to: $fullUrl");

    try {
      var response = await apiService.postRequest(fullUrl, requestBody);

      if (response.statusCode == 200) {
        IsLoading = false;
        update();
        doctorList.clear();
        update();
        var responsebody = response.data;
        print(responsebody);

        if (responsebody is List) {
          print("List returning");
          print("Length of list: ${responsebody.length}");

          doctorsList = responsebody.map((e) => AllDoctors.fromJson(e)).toList();
          for (var doctor in doctorsList) {
            print("Doctor account Id: ${doctor.accountId}");
            print("Doctor speciality: ${doctor.specializations}");
            print("Doctor Location: ${doctor.location}");

            if (!(doctorList.contains(doctor.providerId) && doctorList.contains(doctor.providerName))) {
              String imagePath =await ImageCall(doctor.thumbnailUrl??"");
              print("Thumbnail url is ${doctor.thumbnailUrl}");
              
              var ModelDoctor = {
                'DoctorName': doctor.providerName,
                'DoctorId': doctor.providerId,
                'speciality': doctor.specializations,
                'specialityId': doctor.specializationId,
                'DepartmentId':doctor.departmentId,
                'ImagePath':imagePath=="a"?"assets/DoctorImages/dr_2.png":imagePath
              };

              doctorList.add(ModelDoctor);
              print(doctorList.length);
              SpecializiedDoctors = doctorList;
              update();
            }
          }
        } else if (responsebody is Map<String, dynamic>) {
          print("I am object");
        }
        return doctorsList;
      }
    } catch (e) {
      print("Error occurred: $e");
    }
    return [];
  }
  Dio dio=Dio();
Future<String> ImageCall(String text) async{
    if(text==""){
      return "a";
    }
    String Api="https://uat.careaxes.net/uat-qa-api/api/resources/get-profile-image?imagePath=${text}";
    try{
      var response = await dio.get (Api);
      if(response.statusCode==200){
        return Api;
      }
    }
    catch(ex){
      return "a";
    }
    return "a";
}
  void filterDoctors() {
    if (selectedSpecialityIdByuser== 0) {
      SpecializiedDoctors = doctorList;
    } else {
      SpecializiedDoctors= doctorList.where((doctor) => doctor['specialityId'] == selectedSpecialityIdByuser).toList();
    }
  }
  Timer? _debounce;
  Future<void> SearchedDoctorsList(String val) async {
    print("function called");
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () async {
      await fetchSearchDoctors(val);
    });
  }
  Future<List<SearchedDoctorsModel>> fetchSearchDoctors(String val) async{
    // Perform API request with the debounced value
    if(val.isEmpty){
      SearchedDoctors=[];
    }
    else {
      SearchedDoctors=[];
      DoctorNameSearched.text = val;

      var data={
        'Filter':DoctorNameSearched.text,
        'LocationId':SharedPrefsService().GetPrefferedLocation(),
      };
      var response =
      await apiService.postRequest(Apis.SearchDoctors,data);
      if (response.statusCode == 200) {
        print(response.data);
        List<dynamic> responseBody = response.data;
        SearchedDoctors = responseBody
            .map((e) => SearchedDoctorsModel.fromJson(e))
            .toList();
      update();
        for (var doctor in SearchedDoctors) {
          print("searched doctor : ${doctor.providerId}");
          print("searched doctor value is : ${doctor.specializationName}");
        }
        print(SearchedDoctors.length);

        update(); // Notify listeners that the state has changed
      }
    }
    return SearchedDoctors;
  }



  // var response=await apiService.getRequest(Apis.SearchDoctors(DoctorNameSearched.text));
  // if(response.statusCode==200){
  //   print(response.data);
  //   List<dynamic> responsebody=response.data;
  //  SearchedDoctors= responsebody.map((e)=>SearchedDoctorsModel.fromJson(e)).toList();
  //
  //  for(var Doctor in SearchedDoctors){
  //    print("searched doctor : ${Doctor.id}");
  //    print("Searched doctor value os : ${Doctor.value}");
  //  }
  //  print(SearchedDoctors.length);
  //   update();
  // }

int PreviousAppointmentLength=0;
  int CurrentAppointmentLength=0;
  int ctr=0;
 bool AppointmentLoading=false;
 int CurrentCancelledAppointmentLength=0;
 int previousCancelledAppointmentLength=0;


  Future<List<GetDoctorBookings>> GetBookingsDoctors({int? value}) async{
    print("GetBooking called");
    AppointmentLoading=true;
    int patientId=SharedPrefsService().GetReferenceIdForPatient();
    print("Patient Id is :: $patientId");
    var Bookingbody;
    if(value==1) {
      Bookingbody={
        "isMobile": true,
        "pageIndex": 1, // not mandatory
        "pageSize": 20, // not mandatory
        "patientId": patientId, // mandatory field
        "resultsType": "",
        "status": "C"
      };

    }
    else{
      Bookingbody = {
        "isMobile": true,
        "pageIndex": 1, // not mandatory
        "pageSize": 20, // not mandatory
        "patientId": patientId, // mandatory field
        "resultsType": "Pending",

      };
    }

    var response=await apiService.postRequest(Apis.Appointment['BookingAppointmentApi']!,
        Bookingbody);
    AppointmentLoading=false;
    if(response.statusCode==200) {
      print(response.data);
      List<dynamic> responseBody = (response.data);
        GetBookings =
            responseBody.map((e) => GetDoctorBookings.fromJson(e)).toList();

        print("Length is appointment ${GetBookings.length}");
      }

      update();

        for (var bookings in GetBookings) {
          ctr++;
          if (ctr == 2) {
            DoctorBookings.add(bookings);
            update();
            break;
          }

          print("Booking is : ${bookings.providerName}");
        }
        // DoctorBookings.add(GetBookings);

        print("Doctor booking : ${DoctorBookings.length}");
    return GetBookings;
      }



  void SelectedSpeciality(int val){
    selectedSpecialityIndexGrid=val;
    print("Selected Index grid is $selectedSpecialityIndexGrid");
    update();
  }
  void SelectedSpecialityIduser(int val){
    if(selectedSpecialityIdByuser==val){
      selectedSpecialityIdByuser=0;
    }
    else{
      selectedSpecialityIdByuser=val;
    }

    update();
    filterDoctors();
  }
var DoctorDetail={};
  UpdateDoctorDetail(Map<String,dynamic> data){
    DoctorDetail=data;
    update();
  }
  void DoctorParticularClick({int? spid,Map<String,dynamic>? data}){


    print("Specialiti Id is ${spid}");
    // Aboutdoctorcontroller AboutDoctor=Get.put(Aboutdoctorcontroller(spid,doctid));
    //AboutDoctor.setDoctorIdAndDoctorId(spid,doctid);

    Get.toNamed("/AboutDoctor",arguments: {'DoctDetails':data??DoctorDetail});
  }

@override
  void dispose() {
    DoctorDetail={};

    // TODO: implement dispose
    super.dispose();
  }
}
