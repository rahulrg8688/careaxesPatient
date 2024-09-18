import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'admission_controller.dart';

class AdmissionScreen extends StatelessWidget {
  AdmissionScreen({super.key});
  AdmissionController admissionController=Get.put(AdmissionController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdmissionController>(
        builder: (admissionController) {
          final size=MediaQuery.of(context).size;
          double height=size.height;
          double width=size.width;
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Admission Invoice"),
              ),
              body:Column(
                children: [
                  Expanded(child: ListView.builder(
                      itemCount: admissionController.PatientAdmissionList.length,
                      itemBuilder: (context,index){
                        return Padding(padding: EdgeInsets.all(7),
                          child: Container(
                            height:height*0.03,
                            width:219,
                            child: GestureDetector(
                              onTap: (){
                                admissionController.onNavigateToWebView(admissionController.PatientAdmissionList[index].encryptedAdmissionId!);
                              },
                              child: Card(
                                elevation: 1,
                                margin: EdgeInsets.symmetric(vertical: 6),
                                child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("${admissionController.PatientAdmissionList[index].admissionNo}"),

                                        Expanded(
                                          //margin: EdgeInsets.fromLTRB(0, 4, 0,4),
                                            child: EachField("Patient name : ", "${admissionController.PatientAdmissionList[index].patientName}")

                                        ),
                                        Expanded(child: EachField("Doctor Name : ",("${admissionController.PatientAdmissionList[index].providerName.toString()}"))),

                                        Expanded(child:
                                        EachField("Room name", "${admissionController.PatientAdmissionList[index].roomName}")
                                        ),
                                        Expanded(child:
                                        EachField("Location", "${admissionController.PatientAdmissionList[index].locationName}")
                                        ),
                                        Expanded(child:
                                        EachField("Admission Date", "${admissionController.PatientAdmissionList[index].admissionDate}")
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ),
                        );
                      }))
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
