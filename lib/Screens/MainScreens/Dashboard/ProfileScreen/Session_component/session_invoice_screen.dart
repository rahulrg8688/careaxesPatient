import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/Session_component/session_invoice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SessionInvoiceScreen extends StatelessWidget {
   SessionInvoiceScreen({super.key});
  SessionInvoiceController session_Invoice_controller=Get.put(SessionInvoiceController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SessionInvoiceController>(
      builder: (session_Invoice_controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Session Invoice"),
          ),
          body: Column(

            children:[
              Container(
                  height: 52,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.92,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                          begin: Alignment(-1, 0),
                          end: Alignment(1, 0),
                          colors: <Color>[Color(0xFFFFF4F4), Color(0xFFF9F4FF)],
                          stops: <double>[0, 1]
                      )
                  ),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: session_Invoice_controller.Sessions.length,
                                    itemBuilder: (context, index) {
                                      bool isSelected=index==session_Invoice_controller.TypeOfConsultation;
                                      return InkWell(
                                        onTap: (){

                                          session_Invoice_controller.Click(index);

                                          if(index==session_Invoice_controller.TypeOfConsultation){


                                          }

                                        },
                                        child: Center(
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                            child:
                                            Container(
                                              width: 120,
                                              height:30,
                                              //margin: EdgeInsets.only(left: 20,right: 20),
                                              decoration: BoxDecoration(
                                                  color:isSelected?Colors.white:Colors.transparent,
                                                  borderRadius: BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color:isSelected?Colors.white:Colors.transparent,
                                                  )
                                              ),
                                              child: Center(
                                                child: Text(session_Invoice_controller
                                                    .Sessions[index],
                                                  style: TextStyle(
                                                      color:isSelected?Colors.black:Colors.black
                                                  ),
                                                ),
                                              ),
                                            )),
                                      );
                                    }
                                )
                            )
                          ]
                      )
                  )
              ),

              session_Invoice_controller.isLoading?CircularProgressIndicator(

                ):
              Expanded(

                child:
                ListView.builder(
                    itemCount: session_Invoice_controller.SessionDoctorsList.length,
                    itemBuilder: (context,index){
                     var SessionList= session_Invoice_controller.SessionDoctorsList;
                      return Padding(padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0,0),

                        child: Container(
                          height: 140,
                          width:210,
                          child: GestureDetector(
                            onTap: (){
                            session_Invoice_controller.SetSessionSpidAndDoctid(SessionList[index].specializationId!,SessionList[index].providerId!);
                            },
                            child: Card(
                              elevation: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      height:120,
                                      width:120,
                                      decoration: BoxDecoration(
                                        shape:BoxShape.circle,
                                        border: Border.all(
                                          color:Color(0xFF5E55EA),
                                          width:2.0,
                                        ),
                
                                      ),
                                      child: Center(child: ClipOval(child: Image.asset('assets/DoctorImages/dr_2.png',fit: BoxFit.cover,)))),
                
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(session_Invoice_controller.SessionDoctorsList[index].fullName.toString()),
                                      Text(session_Invoice_controller.SessionDoctorsList[index].departmentName.toString())
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                
                    }),
              ),
            ]

          ),
        );
      }
    );
  }
}
