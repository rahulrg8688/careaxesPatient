import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyInvoices/pharma_invoice_screen/pharma_invoice_controller.dart';
// import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/pharma_invoice_screen/pharma_invoice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../pdf_common_screen.dart';

class PharmaInvoiceScreen extends StatelessWidget {
  PharmaInvoiceScreen({super.key});
  PharmaInvoiceController pharmaInvoiceController=Get.put(PharmaInvoiceController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PharmaInvoiceController>(
        builder: (pharmaInvoiceController) {
          final size=MediaQuery.of(context).size;
          final height=size.height;
          final width=size.width;
          return Scaffold(
            appBar: AppBar(
              title: Text("Pharmacy Invoices"),
            ),
            body: Column(
              children: [
                Expanded(child: ListView.builder(
                    itemCount:pharmaInvoiceController.PatientPharmacyList.length ,
                    itemBuilder: (context,index){
                      final pharmaInvoiceList=pharmaInvoiceController.PatientPharmacyList[index];
                      PdfCommonScreen _pdfCommonScreen=PdfCommonScreen(text:pharmaInvoiceList.billNumber,
                          ImageText: "assets/Icon_images/pdfImage.png",DownloadIcon: Icons.download,ViewIcon: Icons.visibility,
                          onDownload: (){
                            print("Clicked on ${index} download");
                            //lab_invoice_report_controller.downloadFile("https://uat.careaxes.net/#/scan-report-invoice/${scanInvoiceList.encryptedBookScanAppointmentId}-${scanInvoiceList.encryptedRecieptId}",scanInvoiceList.scanTestName!,context);
                          },onView: (){
                            print("Clicked on ${index} view");
                            pharmaInvoiceController.onNavigateToWebView(pharmaInvoiceList.encryptedPharmacySaleHeaderId!);
                          });
                      return Padding(padding: EdgeInsets.all(7),
                        child: Container(
                          height:height*0.089,
                          width:width,
                          child: GestureDetector(
                            onTap: (){
                              //pharmaInvoiceController.onNavigateToWebView(pharmaInvoiceController.PatientPharmacyList[index].encryptedPharmacySaleHeaderId!);
                            },
                            child: Card(
                              elevation: 0,
                              color:Color(0xFFFFFFFF),
                              margin: EdgeInsets.symmetric(vertical: 2),
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child:_pdfCommonScreen.CommonWidget(context)
                              ),
                            ),
                          ),
                        ),
                      );
                    }))
              ],
            ),

          );
        }
    );
  }
  Widget EachField(String text,String value){
    return Row(
      children: [
        Text("$text : "),
        Text("$value")
      ],
    );
  }
  String ConvertDateInFormat(String date){
    DateTime datetime=DateTime.parse(date);
    DateFormat formatter=DateFormat('dd MMMM yyyy,HH:mm');
    String formattedDate=formatter.format(datetime);
    return formattedDate;
  }
}
