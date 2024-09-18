

import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyRecords/HealthDocumentsScreen/health_documents_screen.dart';
import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyRecords/LabReportsScreen/lab_reports_screen.dart';
import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyRecords/MyPrescriptions/prescriptions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Myrecordswidget extends StatelessWidget {
  Myrecordswidget({super.key,required this.InitialIndex});
  int InitialIndex=0;
  List InvoiceScreen=[

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 3,
          initialIndex: InitialIndex,
          child: Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_outlined)),
                bottom: TabBar(
                    labelColor: Color(0xFF2F80ED),
                    unselectedLabelColor: Color(0xFF0C212C),
                    indicatorColor: Color(0xFF2F80Ed),
                    indicatorWeight: 0.54,

                    tabs:[
                      Tab(text:("My Prescriptions"

                      ),

                      ),
                      Tab(text:"Health Documents"),
                      Tab(text:"Lab Reports"),
                    ]),
                title:Text("My Records"),

              ),
              body:TabBarView(children: [
           PrescriptionsScreen(),
                HealthDocumentsScreen(),
                LabReportsScreen()
              ])
          )),
    );
    return Scaffold(

    );
  }
}