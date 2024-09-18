import 'package:careaxes_patient/Screens/MainScreens/ReviewAppointmentScreen/review_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ReviewAppointment extends StatelessWidget {

  ReviewAppointment({super.key
  });
  ReviewAppointmentController ReviewController=Get.put(ReviewAppointmentController());
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    print("Height is $height");
    print("Width is :: ${width}");
    return GetBuilder<ReviewAppointmentController>(
        builder: (ReviewController) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Review"),
            ),
            body: ReviewController.IsLoading?CircularProgressIndicator():SingleChildScrollView(
              child: Container(
                height: height*1.0,

                //margin:EdgeInsets.fromLTRB(21, 0, 20, 14) ,
                decoration: BoxDecoration(

                  gradient: LinearGradient(
                    begin: Alignment(0,-1),
                    end:Alignment(0,1),
                    colors: <Color>[Color(0xFFF8F2FF),Color(0xFFFFFFFF)],
                    stops: <double>[0,0.666],

                  ),
                ),
                child: Column(
                  children: [

                    Container(
                      margin:EdgeInsets.fromLTRB(width*0.040,height*0.040,width*0.050,height*0.002),
                      decoration: BoxDecoration(
                          border: Border.all(color:Color(0xFFE2E2E2)),
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment(1,0),
                            end:Alignment(1,0),
                            colors:<Color>[Color(0x1AA7FDFF),Color(0x1AD1ADFF)],
                            stops: <double>[0,1],

                          )
                      ),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(

                                flex: 2,
                                child: Image.asset(
                                  "assets/DoctorImages/dr_2.png",
                                  height:height*0.15,
                                  width: width*0.05,
                                  fit: BoxFit.cover,
                                ),),
                              Expanded(
                                  flex:3,
                                  child:Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: height*0.040,
                                          child:Text(ReviewController.ReviewDoctor['DoctorName'].toString(),
                                            style:
                                            TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Color(0xFF000000)
                                            )
                                            ,),
                                        ),
                                        SizedBox(
                                          height: height*0.040,
                                          child:Text(ReviewController.ReviewDoctor['speciality'].toString(),
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xFFC1C1C1),
                                            ),),
                                        ),


                                        Container(
                                          height: height*0.036,
                                          width:width*0.28,
                                          decoration: BoxDecoration(
                                              border: Border.all(color:Color(0xFF159500)),
                                              borderRadius: BorderRadius.circular(20),
                                              color: Color(0x4D159500)
                                          ),
                                          child: Center(child: Text("Online",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color:Color(0xFF159500),
                                            ),
                                          ),

                                          ),
                                        )

                                      ],
                                    ),
                                  ) )

                            ],

                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(width*0.045, height*0.018, width*0.045, height*0.018),
                        //20, 0, 20, 14
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0F121212),
                            offset: Offset(0, 4),
                            blurRadius: 13,
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(width*0.05, height*0.014, width*0.06, height*0.014),
                        //(22, 12, 21.3, 13),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, height*0.015),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Date of Appointment',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, height*0.014, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEFEEFD),
                                      borderRadius: BorderRadius.circular(15.5),
                                    ),
                                    child: Container(
                                      width: width*0.075,//31
                                      height: height*0.035,//31,
                                      padding: EdgeInsets.fromLTRB(width*0.02, height*0.01, width*0.02, height*0.01),
                                        //10, 9, 9, 9
                                      child:
                                      SizedBox(
                                        width: width*0.01,//12,
                                        height: height*0.02,//13,
                                        child: Icon(Icons.calendar_month,
                                        size: 13
                                        )
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, height*0.006, width*0.008, height*0.004),
                                  //0, 6, 8.3, 4
                                  child: Text(
                                    ReviewController.ConvertedDate,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFFC1C1C1),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, height*0.005, width*0.007, height*0.006),
                                    //(0, 5, 7, 6),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC1C1C1),
                                      ),
                                      child: Container(
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, height*0.006, 0, 4),
                                  //(0, 6, 0, 4)
                                  child: Text(
                                    ReviewController.Time,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFFC1C1C1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(width*0.05, 0,width*0.045, width*0.04),
                      //(21, 0, 19, 14)
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0F121212),
                            offset: Offset(0, 4),
                            blurRadius: 13,
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(width*0.045, height*0.026, width*0.07, width*0.05),
                        //22, 29.4, width*0.05
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, height*0.017),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Payment Information',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, height*0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, width*0.03, 0),
                                    child: SizedBox(
                                      width: width*0.5,//116
                                      child: Text(
                                        'Consultancy Fee',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xFFC1C1C1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, height*0.001, 0, height*0.000),
                                    child: Text(
                                      ReviewController.consulationCharges.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, height*0.008),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, width*0.025, 0),
                                    child: SizedBox(
                                      width: width*0.4,
                                      child: Text(
                                        'Platform Fee',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xFFC1C1C1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, height*0.005, 0, height*0.005),
                                    child: Text(
                                      '0.00',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, height*0.005),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, width*0.024, 0),
                                    child: SizedBox(
                                      width: width*0.4,
                                      child: Text(
                                        'Discount',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xFFC1C1C1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, height*0.005, 0, height*0.005),
                                    child: Text(
                                      '0.00',
                                      style: TextStyle(
                                        fontFamily:  'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, width*0.025, 0),
                                  child: SizedBox(
                                    width: width*0.4,
                                    child: Text(
                                      'Tax',
                                      style: TextStyle(
                                        fontFamily:  'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFFC1C1C1),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, height*0.005, 0, height*0.003),
                                  child: Text(
                                    '0.00',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, width*0.065, 0),
                      //26, 0, 18, 0
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:2,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, height*0.004, width*0.07, 8),
                              //0, 4, 28.7, 8
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, width*0.072, 2),
                                    child: Text(
                                      'Total',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFFC1C1C1),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(width*0.05, height*0.004, 0, 0),
                                        child: SizedBox(
                                          width: width*0.06,
                                          height: height*0.00010,
                                         child: Icon(Icons.currency_rupee_sharp,
                                         size: 15,
                                         ),
                                        ),
                                      ),
                                      Text(
                                        ReviewController.consulationCharges.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ReviewController.consulationCharges>0?
                          Expanded(
                            flex:3,
                            child: InkWell(
                              onTap: (){
                                ReviewController.PaymentBookAppointment();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF5E55EA),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, height*0.018, 0, height*0.018),
                                    //0, 16, 0, 16
                                    child:
                                    ReviewController.PaymentLoading?CircularProgressIndicator():
                                    Text(
                                      'Payment',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ):
                          Expanded(
                            flex:7,
                            child: InkWell(
                              onTap: (){
                                ReviewController.BookAppointment();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF5E55EA),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, height*0.018, 0, height*0.018),
                                    child:
                                    ReviewController.IsLoading?CircularProgressIndicator():
                                    Text(
                                      'Book',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
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
            ),
          );
        }
    );
  }
}
