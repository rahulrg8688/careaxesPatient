import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../MyInvoices/pdf_common_screen.dart';
import 'lab_reports_controller.dart';

class LabReportsScreen extends StatelessWidget {
  LabReportsScreen({super.key});
  LabReportsController labcontroller=Get.put(LabReportsController());
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;
    return GetBuilder<LabReportsController>(
        builder: (labcontroller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Lab Reports"),
            ),
            body: Column(
              children: [
                Expanded(

                  child: ListView.builder(
                      itemCount: labcontroller.LabReportsList.length,
                      itemBuilder: (context,index){
                        final LabReportsList=labcontroller.LabReportsList[index];
                        PdfCommonScreen _pdfCommonScreen=PdfCommonScreen(text:LabReportsList.testName,
                            ImageText: "assets/Icon_images/pdfImage.png",DownloadIcon: Icons.download,ViewIcon: Icons.visibility,
                            onDownload: (){

                              //lab_invoice_report_controller.downloadFile("https://uat.careaxes.net/#/scan-report-invoice/${scanInvoiceList.encryptedBookScanAppointmentId}-${scanInvoiceList.encryptedRecieptId}",scanInvoiceList.scanTestName!,context);
                            },onView: (){

                              labcontroller.navigateToLabBookDetail(LabReportsList.encryptedNewLabBookingDetailId!,
                                     );
                             // pharmaInvoiceController.onNavigateToWebView(pharmaInvoiceList.encryptedPharmacySaleHeaderId!);
                            });
                        return Padding(padding: EdgeInsets.all(7),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(2,0,height*0.009,0),
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
                                margin: EdgeInsets.symmetric(vertical: 1),
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
            ),
          );
        }
    );
  }
}
