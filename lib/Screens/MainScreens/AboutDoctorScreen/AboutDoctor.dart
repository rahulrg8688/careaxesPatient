import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';

import '../../../ModelClass/DoctorsModel.dart';
import 'AboutDoctorController.dart';

class Aboutdoctor extends StatefulWidget {
  final Map<String, dynamic> DoctDetails;

  final Aboutdoctorcontroller aboutController;

  Aboutdoctor({Key? key, required this.DoctDetails})
      : aboutController =
            Get.put(Aboutdoctorcontroller(DoctDetails: DoctDetails)),
        super(key: key);

  @override
  State<Aboutdoctor> createState() => _AboutdoctorState();
}

class _AboutdoctorState extends State<Aboutdoctor> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.aboutController.setDoctorIdAndDoctorId(widget.DoctDetails);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return GetBuilder<Aboutdoctorcontroller>(builder: (aboutController) {
      // Ensure doctorabout has at least one item
      // if (controller.doctorabout.isEmpty) {
      //   return Scaffold(
      //     appBar: AppBar(
      //       title: Center(child: Text("About Doctor")),
      //       backgroundColor: Colors.white,
      //       elevation: 0,
      //     ),
      //     body: Center(child: Text("No doctor information available.")),
      //   );
      // }
      // String encodedImagePath =
      //     Uri.encodeComponent(aboutController.doctDetails?['ImagePath']);
      // print("Encoded path is ${encodedImagePath}");
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("About Doctor")),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: aboutController.IsLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1, -1),
                    end: Alignment(1, 0),
                    colors: <Color>[Color(0xFFF8F2FF), Color(0xFFFFFFFF)],
                    stops: <double>[0, 1],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Doctor Profile Section
                        Container(
                          margin: EdgeInsets.fromLTRB(width * 0.05,
                              height * 0.022, width * 0.05, height * 0.025),
                          //21, 20, 20, 22
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE2E2E2)),
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment(-1, 0),
                              end: Alignment(1, 0),
                              colors: <Color>[
                                Color(0xFFF8F2FF),
                                Color(0xFFFFFFFF)
                              ],
                              stops: <double>[0, 1],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x0F121212),
                                offset: Offset(0, 4),
                                blurRadius: 13,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Doctor Profile Image
                                Container(
                                  margin: EdgeInsets.only(right: width * 0.03),
                                  //12
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  // child: Image.network(
                                  //   "https://uat.careaxes.net/uat-qa-api/api/resources/get-profile-image?imagePath=${encodedImagePath}",
                                  //   fit: BoxFit.cover,
                                  //   alignment: const Alignment(-0.5, -0.6),
                                  //   height: height * 0.123,
                                  //   width:width * 0.25,//107,
                                  //
                                  //   colorBlendMode: BlendMode.lighten,
                                  //   errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                  //     // Fallback image displayed when there's an error (like 400 status)
                                  //     return Image.asset(
                                  //       'assets/DoctorImages/dr_2.png',
                                  //       width: width * 0.25,
                                  //       height: height*0.123,// Fallback image asset
                                  //       fit: BoxFit.cover,
                                  //       alignment: const Alignment(-0.5, -0.6),
                                  //     );
                                  //   },
                                  //   loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  //     // Display a loading indicator while the image is being loaded
                                  //     if (loadingProgress == null) {
                                  //       return child; // Image loaded successfully
                                  //     } else {
                                  //       return Center(
                                  //         child: CircularProgressIndicator(
                                  //           value: loadingProgress.expectedTotalBytes != null
                                  //               ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                  //               : null,
                                  //         ),
                                  //       );
                                  //     }
                                  //   },
                                  // ),
                                  child: Image.asset(
                                    "assets/DoctorImages/dr_2.png",
                                    height: height*0.123,//107,
                                    width: width*0.25,//85,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // height: height * 0.123, //107,
                                //                                       width: width * 0.25, //85,
                                // Doctor Information
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dr. ${aboutController.doctDetails?['DoctorName'].toString()}",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Row(
                                        children: [
                                          Icon(Icons.medical_information,
                                              size: 15,
                                              color: Color(0xFFC1C1C1)),
                                          SizedBox(width: width * 0.02),
                                          Text(
                                            aboutController.doctDetails?[
                                                    'speciality'] ??
                                                '',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xFFC1C1C1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.012),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // About Section
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              width * 0.05, 0, width * 0.05, 0),
                          //21, 0, 21, 5)
                          child: Text(
                            'About',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              width * 0.05, 0, width * 0.05, height * 0.015),
                          //21, 0, 23.4, 20
                          child: Text(
                            'Dr. ${aboutController.doctDetails?['DoctorName']} is professionally certified MBBS with more than 8+ years of experience. She has extensive knowledge of imaging and diagnostic procedures committed to delivering top care to all patients and providing a comfortable experience during procedures.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFFC1C1C1),
                            ),
                          ),
                        ),

                        // Select Date Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  width * 0.05, 0, width * 0.05, height * 0.01),
                              //21, 0, 21, 14
                              child: Text(
                                'Select date',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(width * 0.05, 0,
                                  width * 0.05, height * 0.015),
                              child: GestureDetector(
                                  onTap: () {
                                    // print("calender");
                                    widget.aboutController
                                        .selectedDate(context);
                                  },
                                  child: Icon(Icons.calendar_month_rounded)),
                            ),
                          ],
                        ),

                        Container(
                          child: Text(aboutController.date),
                        ),
                        widget.aboutController.DoctorAvailableDatesList
                                    .length ==
                                0
                            ? Container(
                                child: Text(
                                    "Doctor is not available on this date"),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.fromLTRB(
                                            width * 0.02, 0, 0, 0),
                                        width: double.infinity,
                                        height: height * 0.12,

                                        //
                                        // decoration: BoxDecoration(
                                        //   border:Border.all(width: 8,
                                        //
                                        //   )
                                        // ),

                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            controller: aboutController
                                                .scrollController,
                                            itemCount: aboutController
                                                .AvailableDatesOnly.length,
                                            itemBuilder: (context, index) {
                                              bool IsSelectedIndex =
                                                  aboutController
                                                          .DatesClickedListIndex ==
                                                      index;
                                              bool IsSelectedDate = widget
                                                      .aboutController.date ==
                                                  widget.aboutController
                                                      .AvailableDatesOnly[index]
                                                      .toString();

                                              DateTime date = aboutController
                                                      .AvailableDatesOnly[index]
                                                  ['Date'];
                                              print("Dayes is $date");
                                              String day = aboutController
                                                      .AvailableDatesOnly[index]
                                                  ['Day'];
                                              print("day is $day");
                                              String MonthText = GetMonthName(
                                                  date.month.toString());
                                              print("Month text is $MonthText");
                                              String WeekText =
                                                  GetWeekName(date.weekday);
                                              print("Weekend is $WeekText");
                                              final DateFormat formatter =
                                                  DateFormat('yyyy-MM-dd');
                                              final String formatted = formatter
                                                  .format(aboutController
                                                          .AvailableDatesOnly[
                                                      index]['Date']);
                                              print("formatted is $formatted");
                                              // aboutController
                                              //     .scrollToIndex(index);
                                              bool IsSameClicked =
                                                  aboutController.date ==
                                                      formatted;
                                              print(
                                                  "Controller date ois ${aboutController.date}");
                                              print(
                                                  "date is ${aboutController.AvailableDatesOnly[index]['Date']}");
                                              print(
                                                  "Is Sam,e clicked is $IsSameClicked");
                                              aboutController.scrollController.animateTo(aboutController.DatesClickedListIndex*70,

                                              duration: Duration(milliseconds: 100,),curve: Curves.fastOutSlowIn
                                              );

                                              return Container(
                                                width: width * 0.19, //80,
                                                height: height * 0.03, //120,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    print("Clicked");
                                                    aboutController
                                                        .DatesClickedIndex(
                                                            index);
                                                    aboutController.date =
                                                        widget
                                                            .aboutController
                                                            .AvailableDatesOnly[
                                                                index]['Date']
                                                            .toString();
                                                    String Date =
                                                        aboutController
                                                            .AvailableDatesOnly[
                                                                index]['Date']
                                                            .toString();

                                                    aboutController
                                                        .DoctorAvialableTimes(
                                                            Date: Date);
                                                  },
                                                  child: Card(
                                                    color: IsSelectedIndex ||
                                                            IsSameClicked
                                                        ? Color(0xFF5E55EA)
                                                        : Colors.white,
                                                    margin: EdgeInsets.all(10),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            date.day.toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 19,
                                                                color: IsSelectedIndex ||
                                                                        IsSameClicked
                                                                    ? Color(
                                                                        0xFFFFFFFF)
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                          Text(
                                                            WeekText,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 14,
                                                                color: IsSelectedIndex ||
                                                                        IsSameClicked
                                                                    ? Color(
                                                                        0xFFFFFFFF)
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                          Text(
                                                            MonthText,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 14,
                                                                color: IsSelectedIndex ||
                                                                        IsSameClicked
                                                                    ? Color(
                                                                        0xFFFFFFFF)
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })),
                                  ],
                                ),
                              ),

                        // Select Time Section
                        Container(
                          margin: EdgeInsets.fromLTRB(width * 0.05,
                              height * 0.015, width * 0.05, height * 0.009),
                          //21, 21, 21, 14
                          child: Text(
                            'Select Time',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        SelectTime(context),
                        aboutController.IsLoading
                            ? CircularProgressIndicator()
                            : Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: height * 0.2385, //200,

                                width: double.infinity,

                                child: Column(children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      aboutController.TimeSlots.length == 0 ||
                                              aboutController
                                                      .DoctorAvailableDatesList
                                                      .length ==
                                                  0
                                          ? Text("No data")
                                          : Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 5, 0, 0),
                                              height: height * 0.232, //200,
                                              color: Colors.white,

                                              width: double.infinity,

                                              // Adjust height as needed
                                              child: GridView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 4,
                                                    // Number of rows you want
                                                    mainAxisSpacing: 5.0,
                                                    crossAxisSpacing: 5.0,
                                                    childAspectRatio:
                                                        0.4, // Adjust as needed for item width/height ratio
                                                  ),
                                                  itemCount: aboutController
                                                      .TimeSlots.length,
                                                  // Number of items
                                                  itemBuilder:
                                                      (context, index) {
                                                    final TimeSlot =
                                                        aboutController
                                                            .TimeSlots[index];
                                                    //bool Isselected=controller.selectedSpecialityIndexGrid==index;
                                                    bool IsTimeSelected =
                                                        aboutController
                                                                .SelectedTimeIndex ==
                                                            index;

                                                    return Container(
                                                      height: height * 0.011,
                                                      width: width * 0.05,
                                                      color: Color(0xFFFFFFFF),

                                                      // width: 550, // Fixed width for each card
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          // print(index);
                                                          aboutController
                                                              .SlotTimes(index);
                                                          if (aboutController
                                                                  .SelectedTimeIndex ==
                                                              index) {
                                                            // print(
                                                            //     "Both are equal times ${ aboutController
                                                            //         .SelectedTimeIndex}");
                                                          }
                                                          //controller.SelectedSpecialityIduser(controller.Specialities[index]['specialityId']);
                                                          //controller.doctorList=[];
                                                          //controller.GetAllDoctors();

                                                          //print("selected Index is : ${controller.Specialities[index]['specialityId']}");
                                                        },
                                                        child: Card(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .black12,
                                                                  width: 1)),
                                                          //color: Isselected?Color(0xFF5E55EA):Colors.white,
                                                          color: IsTimeSelected
                                                              ? Color(
                                                                  0xFF5E55EA)
                                                              : Colors.white,
                                                          elevation: 0,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                //Icon(Icons.local_hospital,color: Isselected?Colors.white:Colors.black,),
                                                                Text(
                                                                  TimeSlot
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: IsTimeSelected
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                    ],
                                  )),
                                ]),
                              ),

                        // Online/Offline Selection
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(
                        //       width * 0.05, height * 0.005, width * 0.05, 0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(8),
                        //       color: Colors.white,
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: Color(0x0F121212),
                        //           offset: Offset(0, 4),
                        //           blurRadius: 13,
                        //         ),
                        //       ],
                        //     ),
                        //     child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceAround,
                        //         children: [
                        //           GestureDetector(
                        //             onTap: () {
                        //               // print("Online");
                        //               // Implement online status logic if needed
                        //             },
                        //             child: Container(
                        //               margin:
                        //                   EdgeInsets.symmetric(vertical: 15),
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(33),
                        //                 boxShadow: [
                        //                   BoxShadow(
                        //                     color: Color(0x0F121212),
                        //                     offset: Offset(0, 4),
                        //                     blurRadius: 13,
                        //                   ),
                        //                 ],
                        //               ),
                        //               child: Padding(
                        //                 padding: const EdgeInsets.symmetric(
                        //                     horizontal: 20, vertical: 10),
                        //                 child: Text(
                        //                   'Online',
                        //                   style: TextStyle(
                        //                     fontFamily: 'Poppins',
                        //                     fontWeight: FontWeight.w500,
                        //                     fontSize: 14,
                        //                     color: Color(0xFF000000),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           GestureDetector(
                        //             onTap: () {
                        //               // print("Offline");
                        //               // Example of calling a method in the controller
                        //             },
                        //             child: Container(
                        //               padding:
                        //                   EdgeInsets.symmetric(vertical: 10),
                        //               child: Text(
                        //                 'Offline',
                        //                 style: TextStyle(
                        //                   fontFamily: 'Poppins',
                        //                   fontWeight: FontWeight.w500,
                        //                   fontSize: 14,
                        //                   color: Color(0xFF000000),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ]),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(width * 0.03,
                                height * 0.002, width * 0.03, height * 0.02),
                            height: 60,
                            width: double.infinity,
                            child: aboutController
                                        .doctDetails?['IsReScheduled'] ==
                                    true
                                ? ElevatedButton(
                                    onPressed: () {
                                      aboutController.RescheduleAppointment();
                                    },
                                    child: Text("Reschedule Appointment"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF5E55EA),
                                      foregroundColor: Colors.white,
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      aboutController.NavigateToReviewScreen();
                                    },
                                    child: Text("Review Appointment"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF5E55EA),
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                          ),
                        )
                      ]),
                ),
              ),
      );
    });
  }

  String GetMonthName(String month) {
    switch (month) {
      case "1":
        return "Jan";
      case "2":
        return "Feb";
      case "3":
        return "Mar";
      case "4":
        return "Apr";
      case "5":
        return "may";
      case "6":
        return "Jun";
      case "7":
        return "Jul";
      case "8":
        return "Aug";
      case "9":
        return "sep";
      case "10":
        return "Oct";
      case "11":
        return "Nov";
      case "12":
        return "Dec";
      default:
        return '';
    }
  }

  String GetWeekName(int Weekday) {
    switch (Weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";

      default:
        return '';
    }
  }

  Widget SelectTime(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Center(
        child: Container(
            height: height * 0.06, //52,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                    begin: Alignment(-1, 0),
                    end: Alignment(1, 0),
                    colors: <Color>[Color(0xFFFFF4F4), Color(0xFFF9F4FF)],
                    stops: <double>[0, 1])),
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.aboutController.Sessions.length,
                          itemBuilder: (context, index) {
                            bool isSelected =
                                index == widget.aboutController.index;
                            return InkWell(
                              onTap: () {
                                // print(index);
                                widget.aboutController.Click(index);
                                if (index == widget.aboutController.index) {
                                  // print("yes clicked on ${widget
                                  //     .aboutController.Sessions[widget
                                  //     .aboutController.index]}");
                                }
                                // print(widget.aboutController
                                //     .Sessions[index]);
                              },
                              child: Center(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  child: Container(
                                width: width * 0.30, //120,
                                height: height * 0.03, //30,
                                //margin: EdgeInsets.only(left: 20,right: 20),
                                decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.transparent,
                                    )),
                                child: Center(
                                  child: Text(
                                    widget.aboutController.Sessions[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.black
                                          : Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              )),
                            );
                          }))
                ]))));
  }
}
