//import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyPrescriptions/prescriptions_controller.dart';
import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/MyRecords/MyPrescriptions/prescriptions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/adapters.dart';

class PrescriptionsScreen extends StatelessWidget {
   PrescriptionsScreen({super.key});
  PrescriptionsController prescriptions_controller=Get.put(PrescriptionsController());


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;

    return GetBuilder<PrescriptionsController>(

      builder: (prescriptions_controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("My Prescriptions"),
          ),
          body:Container(
            color:Colors.white12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                prescriptions_controller.IsLoading?CircularProgressIndicator():
              Expanded(
                child: ListView.builder(
                    itemCount: prescriptions_controller.FilteredPrescriptionDoctors.length,
                    itemBuilder: (context,index){
                      final FilteredDoctors=prescriptions_controller.FilteredPrescriptionDoctors[index];
                      return Container(
                        height:height*0.137,//118,

                        width:width,
                        margin: EdgeInsets.fromLTRB(width*0.037,  height*0.0067, width*0.037, height*0.0067),
                        //15, 6, 15, 6
                        color:Colors.white,
                        child: ListTile(
                          style:ListTileStyle.drawer,

                          leading: Container(
                              height: height*0.052,//45,
                              width:width*0.111,//45,
                              color:Color(0xFFA6A6A6),
                              child: Image.asset("assets/DoctorImages/Dr.Akhil_image.png"),

                          ),

                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(FilteredDoctors.providerName.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Satoshi",
                                fontWeight: FontWeight.w400,
                                color:Color(0xFF000000)
                              ),
                              ),
                              Text(FilteredDoctors.specializationName.toString().capitalizeFirst!,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Satoshi",
                                fontSize: 13,
                                fontStyle:FontStyle.normal,
                                color:Color(0xFFC1C1C1)
                              ),
                              ),
                              ElevatedButton(onPressed: (){}, child: Text("Download",
                              style:TextStyle(
                                fontStyle:FontStyle.normal,
                                fontFamily: "Satoshi",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.visible

                              ),
                                textAlign: TextAlign.center,
                              ),

                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(width*0.30,height*0.03),
                                shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                backgroundColor: Color(0xFF2F80ED),
                                foregroundColor: Colors.white,

                              ),
                              )
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: (){
                              prescriptions_controller.SetEncounterType(
                                FilteredDoctors.encounterType
                              );
                              prescriptions_controller?.onNavigateToWebView(
                                FilteredDoctors.encryptedAppointmentId,
                                Key: "Prescriptions"
                              );
                            },
                            child: Container(
                              height: height*0.04,//36,
                              width: width*0.087,//36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:Color(0xFFD9D9D9),
                              ),
                              child: Icon(Icons.visibility_outlined,

                              size: 16,
                              color:Colors.blueAccent
                              ),
                            ),
                          ),
                        ),
                      );

                }),
              )
                ]
            ),
          )
        );
      }
    );
  }
}
