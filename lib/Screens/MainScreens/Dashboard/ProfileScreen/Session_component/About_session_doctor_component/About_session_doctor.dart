import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/Session_component/About_session_doctor_component/About_session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../ModelClass/AvailableTimeForDoctorModel.dart';
import '../../../../../../ModelClass/about_session_doctor_model.dart';

class AboutSessionDoctor extends StatelessWidget {
  AboutSessionDoctor({super.key});

  AboutSessionController aboutSessionController = Get.put(
      AboutSessionController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutSessionController>(
      init: aboutSessionController,
      builder: (aboutSessionController) {
        return Scaffold(
          appBar: AppBar(
            title: Text("About Session Doctor"),
          ),
          body: Column(
            children: [
              Text("Spid is :: ${aboutSessionController.specialityId}"),
              Text("Doct is :: ${aboutSessionController.doctorId}"),
              Container(
                height:100,
                child: GestureDetector(
                    onTap: (){
                      aboutSessionController.selectedDate(context);
                    },
                    child: Icon(Icons.calendar_month_rounded)),
              ),
              aboutSessionController.IsLoading==true?CircularProgressIndicator():
              aboutSessionController.sessionDates.length==0?Text("No Dates"):
              Container(
                height: 100,
              child: ListView.builder(
                  itemCount: aboutSessionController.sessionDates.length,
                  scrollDirection:Axis.horizontal,
                  itemBuilder: (context,index){
                    var SessionList= aboutSessionController.sessionDates;
                    return Container(
                      height: 10,
                      width:90,
                      child: GestureDetector(
                        onTap: (){
                          aboutSessionController.FilterDates(SessionList[index]);

                          //session_Invoice_controller.SetSessionSpidAndDoctid(SessionList[index].specializationId!,SessionList[index].providerId!);
                        },
                        child: Card(
                          elevation: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
Text(SessionList[index].toString())

                              //Text(session_Invoice_controller.SessionDoctorsList[index].departmentName.toString())
                            ],
                          ),
                        ),
                      ),
                    );

                  }),
              ),
              Container(
                height: 50,
                child: ListView.builder(
                    itemCount: aboutSessionController.foundTimes.length,
                    scrollDirection:Axis.horizontal,
                    itemBuilder: (context,index){
                      var SessionTimes= aboutSessionController.foundTimes;
                      return Container(
                        height: 10,
                        width:90,
                        child: GestureDetector(
                          onTap: (){
                           // aboutSessionController.FilterDates(SessionTimes[index]!);
aboutSessionController.FilterSlotsSelection(SessionTimes[index]!);
                            //session_Invoice_controller.SetSessionSpidAndDoctid(SessionList[index].specializationId!,SessionList[index].providerId!);
                          },
                          child: Card(
                            elevation: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(SessionTimes[index].toString())

                                //Text(session_Invoice_controller.SessionDoctorsList[index].departmentName.toString())
                              ],
                            ),
                          ),
                        ),
                      );

                    }),
              ),




              Container(

                height: 200,
                color:Colors.white,


                width:double.infinity,

                // Adjust height as needed
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of rows you want
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.4, // Adjust as needed for item width/height ratio
                    ),
                    itemCount:aboutSessionController.slots?.length, // Number of items
                    itemBuilder: (context, index) {
                     // final allSlots = aboutSessionController.SlotsTimes.expand((list) => list).toList();
                     // print("printing length of slottims are ${allSlots.length}");
                      //print("Names of slots are ${allSlots[index].slotName}");
                      final TimeSlot=aboutSessionController. slots?[index];
                      //bool Isselected=controller.selectedSpecialityIndexGrid==index;
                      bool IsTimeSelected=aboutSessionController.SelectedTimeIndex==index;

                      return Container(

                        height:10,
                        width:25,
                        color: Color(0xFFFFFFFF),


                        // width: 550, // Fixed width for each card
                        child: GestureDetector(
                          onTap: () {

                            aboutSessionController.selectedTime(index);


                            print(index);
                            // aboutSessionController.selectedTime(index);
                            // if(aboutSessionController.SelectedTimeIndex==index){
                            //
                            // }
                            //controller.SelectedSpecialityIduser(controller.Specialities[index]['specialityId']);
                            //controller.doctorList=[];
                            //controller.GetAllDoctors();

                            //print("selected Index is : ${controller.Specialities[index]['specialityId']}");
                          },
                          child:Card(
                            //color: Isselected?Color(0xFF5E55EA):Colors.white,
                            color: IsTimeSelected?
                            Color(0xFF5E55EA):Colors.white,
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Icon(Icons.local_hospital,color: Isselected?Colors.white:Colors.black,),
                             Text(
                             aboutSessionController.slots![index].slotCount.toString()
                            //        // allSlots[index].slotTime.toString()
                            // //    style: TextStyle(
                            // // color:IsTimeSelected?Colors.white:Colors.black
                             ),




                                ],
                              ),



                            ),
                          ),
                        ),
                      );
                    }


                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: aboutSessionController.AboutSessionDoctorList.length,
              //     itemBuilder: (context, index) {
              //       AboutSessionDoctorModel data = aboutSessionController.AboutSessionDoctorList[index];
              //       print("DATA FROM LIST IS $data");
              //       return Container(
              //         height: 10,
              //         width: 90,
              //         child: GestureDetector(
              //           onTap: () {
              //             //aboutSessionController.FilterDates(SessionList[index]);
              //
              //             //session_Invoice_controller.SetSessionSpidAndDoctid(SessionList[index].specializationId!,SessionList[index].providerId!);
              //           },
              //           child: Card(
              //             elevation: 1,
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 Text(data.data![0].date.toString()),
              //                 //Text(session_Invoice_controller.SessionDoctorsList[index].departmentName.toString())
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Container(
              //   height: 200,
              //   color: Colors.white,
              //   width: double.infinity,
              //   child: GridView.builder(
              //     scrollDirection: Axis.horizontal,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 4, // Number of rows you want
              //       mainAxisSpacing: 10.0,
              //       crossAxisSpacing: 10.0,
              //       childAspectRatio: 0.4, // Adjust as needed for item width/height ratio
              //     ),
              //     itemCount: aboutSessionController.AboutSessionDoctorList[0].data?[0].slots?.length, // Number of items
              //     itemBuilder: (context, index) {
              //       int listIndex = index ~/ 4; // Calculate the index of AboutSessionDoctorList
              //       int dataIndex = index % 4;
              //       if (listIndex < aboutSessionController.AboutSessionDoctorList.length &&
              //           dataIndex < aboutSessionController.AboutSessionDoctorList[listIndex].data!.length) {
              //         var data = aboutSessionController.AboutSessionDoctorList[listIndex].data?[dataIndex].slots;
              //         var slot = data?[dataIndex].slotName!;
              //         bool IsTimeSelected = aboutSessionController.SelectedTimeIndex == index;
              //         return Container(
              //           height: 10,
              //           width: 25,
              //           color: Color(0xFFFFFFFF),
              //           child: GestureDetector(
              //             onTap: () {
              //               print(index);
              //               aboutSessionController.selectedTime(index);
              //               if (aboutSessionController.SelectedTimeIndex == index) {}
              //             },
              //             child: Card(
              //               color:  Color(0xFF5E55EA) ,
              //               elevation: 4,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(5.0),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       slot.toString(),
              //                       style: TextStyle(
              //                         color: IsTimeSelected ? Colors.white : Colors.black,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         );
              //         // ...
              //       } else {
              //         // Return an empty container or a placeholder widget if the index is out of range
              //         return Container();
              //       }
              //       var data = aboutSessionController.AboutSessionDoctorList[listIndex].data?[dataIndex].slots;
              //       var slot = data?[dataIndex].slotName!;
              //
              //
              //     },
              //   ),
              // ),
            ElevatedButton(onPressed: (){
          aboutSessionController.BookFreeSession();
            }, child:Text("Book Session"))
            ],

          ),
        );
      },
    );
  }
}

                // child: ListView.builder(
                //     itemCount: aboutSessionController.SessionDoctorDates.length,
                //     scrollDirection:Axis.horizontal,
                //     itemBuilder: (context,index){
                //       var SessionList= aboutSessionController.SessionDoctorDates;
                //       return Container(
                //         height: 10,
                //         width:90,
                //         child: GestureDetector(
                //           onTap: (){
                //             aboutSessionController.FilterDates(SessionList[index]);
                //
                //             //session_Invoice_controller.SetSessionSpidAndDoctid(SessionList[index].specializationId!,SessionList[index].providerId!);
                //           },
                //           child: Card(
                //             elevation: 1,
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //
                //                 Text(aboutSessionController.SessionDoctorDates[index].toString()),
                //                 //Text(session_Invoice_controller.SessionDoctorsList[index].departmentName.toString())
                //               ],
                //             ),
                //           ),
                //         ),
                //       );
                //
                //     }),


              // Container(
              //
              //   height: 200,
              //   color:Colors.white,
              //
              //
              //   width:double.infinity,
              //
              //   // Adjust height as needed
              //   child: GridView.builder(
              //       scrollDirection: Axis.horizontal,
              //
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 4, // Number of rows you want
              //         mainAxisSpacing: 10.0,
              //         crossAxisSpacing: 10.0,
              //         childAspectRatio: 0.4, // Adjust as needed for item width/height ratio
              //       ),
              //       itemCount:aboutSessionController.SlotsTimes.length, // Number of items
              //       itemBuilder: (context, index) {
              //         final allSlots = aboutSessionController.SlotsTimes.expand((list) => list).toList();
              //         print("printing length of slottims are ${allSlots.length}");
              //         print("Names of slots are ${allSlots[index].slotName}");
              //         final TimeSlot=aboutSessionController. SlotsTimes[index];
              //         //bool Isselected=controller.selectedSpecialityIndexGrid==index;
              //         bool IsTimeSelected=aboutSessionController.SelectedTimeIndex==index;
              //
              //         return Container(
              //
              //           height:10,
              //           width:25,
              //           color: Color(0xFFFFFFFF),
              //
              //
              //           // width: 550, // Fixed width for each card
              //           child: GestureDetector(
              //             onTap: () {
              //
              //
              //
              //
              //               print(index);
              //               aboutSessionController.selectedTime(index);
              //               if(aboutSessionController.SelectedTimeIndex==index){
              //
              //               }
              //               //controller.SelectedSpecialityIduser(controller.Specialities[index]['specialityId']);
              //               //controller.doctorList=[];
              //               //controller.GetAllDoctors();
              //
              //               //print("selected Index is : ${controller.Specialities[index]['specialityId']}");
              //             },
              //             child:Card(
              //               //color: Isselected?Color(0xFF5E55EA):Colors.white,
              //               color: IsTimeSelected?
              //               Color(0xFF5E55EA):Colors.white,
              //               elevation: 4,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(5.0),
              //
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     //Icon(Icons.local_hospital,color: Isselected?Colors.white:Colors.black,),
              //                     Text(
              //                       allSlots[index].slotTime.toString()
              //                 ,  style: TextStyle(
              //               color:IsTimeSelected?Colors.white:Colors.black
              //               ),
              //
              //
              //                     )
              //
              //                   ],
              //                 ),
              //
              //
              //
              //               ),
              //             ),
              //           ),
              //         );
              //       }
              //
              //
              //   ),
              // ),

