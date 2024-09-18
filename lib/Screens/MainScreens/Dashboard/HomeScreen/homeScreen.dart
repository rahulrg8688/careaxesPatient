import 'package:careaxes_patient/ApiService/Api_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
// import 'package:patient_application/GetStorage/shared_prefs_service.dart';
// import 'package:patient_application/Screens/phonenumberScreen/PhoneNumber/PhoneNumberController.dart';
// //import 'package:patient_application/Screens/MainScreens/HomeScreen/homeController.dart';

import '../../../../GetStorage/shared_prefs_service.dart';
import '../../../../ModelClass/search_doctors_modelList.dart';
import 'homeController.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});


  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final homeController controller = Get.put(homeController());

  OverlayEntry? overlayEntry;
  String _imagePath = 'assets/DoctorImages/dr_2.png'; // Default local image
  Future<void>? _fetchImageFuture;

  final LayerLink layerLink = LayerLink();

  final GlobalKey searchBoxKey = GlobalKey();
  ApiService apiService=ApiService.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(SharedPrefsService().GetPatientName()==""){
      print("ture");


    }

  }



  void showOverlay(BuildContext context) {
    overlayEntry = OverlayEntry(builder: (context) {
      return GetBuilder<homeController>(
        builder: (controller) {
          List<SearchedDoctorsModel> doctorsList = controller.SearchedDoctors;
          RenderBox? renderBox =
              searchBoxKey.currentContext?.findRenderObject() as RenderBox?;
           
          if (renderBox == null) {
            return SizedBox();
          }
          Size size = renderBox.size;
          Offset offset = renderBox.localToGlobal(Offset.zero);

          // Check if SearchedDoctors list is empty, then remove overlay
          if (controller.SearchedDoctors.isEmpty) {
            overlayEntry?.remove();
            overlayEntry = null;
          }

          return Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: layerLink,
              showWhenUnlinked: false,
              offset: Offset(0.0, size.height + 5.0),
              child: Material(
                elevation: 4.0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 180.r),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.SearchedDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = controller.SearchedDoctors[index];
                      var ModelDoctor = {
                        'DoctorName': doctor.fullName,
                        'DoctorId': doctor.providerId,
                        'speciality': doctor.specializationName,
                        'specialityId': doctor.specializationId,
                        'DepartmentId':doctor.departmentId,
                      };

                      return ListTile(
                        title: Text(doctor.fullName!),
                        subtitle: Text(doctor.specializationName.toString()),
                        onTap: () {
                          controller.UpdateDoctorDetail(ModelDoctor as Map<String, dynamic>);
                          controller.DoctorParticularClick(spid: doctor.specializationId);
                          overlayEntry?.remove();
                          overlayEntry = null;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      );
    });

    Overlay.of(context).insert(overlayEntry!);
  }

  void hideOverlay(OverlayEntry overlayEntry) {
    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {


    final size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;
    return GetBuilder<homeController>(builder: (controller) {
      List Alldoctors = controller.doctorList;
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;
List carousal=controller.carousals();
 
      return PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {

            SystemNavigator.pop();
            if (didPop) {
              return;
            }

          },
          child: Scaffold(
              body: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        Center(
                          child: Container(
                            child: Stack(clipBehavior: Clip.none, children: [
                              Container(

                                color: Color(0xFFFFFFFF),
                                height: height*0.15,//130,
                                width: width,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(width*0.05, 0, width*0.06, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                          onTap:(){
                                          print("Yes clicked on profile");
                                          Get.toNamed("/MyprofileUpdate");
                                        },
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 0, width*0.08, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(
                                                            0, 0, width*0.03, 0),
                                                        width: width*0.15,
                                                        height: height*0.072,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  height*0.01),
                                                        ),
                                                        child: ClipOval(
                                                                                                child: Image
                                                                                                    .asset(
                                                                                                'assets/DoctorImages/patient_image.png',
                                                                                                  fit: BoxFit.cover,
                                                                                                ))),
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(
                                                            0, width*0.02, 0, height*0.01),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.fromLTRB(
                                                                      0, 0, 0,  height*0.004),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment.topLeft,
                                                                child: Text(
                                                                  'Hello Welcome',
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize: 10.sp,
                                                                    color: Colors.black,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              SharedPrefsService()
                                                                  .GetPatientName()
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontFamily: 'Poppins',
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                fontSize: 14.sp,
                                                                color:
                                                                    Colors.black,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: height*0.057,
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, height*0.011, 0, 0),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color(0xFFD5D5D5)),
                                                    borderRadius:
                                                        BorderRadius.circular(height*0.012),
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        width*0.035, height*0.013, 0, height*0.013),
                                                    child: Container(
                                                      child: Obx(() {
                                                        return DropdownButton<int>(
                                                          dropdownColor:
                                                              Color(0xFFFFFFFF),
                                                          value: controller
                                                              .selectedLocation
                                                              .value,
                                                          onChanged: (val) {
                                                            print(val);
                                                            if (val != null) {
                                                              controller
                                                                  .LocationSelected(
                                                                      val.toString());
                                                              controller
                                                                  .selectedLocation
                                                                  .value = val;

                                                              print(controller
                                                                  .selectedLocation);
                                                            }
                                                          },
                                                          items: controller
                                                              .addlocation
                                                              .map((loc) {
                                                            return DropdownMenuItem<
                                                                int>(
                                                              child: Text(
                                                                loc['name'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              value: loc['id'],
                                                            );
                                                          }).toList(),
                                                          isExpanded: true,
                                                          underline: SizedBox(),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Positioned(
                              //   left: 34.w,
                              //   right: 34.w,
                              //   top: 160.w,
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(8),
                              //       gradient: LinearGradient(
                              //         begin: Alignment(-1, 0),
                              //         end: Alignment(1, 0),
                              //         colors: <Color>[
                              //           Color(0xFFFFFFFF),
                              //           Color(0xFFF9F4FF)
                              //         ],
                              //         stops: <double>[0, 1],
                              //       ),
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: Color(0x0F121212),
                              //           offset: Offset(0, 4),
                              //           blurRadius: 13,
                              //         ),
                              //       ],
                              //     ),
                              //     // child: SizedBox(
                              //     //   width: 292,
                              //     //   height: 56,
                              //     //   child: Container(
                              //     //     padding: EdgeInsets.fromLTRB(11, 11, 0, 11),
                              //     //     child: Row(
                              //     //       mainAxisAlignment:
                              //     //           MainAxisAlignment.spaceBetween,
                              //     //       crossAxisAlignment:
                              //     //           CrossAxisAlignment.start,
                              //     //       children: [
                              //     //         Row(
                              //     //           mainAxisAlignment:
                              //     //               MainAxisAlignment.start,
                              //     //           crossAxisAlignment:
                              //     //               CrossAxisAlignment.start,
                              //     //           children: [
                              //     //             Container(
                              //     //               margin: EdgeInsets.fromLTRB(
                              //     //                   0, 0, 30, 0),
                              //     //               decoration: BoxDecoration(
                              //     //                 border: Border.all(
                              //     //                     color: Color(0xFFE2E2E2)),
                              //     //                 borderRadius:
                              //     //                     BorderRadius.circular(33),
                              //     //                 gradient: LinearGradient(
                              //     //                   begin: Alignment(-2.017, 0),
                              //     //                   end: Alignment(1.729, 0),
                              //     //                   colors: <Color>[
                              //     //                     Color(0xFFFFFFFF),
                              //     //                     Color(0xFFFFFFFF)
                              //     //                   ],
                              //     //                   stops: <double>[0.277, 1],
                              //     //                 ),
                              //     //                 boxShadow: [
                              //     //                   BoxShadow(
                              //     //                     color: Color(0x0F121212),
                              //     //                     offset: Offset(0, 4),
                              //     //                     blurRadius: 13,
                              //     //                   ),
                              //     //                 ],
                              //     //               ),
                              //     //               child: Container(
                              //     //                 width: 91,
                              //     //                 padding: EdgeInsets.fromLTRB(
                              //     //                     0, 7, 0.9, 7),
                              //     //                 child: Text(
                              //     //                   'Online',
                              //     //                   style: TextStyle(
                              //     //                     fontFamily: 'Poppins',
                              //     //                     fontWeight: FontWeight.w400,
                              //     //                     fontSize: 12.sp,
                              //     //                     color: Color(0xFF000000),
                              //     //                   ),
                              //     //                 ),
                              //     //               ),
                              //     //             ),
                              //     //             Container(
                              //     //               margin: EdgeInsets.fromLTRB(
                              //     //                   0, 8, 0, 8),
                              //     //               decoration: BoxDecoration(
                              //     //                 borderRadius:
                              //     //                     BorderRadius.circular(33),
                              //     //                 boxShadow: [
                              //     //                   BoxShadow(
                              //     //                     color: Color(0x0F121212),
                              //     //                     offset: Offset(0, 4),
                              //     //                     blurRadius: 13,
                              //     //                   ),
                              //     //                 ],
                              //     //               ),
                              //     //               child: Text(
                              //     //                 'Offline',
                              //     //                 style: TextStyle(
                              //     //                   fontFamily: 'Poppins',
                              //     //                   fontWeight: FontWeight.w400,
                              //     //                   fontSize: 12,
                              //     //                   color: Color(0xFF000000),
                              //     //                 ),
                              //     //               ),
                              //     //             ),
                              //     //           ],
                              //     //         ),
                              //     //         Container(
                              //     //           margin:
                              //     //               EdgeInsets.fromLTRB(0, 8, 0, 8),
                              //     //           decoration: BoxDecoration(
                              //     //             borderRadius:
                              //     //                 BorderRadius.circular(33),
                              //     //             boxShadow: [
                              //     //               BoxShadow(
                              //     //                 color: Color(0x0F121212),
                              //     //                 offset: Offset(0, 4),
                              //     //                 blurRadius: 13,
                              //     //               ),
                              //     //             ],
                              //     //           ),
                              //     //           child: Text(
                              //     //             'Both',
                              //     //             style: TextStyle(
                              //     //               fontFamily: 'Poppins',
                              //     //               fontWeight: FontWeight.w400,
                              //     //               fontSize: 12,
                              //     //               color: Color(0xFF000000),
                              //     //             ),
                              //     //           ),
                              //     //         ),
                              //     //       ],
                              //     //     ),
                              //     //   ),
                              //     // ),
                              //   ),
                              // ),
                            ]),
                          ),
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        // GestureDetector(
                        //     onTap: () =>
                        //         hideOverlay(OverlayEntry as OverlayEntry),
                        //     child: Padding(
                        //         padding: const EdgeInsets.all(1.0),
                        //         child: Column(children: [
                        //           Container(
                        //             height: 74,
                        //             child: Padding(
                        //               padding: const EdgeInsets.fromLTRB(
                        //                   15, 0, 15, 0),
                        //               child: Column(
                        //                 children: [
                        //                   CompositedTransformTarget(
                        //                     link: layerLink,
                        //                     child: TextFormField(
                        //                       key: searchBoxKey,
                        //                       controller:
                        //                           controller.DoctorNameSearched,
                        //                       onChanged: (val) {
                        //                         print("home val is $val");
                        //                         controller.SearchedDoctorsList(
                        //                             val);
                        //                         if (val.isNotEmpty) {
                        //                           showOverlay(context);
                        //                         }
                        //                       },
                        //                       decoration: InputDecoration(
                        //                         focusedBorder:
                        //                             OutlineInputBorder(
                        //                           borderSide: BorderSide(
                        //                               color: Colors.black,
                        //                               width: 1.0),
                        //                           borderRadius:
                        //                               BorderRadius.all(
                        //                                   Radius.circular(50)),
                        //                         ),
                        //                         enabledBorder:
                        //                             OutlineInputBorder(
                        //                           borderSide: BorderSide(
                        //                               color: Colors.black,
                        //                               width: 1),
                        //                           borderRadius:
                        //                               BorderRadius.all(
                        //                                   Radius.circular(40)),
                        //                         ),
                        //                         prefixIcon: Padding(
                        //                           padding:
                        //                               const EdgeInsets.fromLTRB(
                        //                                   30.0, 0, 30, 0),
                        //                           child: Icon(
                        //                             Icons.search,
                        //                             size: 28,
                        //                           ),
                        //                         ),
                        //                         contentPadding:
                        //                             const EdgeInsets.symmetric(
                        //                                 vertical: 18.0,
                        //                                 horizontal: 8.0),
                        //                         border: OutlineInputBorder(
                        //                           borderSide: BorderSide(
                        //                               color: Colors.black,
                        //                               width: 5),
                        //                           borderRadius:
                        //                               const BorderRadius.all(
                        //                                   Radius.circular(50)),
                        //                         ),
                        //                         hintText:
                        //                             "Search with Doctor name",
                        //                         hintStyle: TextStyle(
                        //                             color: Colors.black),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ]))),



                // Container(
                //   child: Column(
                //     children: [
                //       CarouselSlider.builder(
                //         itemCount: controller.carousals().length,
                //         itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                //           // Access the item at the given index
                //           final item = controller.carousals()[itemIndex];
                //           double itemHeight = controller.carousals()[itemIndex]==0 ? 30.0 : 50.0;
                //           // Check if the item is a widget or an image
                //           if (item is Widget) {
                //             return Container(
                //
                //               height: itemHeight,
                //               child: item, // Pass the widget directly
                //             );
                //           } else {
                //             // Handle other types if necessary
                //             return Container();
                //           }
                //         },
                //         options: CarouselOptions(
                //           scrollPhysics: BouncingScrollPhysics(),
                //           autoPlay: true,
                //           aspectRatio: 2,
                //          viewportFraction: 1,
                //           onPageChanged: (index, reason) {
                //             controller.CarouralIndex(index);
                //           },
                //         ),
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: List.generate(
                //           controller.carousals().length,
                //               (index) {
                //             return Container(
                //               width: 4.0,
                //               height: 4.0,
                //               margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 1.0),
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: controller.currentSlide == index
                //                     ? Color(0xFF5E55EA)
                //                     : Color.fromRGBO(0, 0, 0, 0.4),
                //               ),
                //             );
                //           },
                //         ),
                //       ),
                //     ],
                //   )
                //
                // ),
                //         Container(
                //           padding: EdgeInsets.all(4),
                //           margin: EdgeInsets.fromLTRB(0, 0, 7.1, 18),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 margin: EdgeInsets.fromLTRB(0, 0, 13.5, 0),
                //                 child: SizedBox(
                //                   width: 253.5,
                //                   child: Text(
                //                     'Specialization',
                //                     style: TextStyle(
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w600,
                //                       fontSize: 18,
                //                       color: Color(0xFF000000),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               Container(
                //                 margin: EdgeInsets.fromLTRB(0, 2, 0, 1),
                //                 child: Text(
                //                   'See all',
                //                   style: TextStyle(
                //                     fontFamily: 'Poppins',
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: 16,
                //                     color: Color(0xFF5E55EA),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //
                //         Container(
                //           padding: EdgeInsets.fromLTRB(19, 0, 19, 0),
                //           height: 120,
                //           width: double.infinity,
                //           child: Column(children: [
                //             Container(
                //                 child: SingleChildScrollView(
                //               child: Column(
                //                 children: [
                //                   Container(
                //                     height: 110,
                //
                //                     width: double.infinity,
                //                     // Adjust height as needed
                //                     child: GridView.builder(
                //                         scrollDirection: Axis.horizontal,
                //                         gridDelegate:
                //                             SliverGridDelegateWithFixedCrossAxisCount(
                //                           crossAxisCount:
                //                               2, // Number of rows you want
                //                           mainAxisSpacing: 0.0,
                //                           crossAxisSpacing: 0.0,
                //                           childAspectRatio:
                //                               0.40, // Adjust as needed for item width/height ratio
                //                         ),
                //                         itemCount: controller.Specialities
                //                             .length, // Number of items
                //                         itemBuilder: (context, index) {
                //                           final speciality =
                //                               controller.Specialities[index];
                //                           //
                //                           bool Isselected = (controller
                //                                       .selectedSpecialityIndexGrid ==
                //                                   index &&
                //                               controller
                //                                   .IsSeeAllSpecialityClicked);
                //                           List Alldoctors = [];
                //
                //                           return Container(
                //                             height: 5,
                //                             width: 30,
                //
                //                             // width: 550, // Fixed width for each card
                //                             child: GestureDetector(
                //                               onTap: () {
                //                                 controller
                //                                     .SelectedItemSpeciality();
                //                                 print(
                //                                     "IsSpid CLicked ${controller.IsSeeAllSpecialityClicked}");
                //                                 print(
                //                                     " Spec id is : ${controller.Specialities[index]['specialityId']}");
                //                                 if (controller
                //                                     .IsSeeAllSpecialityClicked) {
                //                                   Alldoctors = [];
                //                                   controller.SelectedSpeciality(
                //                                       index);
                //                                   controller
                //                                       .SelectedSpecialityIduser(
                //                                           controller.Specialities[
                //                                                   index]
                //                                               ['specialityId']);
                //                                   //  List doctor=controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                //                                   // Alldoctors=doctor;
                //                                 } else {
                //                                   Alldoctors = [];
                //                                   controller.SelectedSpeciality(
                //                                       index);
                //                                   controller
                //                                       .SelectedSpecialityIduser(
                //                                           0);
                //                                   //  List doctor=controller.GetDoctorsBasedOnSpecialityId(co
                //                                   //Alldoctors=controller.GetDoctorsBasedOnSpecialityId(0);
                //                                 }
                //                                 //controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                //                                 //controller.SelectedItemSpeciality();
                //                                 // if(controller.IsSeeAllSpecialityClicked){
                //                                 controller.SelectedSpeciality(
                //                                     index);
                //                                 //   controller.SelectedSpecialityIduser(controller.Specialities[index]['specialityId']);
                //                                 //   //controller.doctorList=[];
                //                                 //   //controller.GetAllDoctors();
                //                                 // }
                //                                 // else{
                //                                 //   controller.SelectedSpeciality(index);
                //                                 //   controller.SelectedSpecialityIduser(0);
                //                                 //   //controller.doctorList=[];
                //                                 //   //controller.GetAllDoctors();
                //                                 // }
                //
                //                                 print(
                //                                     "selected Index is : ${controller.Specialities[index]['specialityId']}");
                //                               },
                //                               child: Card(
                //                                 shape:RoundedRectangleBorder(
                //                                   borderRadius: BorderRadius.circular(47.67),
                //                                   side:BorderSide(color:Color(0xFFD5D5D5),
                //                                   width:0.77
                //                                   ),
                //
                //                                 ),
                //                                 color: Isselected
                //                                     ? Color(0xFF5E55EA)
                //                                     : Color(0xFFFFFFFF),
                //                                 elevation: 1,
                //                                 child: Padding(
                //                                   padding: const EdgeInsets.all(
                //                                       10.0),
                //                                   child: Row(
                //                                     mainAxisAlignment:
                //                                         MainAxisAlignment
                //                                             .center,
                //                                     children: [
                //                                       Icon(
                //                                         Icons.local_hospital,
                //                                         color: Isselected
                //                                             ? Colors.white
                //                                             : Colors.black,
                //                                       ),
                //                                       Text(
                //                                         speciality[
                //                                             'specialityname'],
                //                                         style: TextStyle(
                //                                             fontSize: 10,
                //                                             color: Isselected
                //                                                 ? Colors.white
                //                                                 : Colors.black),
                //                                       )
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                           );
                //                         }),
                //                   ),
                //                 ],
                //               ),
                //             )),
                //           ]),
                //         ),
                        GestureDetector(
                          onTap: (){
                            print("online");
                            controller.SetOfflineOnline(2);
                            Get.toNamed("/SeeAllDoctors");
                          },

                          child: Container(
                            color:Colors.white12,
                            child: Column(
                              children: [
                                Container(
                                  color:Colors.white12,
                                  height:height*0.24,//210,
                                  margin: EdgeInsets.fromLTRB(width*0.013, 0, width*0.013, height*0.001),
                                  child: Align(
                                    // alignment: Alignment.center,
                                    child: Stack(
                                      children: [

                                        Container(
                                          color:Colors.white12,
                                          padding: EdgeInsets.fromLTRB(0, 0, 1, 0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex:1,
                                                child: Container(

                                                  margin: EdgeInsets.fromLTRB(0, 0, width*0.013, 0),
                                                  child: Container(

                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(height*0.01),
                                                      gradient: LinearGradient(
                                                        begin: Alignment(0.756, -1),
                                                        end: Alignment(-0.838, 0.949),
                                                        colors: <Color>[Color(0xFFF5FBFF), Color(0xFFB7DAF1)],
                                                        stops: <double>[0, 1],
                                                      ),
                                                    ),
                                                    child: Container(
                                                      padding: EdgeInsets.fromLTRB(width*0.03, 0, 0, height*0.01),
                                                      child: Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Positioned(
                                                            bottom: height*0.025,//20,

                                                            left:width*0.0001,
                                                            right:width*0.001,
                                                            child: Container(
                                                                height: height*0.15,//130,
                                                                width: width*0.03,//100

                                                                child: Center(

                                                                  child: Image.asset(
                                                                      fit: BoxFit.fitHeight,
                                                                      "assets/DoctorImages/Mobile.png"),),),
                                                          ),
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0, 0, 0, height*0.16),
                                                                //111.5
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Wrap(
                                                                      children:[
                                                                        Text(
                                                                        'Online Video',
                                                                        style: TextStyle(
                                                                          fontFamily: 'Roboto Condensed',
                                                                          fontWeight: FontWeight.w500,
                                                                          fontSize: 16,
                                                                          height: 1.6,
                                                                          color: Color(0xFF031924),
                                                                          overflow: TextOverflow.ellipsis
                                                                        ),
                                                                      )],
                                                                    ),

                                                                  ],
                                                                ),
                                                              ),
                                                              // Container(
                                                              //   margin: EdgeInsets.fromLTRB(width*0.01, 0, width*0.035, 0),
                                                              //   //(6, 0, 16, 0)
                                                              //   // child: Container(
                                                              //   //   decoration: BoxDecoration(
                                                              //   //     borderRadius: BorderRadius.circular(6),
                                                              //   //     gradient: LinearGradient(
                                                              //   //       begin: Alignment(-1, 0),
                                                              //   //       end: Alignment(1, 0),
                                                              //   //       colors: <Color>[Color(0xFFFF846C), Color(0xFFFE9D8C)],
                                                              //   //       stops: <double>[0, 1],
                                                              //   //     ),
                                                              //   //   ),
                                                              //   //   // child: Container(
                                                              //   //   //   width: width*0.26,//120,
                                                              //   //   //   padding: EdgeInsets.fromLTRB(0, height*0.004, width*0.015, height*0.005),
                                                              //   //   //   //0, 4.5, 14.3, 5.5
                                                              //   //   //   child:
                                                              //   //   //   Center(
                                                              //   //   //     child: Text(
                                                              //   //   //       '20% OFF',
                                                              //   //   //       style: TextStyle(
                                                              //   //   //         fontFamily: 'Roboto Condensed',
                                                              //   //   //         fontWeight: FontWeight.w700,
                                                              //   //   //         fontSize: 13,
                                                              //   //   //         height: 1.4,
                                                              //   //   //         color: Color(0xFFFFFFFF),
                                                              //   //   //       ),
                                                              //   //   //     ),
                                                              //   //   //   ),
                                                              //   //   // ),
                                                              //   // ),
                                                              // ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex:1,
                                                child: Container(

                                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(0, height*0.001, 1, 0),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(height*0.008),
                                                      gradient: LinearGradient(
                                                        begin: Alignment(-0.85, -1),
                                                        end: Alignment(0.675, 1),
                                                        colors: <Color>[Color(0x99FFECFF), Color(0x99FFC2FF)],
                                                        stops: <double>[0, 1],
                                                      ),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        controller.SetOfflineOnline(1);
                                                        Get.toNamed("/SeeAllDoctors");
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.fromLTRB(width*0.03, 1, width*0.04, height*0.009),
                                                        child: Stack(
                                                          clipBehavior: Clip.none,
                                                          children: [
                                                            Positioned(
                                                              bottom:height*0.0012,
                                                              child: Container(
                                                                width: width*0.05,//90,
                                                                height: height*0.05,//130,

                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Container(


                                                                  margin: EdgeInsets.fromLTRB(0, height*0.023, 0, height*0.01),
                                                                  child: Align(
                                                                    alignment: Alignment.topLeft,
                                                                    child: Text(
                                                                      'Offline Consultant',
                                                                      style: TextStyle(
                                                                        fontFamily: 'Roboto Condensed',
                                                                        fontWeight: FontWeight.w500,
                                                                        fontSize: 16,
                                                                        height: 1.4,
                                                                        color: Color(0xFF58325A),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [

                                                                    Container(
                                                                      height: height*0.15,//130,
                                                                      width: width*0.27,

                                                                      child: Image.asset("assets/DoctorImages/Dr.Akhil_image.png"),
                                                                    ),
                                                                    // Positioned(
                                                                    //   top: height*0.12,//102,  // Adjust this value to control the vertical position of the text
                                                                    //   left: 0,   // Adjust this value to control the horizontal position of the text
                                                                    //   right: 0,
                                                                    //   child: Container(
                                                                    //     decoration: BoxDecoration(
                                                                    //       borderRadius: BorderRadius.circular(height*0.005),
                                                                    //       gradient: LinearGradient(
                                                                    //         begin: Alignment(1, 0),
                                                                    //         end: Alignment(1, 0),
                                                                    //         colors: <Color>[Color(0xFFFF846C), Color(0xFFFE9D8C)],
                                                                    //         stops: <double>[0, 1],
                                                                    //       ),
                                                                    //     ),
                                                                    //     child: Container(
                                                                    //       width: width*0.04,//140,
                                                                    //       padding: EdgeInsets.fromLTRB(0, 4.5, 14.3, 5.5),
                                                                    //       child: Center(
                                                                    //         child: Text(
                                                                    //           '20% OFF',
                                                                    //           style: TextStyle(
                                                                    //             fontFamily: 'Roboto Condensed',
                                                                    //             fontWeight: FontWeight.w700,
                                                                    //             fontSize: 13,
                                                                    //             height: 1.4,
                                                                    //             color: Color(0xFFFFFFFF),
                                                                    //           ),
                                                                    //         ),
                                                                    //       ),
                                                                    //     ),
                                                                    //   ),
                                                                    // ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
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
      //                           Column(
      //                             children: [
      //                               Stack(
      //                                 children: [
      //                                   InkWell(
      //                                     onTap: (){},
      //                                     child:CarouselSlider.builder(
      //                                       itemCount: 4,
      //                                       itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
      //                                         // Access the item at the given index
      //                                         final item = controller.GetBookings[itemIndex];
      //                                         print("items ::: $item");
      //
      //                                         //double itemHeight = controller.carousals()[itemIndex]==0 ? 30.0 : 50.0;
      //                                         // Check if the item is a widget or an image
      // if(itemIndex>=0) {
      //   return Container(
      //
      //     height: height * 0.012,
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         padding: EdgeInsets.all(16),
      //         color: Color(0xFF5E55EA),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               item.providerName ?? "Unknown Doctor",
      //               style: TextStyle(color: Colors.white,
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //             SizedBox(height: 4),
      //             Text(
      //               item.specializationName ?? "Unknown Specialization",
      //               style: TextStyle(color: Colors.white70, fontSize: 14),
      //             ),
      //             SizedBox(height: 8),
      //             Row(
      //               children: [
      //                 Container(
      //                   padding: EdgeInsets.symmetric(
      //                       vertical: 4, horizontal: 8),
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(4),
      //                   ),
      //                   child: Text(
      //                     item.appointmentDate ?? "Unknown Date",
      //                     style: TextStyle(color: Color(0xFF5E55EA),
      //                         fontWeight: FontWeight.bold),
      //                   ),
      //                 ),
      //                 SizedBox(width: 8),
      //                 Text(
      //                   item.appointmentTime ?? "Unknown Time",
      //                   style: TextStyle(
      //                       color: Colors.white, fontWeight: FontWeight.bold),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ), // Pass the widget directly
      //   );
      // }
      // else{
      //   return Center(
      //     child: Container(
      //       child: Text("No Appointments Available at the moment"),
      //     ),
      //   );
      // }
      //                                       },
      //                                       options: CarouselOptions(
      //                                         scrollPhysics: BouncingScrollPhysics(),
      //                                         autoPlay: true,
      //                                         aspectRatio: 2,
      //                                         viewportFraction: 1,
      //                                         onPageChanged: (index, reason) {
      //                                           controller.CarouralIndex(index);
      //                                         },
      //                                       ),
      //                                     ),
      //                                   )
      //
      //                                 ],
      //                               )
      //                             ],
      //                           ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(width*0.02, 0, width*0.02, 0),
                                  width: double.infinity,
                                  color:Colors.white12,
                                  child: Column(children: [
                                    Container(
                                      color:Colors.white12,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: height*0.23,

                                              width: double.infinity,
                                              // Adjust height as needed
                                              child: GridView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  gridDelegate:

                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount:
                                                    2,


                                                    // Number of rows you want
                                                    mainAxisSpacing: 1.0,
                                                    crossAxisSpacing: 1.0,
                                                    //mainAxisExtent: 210,
                                                    childAspectRatio: (screenWidth/2)/200,
                                                  ), // Adjust as needed for item width/height ratio

                                                  itemCount: controller.HiveBoxSpecialities
                                                      .length, // Number of items
                                                  itemBuilder: (context, index) {
                                                    final speciality =
                                                    controller.HiveBoxSpecialities[index];
                                                    print("Specialities is in home ${speciality}");
                                                    double cardWidth=screenWidth/2;
                                                    double cardHeight=screenHeight/6;
                                                    //
                                                    bool Isselected = (controller
                                                        .selectedSpecialityIndexGrid ==
                                                        index &&
                                                        controller
                                                            .IsSeeAllSpecialityClicked);
                                                    List Alldoctors = [];
                                                    // if (speciality.length > 10) {
                                                    //   cardWidth *= 1.2;
                                                    //   cardHeight *= 1.1;
                                                    // }
                                                    return SizedBox(
                                                      width:width*0.05,//200,


                                                      // width: 550, // Fixed width for each card
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Get.toNamed("/SeeAllDoctors");
                                                          // controller
                                                          //     .SelectedItemSpeciality();
                                                          // print(
                                                          //     "IsSpid CLicked ${controller.IsSeeAllSpecialityClicked}");
                                                          // print(
                                                          //     " Spec id is : ${controller.Specialities[index]['specialityId'].toString()}");
                                                          // if (controller
                                                          //     .IsSeeAllSpecialityClicked) {
                                                          //   Alldoctors = [];
                                                          //   controller.SelectedSpeciality(
                                                          //       index);
                                                          //   controller
                                                          //       .SelectedSpecialityIduser(
                                                          //       controller.Specialities[index]['specialityId']);
                                                          //   //  List doctor=controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                                                          //   // Alldoctors=doctor;
                                                          // } else {
                                                          //   Alldoctors = [];
                                                          //   controller.SelectedSpeciality(
                                                          //       index);
                                                          //   controller
                                                          //       .SelectedSpecialityIduser(
                                                          //       0);
                                                            //  List doctor=controller.GetDoctorsBasedOnSpecialityId(co
                                                            //Alldoctors=controller.GetDoctorsBasedOnSpecialityId(0);

                                                          //controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                                                          //controller.SelectedItemSpeciality();
                                                          // if(controller.IsSeeAllSpecialityClicked){

                                                          //   controller.SelectedSpecialityIduser(controller.Specialities[index]['specialityId']);
                                                          //   //controller.doctorList=[];
                                                          //   //controller.GetAllDoctors();
                                                          // }
                                                          // else{
                                                          //   controller.SelectedSpeciality(index);
                                                          //   controller.SelectedSpecialityIduser(0);
                                                          //   //controller.doctorList=[];
                                                          //   //controller.GetAllDoctors();
                                                          // }

                                                          print(
                                                              "selected Index is : ${controller.HiveBoxSpecialities[index]}");
                                                        },
                                                        child: Card(
                                                          color:Colors.white,
                                                          shape:RoundedRectangleBorder(
                                                              side: new BorderSide(color: Color(0xFFA57700), width: 0.2),
                                                              borderRadius: BorderRadius.circular(10.0)),
                                                          // color: Isselected
                                                          //     ? Color(0xFF5E55EA)
                                                          //     : Colors.white,
                                                          elevation: 1,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(
                                                                10.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Expanded(
                                                                  child: GradientText(
                                                                    speciality['specialityname'].toString(),
                                                                    style: TextStyle(
                                                                      fontSize: 13,
                                                                      height: 0.8,
                                                                      fontFamily: 'Roboto Condensed',
                                                                      fontWeight: FontWeight.w500,
                                                                      overflow: TextOverflow.ellipsis

                                                                    ),


                                                                    gradientType: GradientType.linear,
                                                                    radius:2.8,
                                                                    colors: [
                                                                      Color(0xFF636363),
                                                                      Color(0xFFA57700),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: height*0.067,//58,
                                                                    width:width*0.15,//50,
                                                                    child: Image.asset("assets/Icon_images/maternity_icon.png"))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(19.0),
                          child: MyContainer(
                              MainText: "Doctor's", text: "/SeeAllDoctors"),
                        ),

                        controller.IsLoading
                            ? CircularProgressIndicator()
                            : controller.SpecializiedDoctors.length == 0
                                ? Text("No data")
                                :  Container(
                          height: height*0.25,
                          width: double.infinity,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller
                                  .SpecializiedDoctors.length,
                              itemBuilder: (context, index) {
                                //var encodedImagePath = Uri.encodeComponent(controller.SpecializiedDoctors[index]['ImagePath']);
                                String checkImageUrl(String imageUrl) {
                                  // Add your custom logic to validate the URL here, e.g., checking format
                                  if (imageUrl.isEmpty || !Uri.parse(imageUrl).isAbsolute) {
                                    return 'assets/DoctorImages/dr_2.png';  // Fallback if the URL is invalid
                                  }
                                  return imageUrl;
                                }


                                return Container(
                                  height: height*0.30,//215,
                                  width: width*0.60,//250,
                                  child: GestureDetector(
                                    onTap: () {
                                      print("CLicked doctor dictionary is ${controller.SpecializiedDoctors[index]}");
                                      controller.UpdateDoctorDetail(controller.SpecializiedDoctors[index]);
                                      int DoctId = controller
                                          .SpecializiedDoctors[
                                      index]['DoctorId'];
                                      int Spid = controller
                                          .SpecializiedDoctors[
                                      index]['specialityId'];

                                      controller
                                          .DoctorParticularClick(

                                         );

                                      print("clicked");
                                      print(controller
                                          .SpecializiedDoctors[
                                      index]['DoctorId']);
                                      print(controller
                                          .SpecializiedDoctors[
                                      index]['specialityId']);
                                    },
                                    child: Card(
                                      color:Colors.white,
                                      elevation: 0,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                          children: [
                                            Center(

                                                child: Container(
                                                  height:height*0.14,
                                                  width:width*0.44,
                                                  //color:Colors.greenAccent,
                                                  child: Center(
                                                    child:
                                                    // controller.SpecializiedDoctors[index]['ImagePath']==1? Image.asset(
                                                    //   'assets/DoctorImages/dr_2.png', // Fallback image asset
                                                    //   width: width * 0.44,
                                                    //   height: height * 0.60,
                                                    //   color: Colors.white12,
                                                    //   colorBlendMode: BlendMode.color,
                                                    //   fit: BoxFit.cover,
                                                    // ):
                                                    controller.SpecializiedDoctors[index]['ImagePath'].toString().startsWith('http')?
                                                    Image.network(
                                                      height: height*0.60,
                                                      width:width*0.44,
                                                      color:Colors.white12,
                                                      colorBlendMode: BlendMode.color,
                                                      fit: BoxFit.cover,


                                                          controller.SpecializiedDoctors[index]['ImagePath'],

                                                      errorBuilder: (context, error, stackTrace) {
                                                        return Image.asset(
                                                            height: height*0.60,
                                                            width:width*0.44,
                                                            color:Colors.white12,
                                                            colorBlendMode: BlendMode.color,
                                                            fit: BoxFit.cover,
                                                            'assets/DoctorImages/dr_2.png');
                                                      },
                                                    ):Image.asset(
                                                        height: height*0.60,
                                                        width:width*0.44,
                                                        color:Colors.white12,
                                                        colorBlendMode: BlendMode.color,
                                                        fit: BoxFit.cover,
                                                        controller.SpecializiedDoctors[index]['ImagePath']
                                                    )

                                                  ),
                                                )),
                                            Container(
                                              margin:
                                              EdgeInsets.fromLTRB(
                                                  0, 4, 0, 4),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                        "${"Dr"}.${controller.SpecializiedDoctors[index]['DoctorName'].toString().capitalize}",
                                                        style:
                                                        TextStyle(
                                                          fontFamily:
                                                          'Poppins',
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontSize:
                                                          16,
                                                          color: Color(
                                                              0xFF000000),
                                                          overflow: TextOverflow.ellipsis
                                                        )),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.star_border,
                                                          size:15,
                                                          color: Color(0xFFFFB800),
                                                          fill:1,


                                                        ),
                                                        Text(

                                                          "4.5",
                                                          style:
                                                          TextStyle(
                                                            fontFamily:
                                                            'Poppins',
                                                            fontWeight:
                                                            FontWeight
                                                                .w400,
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFFB5B5B5),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    margin: EdgeInsets
                                                        .fromLTRB(0,
                                                        0, 5, 0),
                                                    child: Icon(
                                                      Icons
                                                          .medical_information,
                                                      size: 15,
                                                      color: Color(
                                                          0xFFC1C1C1),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    controller.SpecializiedDoctors[
                                                    index][
                                                    'speciality'],
                                                    style: TextStyle(
                                                      fontFamily:
                                                      'Poppins',
                                                      fontWeight:
                                                      FontWeight
                                                          .w400,
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xFFC1C1C1),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(19.0),
                          child: MyContainer(
                            MainText: "Medical Records",
                            text: "/SeeAllRecentDoctors",
                          ),
                        ),
                        //down list for specialist using list view builder only desig has done
                        // Container(
                        //   height: 197,
                        //   child: ListView.builder(
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: controller.GetBookings.length,
                        //       itemBuilder: (context, index) {
                        //         if (index < 2) {
                        //           return Padding(
                        //             padding: const EdgeInsets.fromLTRB(
                        //                 8.0, 0, 8.0, 0),
                        //             child: Container(
                        //               height: 150,
                        //               width: 219,
                        //               child: Card(
                        //                 elevation: 2,
                        //                 margin:
                        //                     EdgeInsets.symmetric(vertical: 5),
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.all(20.0),
                        //                   child: Row(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.spaceAround,
                        //                     //crossAxisAlignment: CrossAxisAlignment.start,
                        //                     children: [
                        //                       Container(
                        //                           height: 120,
                        //                           width: 120,
                        //                           decoration: BoxDecoration(
                        //                             shape: BoxShape.circle,
                        //                             border: Border.all(
                        //                               color: Color(0xFF5E55EA),
                        //                               width: 2.0,
                        //                             ),
                        //                           ),
                        //                           child: Center(
                        //                               child: ClipOval(
                        //                                   child: Image.asset(
                        //                             'assets/DoctorImages/dr_2.png',
                        //                             fit: BoxFit.cover,
                        //                           )))),
                        //                       Container(
                        //                         margin: EdgeInsets.fromLTRB(
                        //                             0, 4, 0, 4),
                        //                         child: Column(
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment.center,
                        //                           children: [
                        //                             Text(
                        //                                 controller
                        //                                     .GetBookings[index]
                        //                                     .providerName!
                        //                                     .capitalize!,
                        //                                 style: TextStyle(
                        //                                   fontFamily: 'Poppins',
                        //                                   fontWeight:
                        //                                       FontWeight.w500,
                        //                                   fontSize: 16,
                        //                                   color:
                        //                                       Color(0xFF000000),
                        //                                 )),
                        //                             Row(
                        //                               children: [
                        //                                 Container(
                        //                                   margin: EdgeInsets
                        //                                       .fromLTRB(
                        //                                           0, 0, 5, 0),
                        //                                   child: Icon(
                        //                                     Icons
                        //                                         .medical_information,
                        //                                     size: 15,
                        //                                     color: Color(
                        //                                         0xFFC1C1C1),
                        //                                   ),
                        //                                 ),
                        //                                 Text(
                        //                                   controller
                        //                                       .GetBookings[
                        //                                           index]
                        //                                       .specializationName!
                        //                                       .capitalize!,
                        //                                   style: TextStyle(
                        //                                     fontFamily:
                        //                                         'Poppins',
                        //                                     fontWeight:
                        //                                         FontWeight.w400,
                        //                                     fontSize: 14,
                        //                                     color: Color(
                        //                                         0xFFC1C1C1),
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             )
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           );
                        //         } else {
                        //           return SizedBox();
                        //         }
                        //       }),
                        // )
                      ],
                    ),
                  ))));
    });
  }

  Widget MyContainer({required String MainText, required String text}) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color:Colors.white12,
          margin: EdgeInsets.fromLTRB(0, 0, 13.5, 0),
          child: SizedBox(
            width: 253.5,
            child: Text(
              "${MainText}",
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
          margin: EdgeInsets.fromLTRB(0, 2, 0, 1),
          child: GestureDetector(
            onTap: () {
              Get.toNamed("${text}");
            },
            child: Text(
              "See All",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF5E55EA),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
