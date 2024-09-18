import 'dart:convert';

import 'package:get/get.dart';

import '../../../../../../ApiService/Api_service.dart';
import '../../../../../../Apicalls/Apis.dart';
import '../../../../../../GetStorage/shared_prefs_service.dart';
import '../../../../../../ModelClass/patient_pharmacy_invoice.dart';
import '../../../HomeScreen/homeController.dart';
import '../../../web_view_screen.dart';



class PharmaInvoiceController extends GetxController{

  List<PatientPharmacyInvoice> PatientPharmacyList=[];

  ApiService apiService=ApiService.getInstance();

  @override
  void onInit() async{
    await GetPharmaInvoiceDetails();
    // TODO: implement onInit
    print("Locations id is :: ${homeController().selectedLocation}");
    super.onInit();

  }

  Future<void> GetPharmaInvoiceDetails() async {
    print("Locations id is ::");
    print("Locations id is :: ${homeController().selectedLocation}");
    var response = await apiService.postRequest(Apis.GetPharmacyInvoice, {
      "patientId": SharedPrefsService().GetReferenceIdForPatient(),
    });
    // try {
    if (response.statusCode == 200) {
      List<dynamic> data=response.data;
      print("data is :: $data");
      PatientPharmacyList=data.map((e)=>PatientPharmacyInvoice.fromJson(e)).toList();
      update();
      print("Pharmacy invoice Length is :: ${PatientPharmacyList.length}");
    }
    // }
    // catch(exception){
    //   throw exception;
    // }
  }
  onNavigateToWebView(String EncryptedId){
    Get.to(()=>WebViewScreen(Path:'patient-salesbill',Id: EncryptedId));

  }

}