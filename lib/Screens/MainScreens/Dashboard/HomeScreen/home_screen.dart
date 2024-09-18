import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'homeController.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final homeController controller = Get.put(homeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = 100;
    final double itemWidth = size.width / 2;
    return GetBuilder<homeController>(
      builder: (controller) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child:
            Column(
              children: [
                Container(

                  height:210,
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [

                        Container(

                          padding: EdgeInsets.fromLTRB(0, 0, 1, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex:1,
                                child: Container(

                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(
                                        begin: Alignment(0.756, -1),
                                        end: Alignment(-0.838, 0.949),
                                        colors: <Color>[Color(0xFFF5FBFF), Color(0xFFB7DAF1)],
                                        stops: <double>[0, 1],
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: -11,
                                          top: 20,
                                          child: SizedBox(
                                            width: 50,
                                            height: 48,
                                            // child: SvgPicture.network(
                                            //   'assets/vectors/Unknown',
                                            // ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(11, 0, 0, 8),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                bottom: 10,
                                                child: Container(
                                                  // decoration: BoxDecoration(
                                                  //   image: DecorationImage(
                                                  //     image: NetworkImage(
                                                  //       'assets/images/welcome_to_memd_1024_x_601_removebg_preview_1.png',
                                                  //     ),
                                                  //   ),
                                         child:
                                         Container(
                                             height: 123,
                                             width: 120,

                                             child: Image.asset("assets/DoctorImages/Dr.Akhil_image.png")),

                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 111.5),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(0, 11.5,0, 0),
                                                          child: Text(
                                                            'Online Video',
                                                            style: TextStyle(
                                                              fontFamily: 'Roboto Condensed',
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 16,
                                                              height: 1.4,
                                                              color: Color(0xFF031924),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 7.5),
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 48,
                                                            // child: SvgPicture.network(
                                                            //   'assets/vectors/Unknown',
                                                            // ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(6, 0, 16, 0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(6),
                                                        gradient: LinearGradient(
                                                          begin: Alignment(-1, 0),
                                                          end: Alignment(1, 0),
                                                          colors: <Color>[Color(0xFFFF846C), Color(0xFFFE9D8C)],
                                                          stops: <double>[0, 1],
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: 127,
                                                        padding: EdgeInsets.fromLTRB(0, 4.5, 14.3, 5.5),
                                                        child:
                                                        Center(
                                                          child: Text(
                                                            '20% OFF',
                                                            style: TextStyle(
                                                              fontFamily: 'Roboto Condensed',
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 13,
                                                              height: 1.4,
                                                              color: Color(0xFFFFFFFF),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex:1,
                                child: Container(

                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: LinearGradient(
                                        begin: Alignment(-0.85, -1),
                                        end: Alignment(0.675, 1),
                                        colors: <Color>[Color(0x99FFECFF), Color(0x99FFC2FF)],
                                        stops: <double>[0, 1],
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        // Positioned(
                                        //   left: -11,
                                        //   top: 143.5,
                                        //   child: SizedBox(
                                        //     width: 50,
                                        //     height: 48,
                                        //     // child: SvgPicture.network(
                                        //     // 'assets/vectors/Unknown',
                                        //     // ),
                                        //   ),
                                        // ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(11, 11.5, 17, 8),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
bottom:12,
                                                child: Container(
                                                  width: 95,
                                                  height: 135,

                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(


                                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                                                        height: 123,
                                                        width: 95,

                                                        child: Image.asset("assets/DoctorImages/Dr.Akhil_image.png"),
                                                      ),
                                                      Positioned(
                                                        top: 90,  // Adjust this value to control the vertical position of the text
                                                        left: 0,   // Adjust this value to control the horizontal position of the text
                                                        right: 0,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(6),
                                                            gradient: LinearGradient(
                                                              begin: Alignment(1, 0),
                                                              end: Alignment(1, 0),
                                                              colors: <Color>[Color(0xFFFF846C), Color(0xFFFE9D8C)],
                                                              stops: <double>[0, 1],
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width: 140,
                                                            padding: EdgeInsets.fromLTRB(0, 4.5, 14.3, 5.5),
                                                            child: Center(
                                                              child: Text(
                                                                '20% OFF',
                                                                style: TextStyle(
                                                                  fontFamily: 'Roboto Condensed',
                                                                  fontWeight: FontWeight.w700,
                                                                  fontSize: 13,
                                                                  height: 1.4,
                                                                  color: Color(0xFFFFFFFF),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
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
              Column(
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: (){},
                      child:CarouselSlider.builder(
                        itemCount: controller.carousals().length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                          // Access the item at the given index
                          final item = controller.carousals()[itemIndex];
                          double itemHeight = controller.carousals()[itemIndex]==0 ? 30.0 : 50.0;
                          // Check if the item is a widget or an image
                          if (item is Widget) {
                            return Container(

                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: item,
                              ), // Pass the widget directly
                            );
                          } else {
                            // Handle other types if necessary
                            return Container();
                          }
                        },
                        options: CarouselOptions(
                          scrollPhysics: BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            controller.CarouralIndex(index);
                          },
                        ),
                      ),
                      )

                    ],
                  )
                ],
              ),
                Container(
                  padding: EdgeInsets.fromLTRB(19, 0, 19, 0),
                  width: double.infinity,
                  child: Column(children: [
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 220,

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

                                  itemCount: controller.Specialities
                                      .length, // Number of items
                                  itemBuilder: (context, index) {
                                    final speciality =
                                    controller.Specialities[index];
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
                                width:200,


                                      // width: 550, // Fixed width for each card
                                      child: GestureDetector(
                                        onTap: () {
                                          controller
                                              .SelectedItemSpeciality();
                                          print(
                                              "IsSpid CLicked ${controller.IsSeeAllSpecialityClicked}");
                                          print(
                                              " Spec id is : ${controller.Specialities[1].specializations![index].value.toString()}");
                                          if (controller
                                              .IsSeeAllSpecialityClicked) {
                                            Alldoctors = [];
                                            controller.SelectedSpeciality(
                                                index);
                                            controller
                                                .SelectedSpecialityIduser(
                                                controller.Specialities[index]['specialityId']);
                                            //  List doctor=controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                                            // Alldoctors=doctor;
                                          } else {
                                            Alldoctors = [];
                                            controller.SelectedSpeciality(
                                                index);
                                            controller
                                                .SelectedSpecialityIduser(
                                                0);
                                            //  List doctor=controller.GetDoctorsBasedOnSpecialityId(co
                                            //Alldoctors=controller.GetDoctorsBasedOnSpecialityId(0);
                                          }
                                          //controller.GetDoctorsBasedOnSpecialityId(controller.Specialities[index]['specialityId']);
                                          //controller.SelectedItemSpeciality();
                                          // if(controller.IsSeeAllSpecialityClicked){
                                          controller.SelectedSpeciality(
                                              index);
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
                                              "selected Index is : ${controller.Specialities[1].specializations?[index].value}");
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
                                                  child: FittedBox(
                                                    child: GradientText(
                                                      speciality['specialityname'].toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                        height: 1.4,
                                                        fontFamily: 'Roboto Condensed',
                                                        fontWeight: FontWeight.w500,

                                                      ),


                                                          gradientType: GradientType.linear,
                                                          radius:2.8,
                                                          colors: [
                                                            Color(0xFF636363),
                                                            Color(0xFFA57700),
                                                          ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: 58,
                                                    width:50,
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
                ),
                Container(
                  height: 210,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller
                          .SpecializiedDoctors.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 210,
                          width: 250,
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

                                  spid: Spid);

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
                              elevation: 1,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8),
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
                                              height:100,
                                              width:200,
                                           color:Colors.greenAccent,
                                              child: Image
                                                  .asset(
                                                'assets/DoctorImages/dr_2.png',

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
                )
              ],
            ),

          ),
        );
      }
    );
  }
}
