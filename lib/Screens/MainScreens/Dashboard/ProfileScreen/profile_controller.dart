import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyInvoices/my_invoice_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../ApiService/Api_service.dart';
import '../../../../Apicalls/Apis.dart';
import '../../../../GetStorage/HiveBox.dart';
import 'MyRecords/MyRecordsWidget.dart';


class ProfileController extends GetxController{

  ApiService apiService=ApiService.getInstance();

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
Future.delayed(Duration(seconds: 5));

  }
  List MyRecordsList=[
    {
      'IconData':Icon(Icons.heart_broken_outlined),
      'Text':Text("My Appointments")
    },
    {
      'IconData':Icon(Icons.sports_esports_sharp),
      'Text':Text("Sessions")
    },
    {
      'IconData':Icon(Icons.note_sharp),
      'Text':Text("My Prescriptions")
    },
    {
      'IconData':Icon(Icons.filter_alt_outlined),
      'Text':Text("Health Documents")
    },
    {
      'IconData':Icon(Icons.medication_outlined),
      'Text':Text("Labs")
    }
  ];
  List MyInvoiceList=[
    // {
    //   'IconData':Icon(Icons.abc),
    //   'Text':Text("My Invoice")
    // },
    {
      'IconData':Icon(Icons.barcode_reader),
      'Text':Text("Scan Invoice")
    },
    {
      'IconData':Icon(Icons.science),
      'Text':Text("Lab Invoice")
    },
    {
      'IconData':Icon(Icons.vaccines),
      'Text':Text("Pharma Invoice")
    }
  ];
  List GeneralList=[
    {
      'IconData':Icon(Icons.phone_enabled),
      'Text':Text("Call Us")
    },
    {
      'IconData':Icon(Icons.live_help),
      'Text':Text("Help & Support")
    },
    {
      'IconData':Icon(Icons.enhanced_encryption),
      'Text':Text("Change password")
    },
    {
      'IconData':Icon(Icons.add_box),
      'Text':Text("Admissions")
    },
    {
      'IconData':Icon(Icons.language),
      'Text':Text("Language")
    },
    {
      'IconData':Icon(Icons.web),
      'Text':Text("Queue")
    },
    {
      'IconData':Icon(Icons.person),
      'Text':Text("My profile")
    },
  ];
  List AccountList=[
    {
      'IconData':Icon(Icons.account_circle),
      'Text':Text("Close Account")
    },
    {
      'IconData':Icon(Icons.logout),
      'Text':Text("logout")
    }
  ];
  var MyAccountListIndex=0;
  void MyAccountListSetIndex(int val){
    MyAccountListIndex=val;
     
    update();
    switch(MyAccountListIndex) {
      case 0:
        {
           
        }
      case 1:
        {

          print("Logout");
          Logoutuser();
        }
    }
    update();

  }
  var MyRecordsListIndex=0;
  void MyRecordsListSetIndex(int val){
    MyRecordsListIndex=val;
    print("My invoice index is : ${MyRecordsListIndex}");
    update();
    switch(MyRecordsListIndex){
      case 0:{
        print("My Appointments");
        Get.toNamed('/MyAppointments');

      }
      case 1:{
        Get.toNamed('/SessionScreen');
      }
      case 2:{
        print("My prescriptions");
        // Get.toNamed('/MyPrescriptions');
        Get.to(() => Myrecordswidget(InitialIndex: 0,));

      }
      case 3:{
        print("Health Docyments");
        Get.to(() => Myrecordswidget(InitialIndex: 1,));
      }
      case 4:{
        print("Lab reports");
        // Get.toNamed('/LabReports');
        Get.to(() => Myrecordswidget(InitialIndex: 2,));
      }
    }
  }
  var MyInvoicesListIndex=0;
  void MyInvoiceListSetIndex(int val){

    MyInvoicesListIndex=val;
    print("My invoice index is : ${MyInvoicesListIndex}");
    print("the value is ${MyInvoiceList[MyInvoicesListIndex]}");
    update();
    switch(MyInvoicesListIndex){
      // case 0:{
      //   Get.to(() => MyInvoiceScreen(InitialIndex: 0,));
      // }
      // break;
      case 0:
        {
          print("Scan Invoice");
          Get.to(() => MyInvoiceScreen(InitialIndex: 0,));
        }
        break;
      case 1:
        {
          print("Lab Invoice");
          Get.to(() => MyInvoiceScreen(InitialIndex: 1,));
        }
        break;
      case 2:
        {
          print("Pharma Invoice");
          Get.to(() => MyInvoiceScreen(InitialIndex: 2,));
        }
        break;
    }
  }


  int GeneralListIndex=0;
  void MyGeneralListSetIndex(int val){
    GeneralListIndex=val;
    print("General Index is ${GeneralListIndex}");
    switch(GeneralListIndex){
      case 0:{
Get.toNamed("/CallScreen");

      }
      break;
      case 1:{

      }
      break;
      case 2:{
        print("CHnage password");
        Get.toNamed('/ChangePassword');
      }
      break;
      case 3:{
        print("Admissoios");
        Get.toNamed("/PatientAdmissions");
      }
      break;
      case 6:{
        print("My profile updates");
        Get.toNamed('/MyprofileUpdate');
      }
    }

    update();

  }

  Future<void> Logoutuser() async{

    var customHeaders={
      'LocationId':'2'
    };
    var requestBody={
      "accountId":13392,"deviceType":"Android","deviceId":"4a859f4ee15019d6ddddddd"
    };
    var response=await apiService.postRequest(Apis.LogoutApi,requestBody,headers: customHeaders);
    if(response.statusCode==200){

      HiveBox().DeleteToken();

      Get.toNamed("/PhoneNumber");
    }
  }

  List scans=['Lab Invoice','Lab Reports'];
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<ProfileController>();
    print("profle dispose controller is $this");

  }

}