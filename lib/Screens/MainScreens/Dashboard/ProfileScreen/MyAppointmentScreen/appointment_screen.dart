import 'package:careaxes_patient/ModelClass/GetDoctorBookings.dart';
import 'package:careaxes_patient/Screens/MainScreens/AboutDoctorScreen/AboutDoctor.dart';
import 'package:careaxes_patient/Screens/MainScreens/AboutDoctorScreen/AboutDoctorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import 'appointment_controller.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});
  AppointmentController appointment_controller =
      Get.put(AppointmentController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(builder: (appointment_controller) {
      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;

      return Scaffold(
          appBar: AppBar(
            title: Text("My Appointments"),
            backgroundColor: Color(0xFFFFFFFF),
          ),
          body: Container(
            color: Colors.white30,
            //margin: EdgeInsets.fromLTRB(width*0.05, height*0.02,width*0.01,height*0.01),
            child: Column(
              children: [
                Container(
                  height: height * 0.08,
                  width: width * 0.90,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFEFEFE)),
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        begin: Alignment(-1, 0),
                        end: Alignment(1, 0),
                        colors: <Color>[Color(0xFFFFF8F8), Color(0xFFF9F4FF)],
                        stops: <double>[0, 1],
                      )),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: appointment_controller
                                    .RecentAndScheduledText.length,
                                itemBuilder: (context, index) {
                                  bool isSelected = index ==
                                      appointment_controller
                                          .indexOfScheduledAndRecentText;
                                  return GestureDetector(
                                    onTap: () {
                                      print(index);
                                      appointment_controller.Click(index);
                                      if (index ==
                                          appointment_controller
                                              .indexOfScheduledAndRecentText) {
                                        print(
                                            "yes clicked on ${appointment_controller.RecentAndScheduledText[appointment_controller.indexOfScheduledAndRecentText]}");
                                      }
                                      // print(aboutController.Sessions[index]);
                                    },
                                    child: Center(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        child: Container(
                                      width: width*0.40,//180,
                                      height: height*0.035,//30,
                                      //margin: EdgeInsets.only(left: 20,right: 20),
                                      decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.white70
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.transparent,
                                            width: width*0.00001,
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Text(
                                              appointment_controller
                                                      .RecentAndScheduledText[
                                                  index],
                                              style: TextStyle(
                                                  color: isSelected
                                                      ? Colors.black
                                                      : Colors.black12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                  );
                                })),
                      ],
                    ),
                  ),
                ),
                appointment_controller.IsLoading
                    ? CircularProgressIndicator()
                    :appointment_controller.AppointmentDoctors.length==0?Text("No Data"): Expanded(
                        child: ListView.builder(

                            scrollDirection: Axis.vertical,
                            itemCount: appointment_controller
                                .AppointmentDoctors.length,
                            itemBuilder: (context, index) {
                              String formattedDate = ConvertDateIntoFormat(
                                  appointment_controller
                                      .AppointmentDoctors[index]
                                      .appointmentDate);
                              //bool CanReSchedule=appointment_controller.AppointmentDoctors[index].appointmentDate<DateTime.now();
                              //print("Can Reschedule is :: $CanReSchedule");
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 0, 8.0, 0),
                                //(8.0, 0, 8.0, 0)
                                child: Stack(
                                  children:[ Container(
                                    width: width,
                                    height: height * 0.324,
                                    margin: EdgeInsets.fromLTRB(2, height*0.010, height*0.010, 0),
                                    child: GestureDetector(
                                      onTap: (){
                                        print("Clicking on appointment");
                                        if(appointment_controller.AppointmentDoctors[index].active==true){
                                          appointment_controller.onNavigateToWebView(

                                            appointment_controller.AppointmentDoctors[index].encryptedAppointmentId,
                                            ReceiptId: false,
                                            Key: "Appointments"
                                          );
                                        }
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 0,
                                        margin: EdgeInsets.symmetric(vertical: 4),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      height: height*0.125,//107,
                                                      width: width*0.24,//98,
                                                      margin: EdgeInsets.fromLTRB(
                                                          width*0.02, 0, width*0.02, 0),
                                                      child: Center(
                                                          child: Image.asset(
                                                        'assets/DoctorImages/dr_2.png',
                                                        fit: BoxFit.cover,
                                                      ))),
                                                  Container(
                                                    height: height*0.1,//89.29,
                                                    width: width*0.42,//180,
                                                    margin: EdgeInsets.fromLTRB(
                                                        width*0.05, height*0.02, 0, height*0.03),
                                                    //7, 9, 0, 4
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                            appointment_controller
                                                                .AppointmentDoctors[
                                                                    index]
                                                                .providerName!
                                                                .capitalize!,
                                                            style: TextStyle(
                                                              fontFamily: 'Poppins',
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize: 16,
                                                              color:
                                                                  Color(0xFF000000),
                                                            )),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,

                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                      0, 0, 5, 0),
                                                              child: Icon(
                                                                Icons
                                                                    .medical_information,
                                                                size: 15,
                                                                color: Color(
                                                                    0xFFC1C1C1),
                                                              ),
                                                            ),
                                                            Text(
                                                              appointment_controller
                                                                  .AppointmentDoctors[
                                                                      index]
                                                                  .specializationName!
                                                                  .capitalize!,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xFFC1C1C1),
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //appointment_controller.AppointmentDoctors[index].ca

                                                ],
                                              ),
                                              Divider(
                                                color: Colors.black12,
                                              ),
                                              SizedBox(
                                                height: height*0.03,//12,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  widgetOfCalenderAndTime(
                                                      Icons.calendar_month,
                                                      formattedDate),
                                                  widgetOfCalenderAndTime(
                                                      Icons.alarm,
                                                      appointment_controller
                                                          .AppointmentDoctors[index]
                                                          .appointmentTimeString),
                                                ],
                                              ),
                                              SizedBox(
                                                height: height*0.02,
                                              ),
                                              appointment_controller
                                                          .indexOfScheduledAndRecentText ==
                                                      1
                                                  ? ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Book Again",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: "Poppins",
                                                            color:
                                                                Color(0xFF5E55EA)),
                                                      ),
                                                      style:
                                                          ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.purple.shade50,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(8),
                                                            side: BorderSide(
                                                                width: 1.0,
                                                                color: Colors.purple.shade100
                                                                    )),
                                                        fixedSize:
                                                            Size(width, height*0.03),
                                                        foregroundColor:
                                                            Color(0xFF5E55EA),
                                                      ),
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [

                                                        ElevatedButton(
                                                          onPressed: FindOutDiffBetweenDates(appointment_controller.AppointmentDoctors[index].appointmentDate.toString())==false?null: () {

                                                            print(
                                                                "cancelled appointment is ${appointment_controller.AppointmentDoctors[index].providerName}");
                                                            appointment_controller
                                                                .CancelAppointment(
                                                                    appointment_controller
                                                                            .AppointmentDoctors[
                                                                        index]);
                                                          },
                                                          child:appointment_controller.CancelLoading?CircularProgressIndicator(): Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                fontFamily:
                                                                    "Poppins",
                                                                color: Color(
                                                                    0xFF000000)),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.white70,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                side: BorderSide(
                                                                    width: 1.0,
                                                                    color: Color(
                                                                        0xFFC4C4C4))),
                                                            fixedSize: Size(
                                                                width * 0.30, height*0.03),
                                                            foregroundColor:
                                                                Colors.black,
                                                          ),
                                                        ),
                                                        FindOutDiffBetweenDates(appointment_controller.AppointmentDoctors[index].appointmentDate.toString()) && appointment_controller.AppointmentDoctors[index].callType!=1?

                                                        ElevatedButton(
                                                            onPressed: () {
                                                              final appointmentList=appointment_controller.AppointmentDoctors[index];
                                                              var ModelDoctor = {
                                                                'DoctorName': appointmentList.providerName,
                                                                'DoctorId': appointmentList.providerId,
                                                                'speciality': appointmentList.specializationName,
                                                                'specialityId': appointmentList.specializationId,
                                                                'DepartmentId':Aboutdoctorcontroller().DepartmentId,
                                                                'IsReScheduled':true,
                                                                'SlotValue':appointmentList.appointmentTimeString,
                                                                'AppointmentId':appointmentList.appointmentId,
                                                                'ProviderAvailabiityId':appointmentList.providerAvailabilityId,
                                                                'Date':appointmentList.appointmentDate,


                                                              };
                                                              Get.toNamed("/AboutDoctor",arguments: {'DoctDetails':ModelDoctor});
                                                            },
                                                            child:
                                                                Text("Re-schedule"),
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFF2F80ED),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  9),
                                                                      side: BorderSide(
                                                                          width:
                                                                              1.0,
                                                                          color: Color(
                                                                              0xFF2F80ED)),
                                                                    ),
                                                                    fixedSize: Size(
                                                                        width*0.35, height*0.03),
                                                                    foregroundColor:
                                                                        Color(
                                                                            0xFFFFFFFF))): appointment_controller.AppointmentDoctors[index].telemedicineIds!=null ||
                                                            appointment_controller.AppointmentDoctors[index].isPrescription==true||
                                                            appointment_controller.AppointmentDoctors[index].isFullTranscript==true?Container(
                                                                child:ElevatedButton(
                                                                  onPressed: () {},
                                                                  child: Text(
                                                                    "Book Again",
                                                                    style: TextStyle(
                                                                        fontSize: 16,
                                                                        fontWeight:
                                                                        FontWeight.w500,
                                                                        fontFamily: "Poppins",
                                                                        color:
                                                                        Color(0xFF5E55EA)),
                                                                  ),
                                                                  style:
                                                                  ElevatedButton.styleFrom(
                                                                    backgroundColor:
                                                                    Colors.purple.shade50,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                        side: BorderSide(
                                                                            width: 1.0,
                                                                            color: Colors.purple.shade100
                                                                        )),
                                                                    fixedSize:
                                                                    Size(width/2, height*0.04),
                                                                    foregroundColor:
                                                                    Color(0xFF5E55EA),
                                                                  ),
                                                                )
                                                        ):Container(
                                                          width:width/2
                                                        )
                                                      ],
                                                    ),


                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                    appointment_controller.AppointmentDoctors[index].telemedicineIds!=null ||
                                        appointment_controller.AppointmentDoctors[index].isPrescription==true||
                                  appointment_controller.AppointmentDoctors[index].isFullTranscript==true
                                  ?Positioned(
                                        //bottom: 130,
                                        top:height*0.017,
                                        left:width*0.72,//295,
                                        //right:100,
                                        child: Container(
                                            height: height*0.025,
                                            width:width*0.2,//86,

                                            decoration:BoxDecoration(
                                              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4),bottomRight: Radius.circular(4)),
                                              color:appointment_controller
                                                  .indexOfScheduledAndRecentText ==1?Colors.red:Color(0xFF159500),
                                            ),
                                            child: Center(
                                              child: appointment_controller.indexOfScheduledAndRecentText==1?Text("Cancelled",
                                                style: TextStyle(
                                                    fontFamily:"Poppins",
                                                    fontWeight: FontWeight.w400,
                                                    color:Color(0xFFFFFFFF)
                                                ),
                                              ): Text("Completed",
                                              style: TextStyle(
                                                fontFamily:"Poppins",
                                                fontWeight: FontWeight.w400,
                                                color:Color(0xFFFFFFFF)
                                              ),
                                              )
                                              ),
                                            ),

                                        ):appointment_controller.indexOfScheduledAndRecentText==1?Positioned(
                                      //bottom: 130,
                                      top:height*0.017,
                                      left:width*0.72,
                                      //right:100,
                                      child: Container(
                                        height:  height*0.025,
                                        width:width*0.2,

                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4),bottomRight: Radius.circular(4)),
                                          color:appointment_controller
                                              .indexOfScheduledAndRecentText ==1?Colors.red:Color(0xFF159500),
                                        ),
                                        child: Center(
                                            child: appointment_controller.indexOfScheduledAndRecentText==1?Text("Cancelled",
                                              style: TextStyle(
                                                  fontFamily:"Poppins",
                                                  fontWeight: FontWeight.w400,
                                                  color:Color(0xFFFFFFFF)
                                              ),
                                            ): Text("Completed",
                                              style: TextStyle(
                                                  fontFamily:"Poppins",
                                                  fontWeight: FontWeight.w400,
                                                  color:Color(0xFFFFFFFF)
                                              ),
                                            )
                                        ),
                                      ),

                                    ):Container(),
                                    appointment_controller.AppointmentDoctors[index].callStatus==2?
                                    Positioned(
                                        top:height*0.06,//45,
                                        left:width*0.7,//290,
                                        child: Container(
                                            height: height*0.06,
                                            width:width*0.2,
                                            child: ElevatedButton(onPressed: (){}, child: Text("Join now",
                                            style:TextStyle(

                                            ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blueAccent.shade100,
                                              foregroundColor: Colors.white,


                                            ),
                                            )))
                                        :Container()
                                  ]),
                              );
                            }),
                      ),
              ],
            ),
          )

          // Expanded(
          //
          //
          //   child: ListView.builder(
          //       scrollDirection: Axis.vertical,
          //       itemCount: appointment_controller.AppointmentDoctors.length,
          //       itemBuilder: (context,index){
          //         return Padding(
          //           padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
          //           child: Container(
          //             width:double.infinity,
          //             child: Card(
          //               elevation: 2,
          //               margin: EdgeInsets.symmetric(vertical: 5),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(20.0),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                   //crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Container(
          //                         height:120,
          //                         width:120,
          //                         decoration: BoxDecoration(
          //                           shape:BoxShape.circle,
          //                           border: Border.all(
          //                             color:Color(0xFF5E55EA),
          //                             width:2.0,
          //                           ),
          //
          //                         ),
          //                         child: Center(child: ClipOval(child: Image.asset('assets/DoctorImages/dr_2.png',fit: BoxFit.cover,)))),
          //
          //                     Container(
          //                       margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: [
          //                           Text(
          //                               appointment_controller.AppointmentDoctors[index].providerName!.capitalize!,
          //                               style:TextStyle(
          //                                 fontFamily: 'Poppins',
          //                                 fontWeight: FontWeight.w500,
          //                                 fontSize: 16,
          //                                 color:Color(0xFF000000),
          //                               )
          //                           ),
          //                           Row(
          //                             children: [
          //                               Container(
          //                                 margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
          //                                 child: Icon(Icons.medical_information,size: 15,
          //                                   color:Color(0xFFC1C1C1) ,
          //                                 ),
          //
          //                               ),
          //                               Text(appointment_controller.AppointmentDoctors[index].specializationName!.capitalize!,
          //                                 style: TextStyle(
          //                                   fontFamily: 'Poppins',
          //                                   fontWeight: FontWeight.w400,
          //                                   fontSize: 14,
          //                                   color:Color(0xFFC1C1C1),
          //                                 ),
          //                               ),
          //                             ],
          //                           )
          //
          //
          //
          //                         ],
          //                       ),
          //                     ),
          //
          //
          //
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         );
          //       }),
          // ),

          );
    });
  }

  String ConvertDateIntoFormat(String Date) {
    DateFormat format = DateFormat('EEEE dd MMMM yyyy');
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(Date);
    String FormatedString = format.format(dateTime);
    return FormatedString;
  }
  bool FindOutDiffBetweenDates(String Date){
    print("Passed date is :: $Date");
    DateTime dateTime=DateFormat('yyyy-MM-ddThh:mm:ss').parse(Date);
    final differenceInDays=dateTime.difference(DateTime.now()).inDays;
    print("Difference in days is $differenceInDays");
    if(differenceInDays>0){
      return true;
    }
    return false;
  }

  Widget widgetOfCalenderAndTime(IconData icon, String text) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Icon(
              icon,
              size: 20,
            ),
          ),
          Container(
            child: Text(text),
          )
        ],
      ),
    );
  }

}
