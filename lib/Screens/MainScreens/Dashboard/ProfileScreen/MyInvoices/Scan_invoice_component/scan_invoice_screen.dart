import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyInvoices/Scan_invoice_component/scan_invoice_controller.dart';
import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyInvoices/pdf_common_screen.dart';
//import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/Scan_invoice_component/scan_invoice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/adapters.dart';

class ScanInvoiceScreen extends StatelessWidget {
  ScanInvoiceScreen ({super.key});
  var size,height,width;
  ScanInvoiceController scanInvoiceController=Get.put(ScanInvoiceController());

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ScanInvoiceController>(
        builder: (scanInvoiceController) {
          size = MediaQuery.of(context).size;
          height = size.height;
          width = size.width;
          return Scaffold(
              appBar: AppBar(
                title: Text("Scan Invoice"),
              ),
              body:Container(
                color:Colors.white24,
                child: Column(
                  children: [
                    Expanded(child: ListView.builder(
                        itemCount: scanInvoiceController.ScanInvoiceList.length,
                        itemBuilder: (context,index){
                          final scanInvoiceList=scanInvoiceController.ScanInvoiceList[index];
                          PdfCommonScreen _pdfCommonScreen=PdfCommonScreen(text:scanInvoiceController.ScanInvoiceList[index].scanTestName,
                          ImageText: "assets/Icon_images/pdfImage.png",DownloadIcon: Icons.download,ViewIcon: Icons.visibility,
                          onDownload: (){
                            print("Clicked on ${index} download");
                            scanInvoiceController.downloadFile("https://uat.careaxes.net/#/scan-report-invoice/${scanInvoiceList.encryptedBookScanAppointmentId}-${scanInvoiceList.encryptedRecieptId}",scanInvoiceList.scanTestName!,context);
                          },onView: (){
                            print("Clicked on ${index} view");
                            scanInvoiceController.onNavigateToWebView(scanInvoiceController.ScanInvoiceList[index].encryptedBookScanAppointmentId!,RecieptId: scanInvoiceController.ScanInvoiceList[index].encryptedRecieptId);
                              }

                          );
                          return Padding(padding: EdgeInsets.all(4),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(width*0.016,0, width*0.030, 0),
                              height:height*0.089,
                              width:width,
                              child: GestureDetector(
                                onTap: (){

                                },
                                child: Card(
                                  elevation: 0,
                                  color:Color(0xFFFFFFFF),
                                  margin: EdgeInsets.symmetric(vertical: 2),
                                  child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: _pdfCommonScreen.CommonWidget(context)
                                      // child: Row(
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   children: [
                                      //     Container(
                                      //       width:50,
                                      //       height:50,
                                      //       decoration: BoxDecoration(
                                      //         borderRadius: BorderRadius.circular(6),
                                      //         color: Color(0xFFF6F6F6),
                                      //       ),
                                      //       child:
                                      //           Image.asset("assets/Icon_images/pdfImage.png",
                                      //           color:Color(0xFFF6F6F6),
                                      //             colorBlendMode: BlendMode.darken,
                                      //           )
                                      //
                                      //
                                      //     ),
                                      //
                                      //     Expanded(
                                      //       //margin: EdgeInsets.fromLTRB(0, 4, 0,4),
                                      //         child: EachField("Test name : ", "${scanInvoiceController.ScanInvoiceList[index].scanTestName}")
                                      //
                                      //     ),
                                      //
                                      //   ],
                                      // )
                                  ),
                                ),
                              ),
                            ),
                          );
                        }))
                  ],
                ),
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
