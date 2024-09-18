import 'package:careaxes_patient/Screens/MainScreens/see_all_doctors/SearchDoctorScreen.dart';
import 'package:careaxes_patient/Screens/MainScreens/see_all_doctors/see_all_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../ModelClass/search_doctors_modelList.dart';
import '../Dashboard/HomeScreen/homeController.dart';

class SeeAll extends StatelessWidget {
  SeeAll({super.key});


  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();
  final GlobalKey searchBoxKey = GlobalKey();
  SeeAllController controller = Get.put(SeeAllController());
  void showOverlay(BuildContext context) {
    overlayEntry = OverlayEntry(builder: (context) {
      return GetBuilder<SeeAllController>(
        builder: (controller) {
          List<SearchedDoctorsModel> doctorsList = controller.SearchedDoctor;
          RenderBox? renderBox =
              searchBoxKey.currentContext?.findRenderObject() as RenderBox?;
          if (renderBox == null) {
            return SizedBox();
          }
          Size size = renderBox.size;
          Offset offset = renderBox.localToGlobal(Offset.zero);

          // Check if SearchedDoctors list is empty, then remove overlay
          if (controller.SearchedDoctor.isEmpty) {
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
                  constraints: BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.SearchedDoctor.length,
                    itemBuilder: (context, index) {
                      final doctor = controller.SearchedDoctor[index];
                      var ModelDoctor = {
                        'DoctorName': doctor.fullName,
                        'DoctorId': doctor.providerId,
                        'speciality': doctor.specializationName,
                        'specialityId': doctor.specializationId,
                        'DepartmentId': doctor.departmentId,
                      };
                      return ListTile(
                        title: Text(doctor.fullName!),
                        subtitle: Text(doctor.specializationName!),
                        onTap: () {
                          print(doctor);
                          controller.DoctorClick(
                              ModelDoctor as Map<String, dynamic>);
                          overlayEntry?.remove();
                          overlayEntry = null;
                          controller.SearchedDoctor = [];
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
    return GetBuilder<SeeAllController>(builder: (controller) {
      final homeController Homecontroller = Get.put(homeController());
      final size = MediaQuery.of(context).size;
      final height = size.height;
      final width = size.width;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                      Text("Search a Doctor",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          )),
                      GestureDetector(
                          onTap: () {
                            Get.to(Searchdoctorscreen());
                            // controller.showSearchBar();
                          },
                          child: Icon(Icons.search)),
                    ]),
        ),
        body: GetBuilder<homeController>(builder: (Homecontroller) {
          return SingleChildScrollView(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                controller.SearchedDoctor = [];
                controller.update();
                overlayEntry?.remove();
                overlayEntry = null;
              },
              child: Stack(
                children:[
                  Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  hideOverlay(OverlayEntry as OverlayEntry),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    // Container(
                                    //   height: height * 0.070, //70,
                                    //
                                    //   child: Column(
                                    //     children: [
                                    //       // CompositedTransformTarget(
                                    //       //   link: layerLink,
                                    //       //   child: TextFormField(
                                    //       //     key: searchBoxKey,
                                    //       //     controller:
                                    //       //         controller.DoctorNameSearched,
                                    //       //     onChanged: (val) {
                                    //       //       controller
                                    //       //           .fetchDoctorsSearched(val);
                                    //       //       if (val.isNotEmpty) {
                                    //       //         showOverlay(context);
                                    //       //       }
                                    //       //     },
                                    //       //     decoration: InputDecoration(
                                    //       //       focusedBorder:
                                    //       //           OutlineInputBorder(
                                    //       //         borderSide: BorderSide(
                                    //       //             color: Color(0xFFD5D5D5),
                                    //       //             width: 1.0),
                                    //       //         borderRadius:
                                    //       //             BorderRadius.all(
                                    //       //                 Radius.circular(30)),
                                    //       //       ),
                                    //       //       enabledBorder:
                                    //       //           OutlineInputBorder(
                                    //       //         borderSide: BorderSide(
                                    //       //             color: Color(0xFFD5D5D5),
                                    //       //             width: 1),
                                    //       //         borderRadius:
                                    //       //             BorderRadius.all(
                                    //       //                 Radius.circular(30)),
                                    //       //       ),
                                    //       //       prefixIcon: Padding(
                                    //       //         padding:
                                    //       //             const EdgeInsets.fromLTRB(
                                    //       //                 10.0, 0, 10, 0),
                                    //       //         child: Icon(Icons.search,
                                    //       //             size: 20,
                                    //       //             color: Color(0xFF4A4A4A)),
                                    //       //       ),
                                    //       //       contentPadding:
                                    //       //           const EdgeInsets.symmetric(
                                    //       //               vertical: 15.0,
                                    //       //               horizontal: 10.0),
                                    //       //       border: OutlineInputBorder(
                                    //       //         borderSide: BorderSide(
                                    //       //             color: Color(0xFFD5D5D5),
                                    //       //             width: 5),
                                    //       //         borderRadius:
                                    //       //             const BorderRadius.all(
                                    //       //                 Radius.circular(20)),
                                    //       //       ),
                                    //       //       hintText:
                                    //       //           "Search with Doctor name",
                                    //       //       hintStyle: TextStyle(
                                    //       //         color: Color(0xFFB1B1B1),
                                    //       //         fontFamily: 'Poppins',
                                    //       //         fontWeight: FontWeight.w400,
                                    //       //         fontSize: 12,
                                    //       //       ),
                                    //       //     ),
                                    //       //   ),
                                    //       // )
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(19, 0, 19, 0),
                              height: height * 0.15, //130,

                              width: double.infinity,
                              child: Column(children: [
                                Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            height:   height * 0.10,//89,

                                            width: double.infinity,
                                            // Adjust height as needed
                                            child: GridView.builder(
                                                scrollDirection: Axis.horizontal,
                                                gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount:
                                                    1, // Number of rows you want
                                                    mainAxisSpacing: 18.0,
                                                    crossAxisSpacing: 10.0,
                                                    childAspectRatio:1
                                                  //0.37, // Adjust as needed for item width/height ratio
                                                ),
                                                itemCount: controller.AllSpeciality
                                                    .length, // Number of items
                                                itemBuilder: (context, index) {
                                                  final speciality =
                                                  controller.AllSpeciality[index];
                                                  //
                                                  bool Isselected = (controller
                                                      .selectedSpecialityIndexGrid ==
                                                      index &&
                                                      controller
                                                          .IsSeeAllSpecialityClicked);
                                                  List Alldoctor = [];

                                                  return Container(
                                                    height: height * 0.0007,
                                                    width: width * 0.0021,
                                                    //30,

                                                    // width: 550, // Fixed width for each card
                                                    child: Column(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .SelectedItemSpeciality();
                                                            if (controller
                                                                .IsSeeAllSpecialityClicked) {
                                                              print(controller
                                                                  .IsSeeAllSpecialityClicked);
                                                              Alldoctor = [];
                                                              controller
                                                                  .SelectedSpeciality(
                                                                  index);
                                                              print(
                                                                  "Selected SpecialityId is ${controller.AllSpeciality[index]['specialityId']}");
                                                              controller
                                                                  .SelectedSpecialityIduser(
                                                                  controller.AllSpeciality[
                                                                  index][
                                                                  'specialityId']);
                                                              //  List doctor=controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                                                              // Alldoctors=doctor;
                                                            } else {
                                                              Alldoctor = [];
                                                              controller
                                                                  .SelectedSpeciality(
                                                                  index);
                                                              controller
                                                                  .SelectedSpecialityIduser(
                                                                  0);
                                                              //  List doctor=controller.GetDoctorsBasedOnSpecialityId(co
                                                              //Alldoctors=controller.GetDoctorsBasedOnSpecialityId(0);
                                                            }
                                                            controller.SelectedSpeciality(
                                                                index);
                                                            print(
                                                                "selected Index is : ${controller.AllSpeciality[index]['specialityId']}");

                                                            print(
                                                                "selected Index is : ${controller.AllSpeciality[index]['specialityId']}");
                                                          },
                                                          child: Card(

                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    40),
                                                                side: BorderSide(
                                                                  color:
                                                                  Color(0xFFD5D5D5),
                                                                  width: 0.77,
                                                                )),
                                                            color: Isselected
                                                                ? Color(0xFF5E55EA)
                                                                : Colors.white,
                                                            elevation: 0.2,
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets.all(
                                                                  10.0),
                                                              child: SizedBox(
                                                                  height: 13,
                                                                  width:36,
                                                                  child: Image.asset("assets/Icon_images/maternity_icon.png")),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(controller.AllSpeciality[index]['specialityname'].toString(),
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              height: 0.8,
                                                              fontFamily: 'Roboto Condensed',
                                                              fontWeight: FontWeight.w500,
                                                              overflow: TextOverflow.ellipsis
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    )),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      controller.IsLoading
                          ? CircularProgressIndicator()
                          : Container(
                        height: height,
                        child:
                        controller.doctorsWithOutSpeciality.length == 0
                            ? SizedBox(
                          child: Text("No Data"),
                        )
                            : ListView.builder(
                            controller: controller.scrollController,
                            scrollDirection: Axis.vertical,
                            itemCount: controller
                                .doctorsWithOutSpeciality
                                .length +
                                1,
                            itemBuilder: (context, index) {
                              String encodedImagePath;

                              Map<String, dynamic> ModelDoctor = {};
                              if (index <
                                  controller
                                      .doctorsWithOutSpeciality
                                      .length) {
                                final doctor = controller
                                    .doctorsWithOutSpeciality[
                                index];
                                String ImagePath=
                                 controller.ImagePath(doctor.thumbnailUrl??'');
                               print("ImagePath in see all is$ImagePath");
                                ModelDoctor = {
                                  'DoctorName': doctor.providerName,
                                  'DoctorId': doctor.providerId,
                                  'speciality':
                                  doctor.specializations,
                                  'specialityId':
                                  doctor.specializationId,
                                  'DepartmentId':
                                  doctor.departmentId,
                                  'ImagePath':controller.doctorsWithOutSpeciality[index].thumbnailUrl??1,
                                };
                              }
                              if (index ==
                                  controller
                                      .doctorsWithOutSpeciality
                                      .length) {
                                return CupertinoActivityIndicator();
                              }
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 0, 8.0, 0),
                                child: Container(
                                  height: 308,//height * 0.252, //218,
                                  width: width,

                                  child: InkWell(
                                    onTap: () {
                                      print(
                                          "Provider id is : ${controller.doctorsWithOutSpeciality[index].providerId}");
                                      print(controller
                                          .doctorsWithOutSpeciality[
                                      index]
                                          .specializationId);
                                      controller.GetSpecialityDoctor(
                                          controller
                                              .doctorsWithOutSpeciality[
                                          index]
                                              .specializationId);
                                    },
                                    child: GestureDetector(
                                      onTap: (){
                                        controller.DoctorClick(
                                            ModelDoctor
                                            as Map<
                                                String,
                                                dynamic>);
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10),
                                            side: BorderSide(
                                              color:
                                              Color(0xFFD5D5D5),
                                              width: 0.77,
                                            )),
                                        elevation: 0.2,
                                        color: Color(0xFFFFFFFF),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              1),
                                          child: Column(
                                            children: [
                                              Column(
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                      height:165,


                                                      // height: 162,
                                                      //   // height: height *
                                                      //   //     0.14,
                                                      width: width*0.9,

                                                      child: Center(
                                                        child: Image.asset(
                                                          'assets/DoctorImages/dr_2.png',
                                                          width: width * 0.9, // Fallback image asset
                                                          fit: BoxFit.cover,
                                                          alignment: const Alignment(-0.5, -0.6),
                                                        ),
                                                        // child: Image.network(
                                                        //   "https://uat.careaxes.net/uat-qa-api/api/resources/get-profile-image?imagePath=${controller.doctorsWithOutSpeciality[index].thumbnailUrl}",
                                                        //   fit: BoxFit.cover,
                                                        //   alignment: const Alignment(-0.5, -0.6),
                                                        //   width: double.infinity,
                                                        //   colorBlendMode: BlendMode.lighten,
                                                        //   errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                                        //     // Fallback image displayed when there's an error (like 400 status)
                                                        //     return Image.asset(
                                                        //       'assets/DoctorImages/dr_2.png',
                                                        //       width: width * 0.9, // Fallback image asset
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

                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  margin: EdgeInsets
                                                      .fromLTRB(
                                                      11,
                                                      4,
                                                      0,
                                                      4),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                          "Dr." +
                                                              controller.doctorsWithOutSpeciality[index].providerName!.capitalize!,
                                                          style: TextStyle(
                                                            fontFamily:
                                                            'Poppins',
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontSize:
                                                            16,
                                                            color:
                                                            Color(0xFF000000),
                                                          )),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(
                                                                    4,
                                                                    0,
                                                                    5,
                                                                    0),
                                                                height: 21,
                                                                width:21,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    color: Color(0xFFD9D9D9)
                                                                ),
                                                                child:
                                                                Image.asset(
                                                                  "assets/Icon_images/vital_signs.png",
                                                                  height:
                                                                  15,
                                                                  color:
                                                                  Colors.blueAccent,
                                                                ),

                                                              ),
                                                              Container(
                                                                child: Text(
                                                                  controller
                                                                      .doctorsWithOutSpeciality[index]
                                                                      .specializations!
                                                                      .capitalize!,
                                                                  style:
                                                                  TextStyle(
                                                                    fontFamily:
                                                                    'Poppins',
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    fontSize:
                                                                    14,
                                                                    color:
                                                                    Color(0xFFC1C1C1),
                                                                  ),
                                                                ),
                                                              ),

                                                            ],
                                                          ),

                                                          Row(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(
                                                                    4,
                                                                    0,
                                                                    5,
                                                                    0),
                                                                height: 21,
                                                                width:21,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    color: Color(0xFFD9D9D9)
                                                                ),
                                                                child:
                                                                Image.asset(
                                                                  "assets/Icon_images/stethoscope.png",

                                                                ),

                                                              ),
                                                              Container(
                                                                child: Text("${controller
                                                                    .doctorsWithOutSpeciality[index]
                                                                    .experience.toString()} yrs Experience" ,
                                                                  style: TextStyle(

                                                                    fontFamily:
                                                                    'Poppins',
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    fontSize:
                                                                    14,
                                                                    color:
                                                                    Color(0xFFC1C1C1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(4, 0,6, 1),
                                                            height:21,
                                                            width: 21,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(50),
                                                                color: Color(0xFFD9D9D9)
                                                            ),
                                                            child: Icon(Icons.translate,
                                                                size: 11,
                                                                color:Color(0xFF3D8AF6)
                                                            ),
                                                          ),
                                                          Text( controller
                                                              .doctorsWithOutSpeciality[index]
                                                              .languages
                                                              .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                              'Poppins',
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              fontSize:
                                                              14,
                                                              color:
                                                              Color(0xFFC1C1C1),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: height *
                                                    0.012, //10,
                                              ),
                                              // ElevatedButton(
                                              //   onPressed: () {
                                              //     // controller.DoctorClick(
                                              //     //     ModelDoctor
                                              //     //         as Map<
                                              //     //             String,
                                              //     //             dynamic>);
                                              //   },
                                              //   // child: Text(
                                              //   //     "Book Appointment"),
                                              //   style: ElevatedButton.styleFrom(
                                              //       fixedSize: Size(
                                              //           MediaQuery.of(
                                              //                   context)
                                              //               .size
                                              //               .width,
                                              //           height *
                                              //               0.06),
                                              //       shape: RoundedRectangleBorder(
                                              //           borderRadius:
                                              //               BorderRadius
                                              //                   .circular(
                                              //                       5)),
                                              //       backgroundColor:
                                              //           Color(
                                              //               0xFF5E55EA),
                                              //       foregroundColor:
                                              //           Color(
                                              //               0xFFFFFFFF)),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),

                    ],
                  ),
                  Positioned(
                      top:720,
                      left:30,
                      right: 30,
                      child:Container(
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
                                      itemCount: controller
                                          .AppointmentType.length,
                                      itemBuilder: (context, index) {
                                        bool isSelected = index ==
                                            controller
                                                .AppointmentIndex;
                                        return GestureDetector(
                                          onTap: () {
                                            print(index);
                                            controller.Click(index);
                                            if (index ==
                                                controller
                                                    .AppointmentIndex) {
                                              print(
                                                  "yes clicked on ${controller.AppointmentType[controller.AppointmentIndex]}");
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
                                                        controller
                                                            .AppointmentType[
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
                      ))
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}

