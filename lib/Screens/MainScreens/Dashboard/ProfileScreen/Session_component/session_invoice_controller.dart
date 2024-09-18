import 'dart:convert';

import 'package:careaxes_patient/Apicalls/Apis.dart';
import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/Session_component/About_session_doctor_component/About_session_controller.dart';
import 'package:get/get.dart';

import '../../../../../ApiService/Api_service.dart';
import '../../../../../ModelClass/SessionDoctorModel.dart';

class SessionInvoiceController extends GetxController{


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     GetSessionDoctorsList();
  }
  List<String> Sessions=["Online","Offline"];
  int TypeOfConsultation=1;
  bool isLoading=false;
  int SessionSpid=0;
  int SessionProviderId=0;
  Click(index){
    TypeOfConsultation=index;
    update();
    GetSessionDoctorsList();
  }
  List<SessionDoctor> SessionDoctorsList=[];
  ApiService apiService=ApiService.getInstance();
  Future<void> GetSessionDoctorsList() async{
    isLoading=true;
    var response=await apiService.postRequest(Apis.SessionDoctorFetchApi,{
      "consultationTypeId":TypeOfConsultation+1
    });
    if(response.statusCode==200){
List<dynamic> responseBody=response.data;
SessionDoctorsList=responseBody.map((e)=>SessionDoctor.fromJson(e)).toList();
update();
    }
    else{


    }
    isLoading=false;
  }
  SetSessionSpidAndDoctid(int spid,int doctid){
    SessionSpid=spid;
    SessionProviderId=doctid;
    update();
// AboutSessionController(Spid: spid,DoctId: doctid);
Get.toNamed("/AboutSessionDoctor");
  }
}