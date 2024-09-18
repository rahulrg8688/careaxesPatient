import 'package:careaxes_patient/Screens/MainScreens/see_all_doctors/see_all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../ModelClass/search_doctors_modelList.dart';
import '../Dashboard/HomeScreen/homeController.dart';

class Searchdoctorscreen extends StatefulWidget {
   Searchdoctorscreen({super.key});

  @override
  State<Searchdoctorscreen> createState() => _SearchdoctorscreenState();
}

class _SearchdoctorscreenState extends State<Searchdoctorscreen> {
  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();

  final GlobalKey searchBoxKey = GlobalKey();

   final homeController controller = Get.put(homeController());

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
                  constraints: BoxConstraints(maxHeight: 500),

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
                 tileColor: Colors.white,
                          selectedTileColor:Color(0xFF5E55EA),
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
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return GetBuilder<SeeAllController>(
      builder: (controller) {
        return Scaffold(
          body:Container(
            margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(children: [
              SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: GestureDetector(
                            onTap: () =>
                                hideOverlay(OverlayEntry as OverlayEntry),
                            child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(children: [
                                  Container(
                                    height: height * 0.065, //70,


                                    child: Column(
                                      children: [
                                        CompositedTransformTarget(
                                          link: layerLink,
                                          child: Center(
                                            child: TextFormField(
                                              key: searchBoxKey,
                                              controller:
                                              controller.DoctorNameSearched,
                                              onChanged: (val) {
                                                controller
                                                    .fetchDoctorsSearched(val);
                                                if (val.isNotEmpty) {
                                                  showOverlay(context);
                                                }
                                              },
                                              decoration: InputDecoration(
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xFFD5D5D5),
                                                      width: 1.0),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(30)),
                                                ),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xFFD5D5D5),
                                                      width: 1),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(30)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10.0, 0, 10, 0),
                                                  child: Icon(Icons.search,
                                                      size: 20,
                                                      color: Color(0xFF4A4A4A)),
                                                ),
                                                suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                      controller
                                                          .showSearchBar();
                                                    },
                                                    child: Icon(Icons.delete)),
                                                contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 15.0,
                                                    horizontal: 10.0),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xFFD5D5D5),
                                                      width: 5),
                                                  borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                                ),
                                                hintText:
                                                "Search with Doctor name",
                                                hintStyle: TextStyle(
                                                  color: Color(0xFFB1B1B1),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ]))))
                  ]))
            ]),
          ) ,
        );
      }
    );
  }
}
