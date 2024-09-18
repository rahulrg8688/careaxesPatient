import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../ModelClass/CategoriesList.dart';
import '../../MyInvoices/pdf_common_screen.dart';
import 'health_document_controller.dart'; // Assuming the controller is in the same folder

class HealthDocumentsScreen extends StatelessWidget {
  HealthDocumentsScreen({super.key});

  final HealthDocumentController healthDocumentController = Get.put(HealthDocumentController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthDocumentController>(
      builder: (healthDocumentController) {
        final size=MediaQuery.of(context).size;
        double height=size.height;
        double width=size.width;
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(child:
                ListView.builder(
                    itemCount: healthDocumentController.uploadedPatientData.length,
                    itemBuilder: (context,index){
                      final LabReportsList=healthDocumentController.uploadedPatientData[index];
                      PdfCommonScreen _pdfCommonScreen=PdfCommonScreen(text:LabReportsList.documentType,
                          ImageText: "assets/Icon_images/pdfImage.png",DownloadIcon: Icons.download,ViewIcon: Icons.visibility,
                          onDownload: (){
                            print("Clicked on ${index} download");
                            //lab_invoice_report_controller.downloadFile("https://uat.careaxes.net/#/scan-report-invoice/${scanInvoiceList.encryptedBookScanAppointmentId}-${scanInvoiceList.encryptedRecieptId}",scanInvoiceList.scanTestName!,context);
                          },onView: (){
                            print("Clicked on ${index} view");
                            healthDocumentController.navigateToLabBookDetail(LabReportsList.documentUrl!,
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

                    })
                ),
                Container(
                  width:width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(context: context, builder: (context) {
                            return healthDocumentController.index==0?leadDialog(context):
                            healthDocumentController.SecondDialog(context);

                          });
                        },
                        child: Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              color: Color(0xFFF5F5F5),
                              style: BorderStyle.solid,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF000000),
                                blurRadius: 0.8,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.file_upload_outlined,
                              color: Color(0xFF3D8AF6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Dialog leadDialog(BuildContext context) {
    return Dialog(
      child: Container(
        height: 325.0,
        width: 360.0,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Add Document"),
            MyListView(Icons.access_time_filled_outlined, "Take a Picture", index: 0,context: context),
            MyListView(Icons.browse_gallery_outlined, "Choose from Gallery", index: 1),
            MyListView(Icons.video_camera_back_rounded, "Choose from Video", index: 2),
            MyListView(Icons.picture_as_pdf, "Choose from PDF", index: 3),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black, fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget MyListView(IconData icon, String text, {int? index,BuildContext? context}) {
    return Container(
      color: Colors.amberAccent,
      margin: EdgeInsets.all(3),
      child: ListTile(
        onTap: () {
          switch (index) {
            case 0:
              healthDocumentController.takeSnapshot(context!);
              break;
            case 1:
              chooseFromGallery();
              break;
            case 2:
              chooseFromVideo();
              break;
            case 3:
              chooseFromPDF();
              break;
            default:
              print("No action defined");
          }
        },
        tileColor: Colors.black,
        leading: Icon(icon),
        title: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }


  void chooseFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (img == null) return;

    healthDocumentController.setImagePath(img.path);
  }

  void chooseFromVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? video = await picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (video == null) return;

    //healthDocumentController.setVideoPath(video.path);
  }

  void chooseFromPDF() {
    // Implement logic to pick a PDF file
    // You might need a package like file_picker for this
    print("Choose PDF");
  }
  Dialog SecondDialog(BuildContext context) {
    return Dialog(
      child: Container(
        height: 325,
        width: 340,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Upload Document"),
            SizedBox(height: 20), // Space between text and dropdown
            GetBuilder<HealthDocumentController>(
              builder: (controller) {
                return DropdownButtonFormField<CategoriesList>(
                  value: controller.selectedCategory, // Initially selected value
                  hint: Text("Select Category"),
                  items: controller.categories.map((category) {
                    return DropdownMenuItem<CategoriesList>(
                      value: category,
                      child: Text(category.value.toString()), // Assuming `name` is a field in `CategoriesList`
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    controller.selectedCategory = newValue!;
                    controller.update(); // Update the selected category
                    print("Selected category: ${newValue.value}");
                  },
                  isExpanded: true, // Makes the dropdown expand to full width
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}
