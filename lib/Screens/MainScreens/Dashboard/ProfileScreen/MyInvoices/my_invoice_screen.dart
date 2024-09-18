import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyInvoices/Scan_invoice_component/scan_invoice_screen.dart';
import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyInvoices/pharma_invoice_screen/pharma_invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'lab_invoice_screen/lab_reports_invoice_screen.dart';

class MyInvoiceScreen extends StatelessWidget {
   MyInvoiceScreen({super.key,required this.InitialIndex});
    int InitialIndex=0;
List InvoiceScreen=[
  ScanInvoiceScreen(),
  LabReportsInvoiceScreen(),
  PharmaInvoiceScreen()
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
          Tab(text:("Scan Invoice"

          ),

          ),
          Tab(text:"Lab Invoice"),
          Tab(text:"Pharma Invoice"),
        ]),
        title:Text("My Invoice"),

      ),
body:TabBarView(children: [
  ScanInvoiceScreen(),
  LabReportsInvoiceScreen(),
  PharmaInvoiceScreen()
])
      )),
    );
    return Scaffold(

    );
  }
}
