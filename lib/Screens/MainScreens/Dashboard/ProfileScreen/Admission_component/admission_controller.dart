import 'dart:convert';

import 'package:get/get.dart';

import '../../../../../ApiService/Api_service.dart';
import '../../../../../Apicalls/Apis.dart';
import '../../../../../GetStorage/shared_prefs_service.dart';
import '../../../../../ModelClass/patient_admission_model.dart';
import '../../web_view_screen.dart';

class AdmissionController extends GetxController{
  List<PatientAdmissionModel> PatientAdmissionList=[];
  ApiService apiService=ApiService.getInstance();

  @override
  void onInit() {
    GetPatientAdmissionApi();
    // TODO: implement onInit
    super.onInit();
  }
  var customHeaders={
    "LocationId":'2'
  };
  Future<void> GetPatientAdmissionApi() async{
    var response=await apiService.postRequest(Apis.GetPatientAdmissionApi,{
      "active":true,
      "isDischarged":false,
      "locationId":0,
      "pageIndex":1,
      "pageSize":10,
      "patientId":SharedPrefsService().GetReferenceIdForPatient(),
      "patientPriorityId":0},
        headers: customHeaders);
    if(response.statusCode==200){
      List<dynamic> data=response.data;
      print("data is :: $data");
      PatientAdmissionList=data.map((e)=>PatientAdmissionModel.fromJson(e)).toList();
      update();

    }
    else{
      print("response is error ${response.statusCode}");
      print("response body is :: ${response.data}");
    }
  }
  onNavigateToWebView(String AdmissionId){
    Get.to(()=>WebViewScreen(Path:'print-gatepass-invoice',Id: AdmissionId));
  }
}