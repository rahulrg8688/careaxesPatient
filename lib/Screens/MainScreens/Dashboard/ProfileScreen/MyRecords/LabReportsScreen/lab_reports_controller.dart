import 'dart:convert';

import 'package:get/get.dart';


import '../../../../../../ApiService/Api_service.dart';
import '../../../../../../Apicalls/Apis.dart';
import '../../../../../../GetStorage/shared_prefs_service.dart';
import '../../../../../../ModelClass/lab_reports_model.dart';
import '../../../web_view_screen.dart';

class LabReportsController extends GetxController{
  List<LabReportsModel> LabReportsList=[];
  int patientId=SharedPrefsService().GetReferenceIdForPatient();
  ApiService apiService=ApiService.getInstance();
  Future<void> GetLabReports() async{
    var response=await apiService.postRequest(Apis.LabReportsApi, {
      "patientId":patientId,
      "status" : "Verified"
    });
    if(response.statusCode==200){

      List<dynamic> res=response.data;
      LabReportsList=res.map((e)=>LabReportsModel.fromJson(e)).toList();






      update();
    }

  }

  navigateToLabBookDetail(String EncryptedLabId){

    Get.to(()=>WebViewScreen(Path:'new-lab-reports',Id: EncryptedLabId));
  }

  @override
  void onInit() {
    int patientId=SharedPrefsService().GetReferenceIdForPatient();
    GetLabReports();
    // TODO: implement onInit
    super.onInit();
  }
}