import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pdf_common_screen.dart';
import 'lab_invoice_report_controller.dart';

class LabReportsInvoiceScreen extends StatelessWidget {
  LabReportsInvoiceScreen({super.key});
  LabInvoiceReportController lab_invoice_report_controller=Get.put(LabInvoiceReportController());
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return GetBuilder<LabInvoiceReportController>(
        builder: (lab_invoice_report_controller) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                  title:Text("Lab Invoice")
              ),
              body:Column(
                children: [
                  Expanded(
                    //height:double.infinity,
                    child: ListView.builder(
                        itemCount:lab_invoice_report_controller.LabsInvoiceList.length ,

                        itemBuilder: (context,index){
                          final LabInvoiceReportsList=lab_invoice_report_controller.LabsInvoiceList[index];
                          PdfCommonScreen _pdfCommonScreen=PdfCommonScreen(text:LabInvoiceReportsList.requisitionNumber,
                              ImageText: "assets/Icon_images/pdfImage.png",DownloadIcon: Icons.download,ViewIcon: Icons.visibility,
                              onDownload: (){
                                print("Clicked on ${index} download");
                                //lab_invoice_report_controller.downloadFile("https://uat.careaxes.net/#/scan-report-invoice/${scanInvoiceList.encryptedBookScanAppointmentId}-${scanInvoiceList.encryptedRecieptId}",scanInvoiceList.scanTestName!,context);
                              },onView: (){
                                print("Clicked on ${index} view");
                                lab_invoice_report_controller.onClickNavigate(LabInvoiceReportsList.encryptedHeaderId!,Billed:lab_invoice_report_controller.LabsInvoiceList[index].billType);
                              });
                          return Padding(padding: EdgeInsets.all(7),
                            child: Container(
                              height:height*0.089,
                              width:width,
                              child: GestureDetector(
                                onTap: (){
                                  // lab_invoice_report_controller.onClickNavigate(lab_invoice_report_controller.LabsInvoiceList[index].encryptedHeaderId!,
                                  //     Billed:lab_invoice_report_controller.LabsInvoiceList[index].billType);
                                },
                                child: Card(
                                  elevation: 0,
                                  color:Color(0xFFFFFFFF),
                                  margin: EdgeInsets.symmetric(vertical: 2),
                                  child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: _pdfCommonScreen.CommonWidget(context)
                                  ),
                                ),
                              ),
                            ),

                          );

                        }),
                  )
                ],
              )
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
}
