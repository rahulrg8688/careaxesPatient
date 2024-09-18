import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../ApiService/Api_service.dart';
import '../../../../../../Apicalls/Apis.dart';
import '../../../../../../GetStorage/shared_prefs_service.dart';
import '../../../../../../ModelClass/scan_invoice_model.dart';
import '../../../HomeScreen/homeController.dart';
import '../../../web_view_screen.dart';



class ScanInvoiceController extends GetxController{

  List<ScanInvoiceModel> ScanInvoiceList=[];
  ApiService apiService=ApiService.getInstance();
  @override
  void onInit(){
    print("Patient id is :: ${SharedPrefsService().GetReferenceIdForPatient()}");
    print("Custom loc is ${homeController().selectedLocation.toString()}");
    // TODO: implement onInit
    GetScanInvoiceData();
    super.onInit();
  }

  var customHeaders={
    "LocationId":'2'
  };
  Future<void> GetScanInvoiceData() async{
    var response=await apiService.postRequest(Apis.GetScanInvoice,{

      "Active": false,
      "Age": 0,
      "BookScanAppointmentId": 0,
      "chargeCategoryId": 0,
      "CreatedBy": 0,
      "IsSalucroAppointment": false,
      "PageIndex": 1,
      "PageSize": 10,
      "PatientId": SharedPrefsService().GetReferenceIdForPatient(),
      "PatientPaymentStatus": false,
      "ScanMachineMasterIds": 0,
      "SlotDuration": 0


    },headers:customHeaders);
    if(response.statusCode==200){
      print("response code is :: ${response.statusCode}");
      print("resposne is ${response}");
      List<dynamic> data=response.data;
      print("data is :: ${data}");
      ScanInvoiceList=data.map((e)=>ScanInvoiceModel.fromJson(e)).toList();
      update();
      print("Length of :: is ${ScanInvoiceList.length}");
    }
    else{
      print("response error is :: ${response.statusCode}");
      //print("response is :: ${response.reasonPhrase}");
    }
  }
  Dio dio=Dio();
  Future<void> downloadFile(String url, String fileName,BuildContext context) async {
    try {
       const downloadsFolderPath = '/storage/emulated/0/Download/';
      // Get the directory to save the file
      //Directory? directory = await getExternalStorageDirectory();
       Directory directory = Directory(downloadsFolderPath);
      if (directory != null) {
        String filePath = "${directory.path}/$fileName.pdf";

        // Download the file
        await dio.download(url, filePath);

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File downloaded to $filePath')),
        );
      }
    } catch (e) {
      // Handle the error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download file: $e')),
      );
    }
  }


    onNavigateToWebView(String BookScanAppointmentId,{String? RecieptId}){
    Get.to(()=>WebViewScreen(Path:'scan-report-invoice',Id: BookScanAppointmentId,RecieptId: RecieptId,));
  }
}