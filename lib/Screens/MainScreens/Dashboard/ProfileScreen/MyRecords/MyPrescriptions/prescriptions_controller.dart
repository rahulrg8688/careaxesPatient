import 'dart:io';

import 'package:get/get.dart';

import '../../../../../../ModelClass/GetDoctorBookings.dart';
import '../../../HomeScreen/homeController.dart';
import '../../../web_view_screen.dart';



class PrescriptionsController extends GetxController{
  homeController homecontroller=Get.put(homeController());
  List<GetDoctorBookings> AppointmentDoctors=[];
  List<GetDoctorBookings> FilteredPrescriptionDoctors=[];
  bool IsLoading=false;

  @override
  void onInit() {
    GetAppointmentDoctors();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> GetAppointmentDoctors() async{
    IsLoading=true;
    AppointmentDoctors=await homecontroller.GetBookingsDoctors();
    FilteredPrescriptionDoctors=AppointmentDoctors.where((s)=>s.isPrescription==true).toList();
    
    IsLoading=false;
    update();
  }
  String encounterType="";
  SetEncounterType(String Encounter){
    if(Encounter=="OBEncounter"){
      encounterType="ob-encounter";
      update();

  }else if (Encounter == "PediatricEncounter"){
  encounterType = "pediatric-encounter";
  update();
  }else if (Encounter == "GynEncounter"){
  encounterType = "gyn-encounter";
  update();
  }else if (Encounter == "DietEncounter"){
  encounterType = "diet-plan-encounter";
  update();
    }else if (Encounter == "PhysiotherapyEncounter"){
  encounterType = "physiotherapy-encounter";
  update();
  }else if (Encounter == "GeneticSpecialityEncounter"){
  encounterType = "genetic-speciality";
  update();
    }
    update();
  }

  onNavigateToWebView(String AppointmentEncryptedId,{String? ReceiptId,String? Key}){
    Get.to(()=>WebViewScreen(Path:'print-prescription',Id: AppointmentEncryptedId,Billed: encounterType,Key:Key));
  }
}
