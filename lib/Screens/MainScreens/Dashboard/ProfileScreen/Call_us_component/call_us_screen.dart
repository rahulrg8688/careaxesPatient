import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/Call_us_component/call_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CallUsScreen extends StatelessWidget {
  const CallUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CallUsController callUsController=Get.put(CallUsController());
    final size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;
    print("height is $height");
    print("width is $width");

    return Scaffold(
      appBar: AppBar(
        title: Text("Call Us"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color:Colors.white12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: 235,
                height: 35,

                child: Text("Get in touch with Us",
                style: TextStyle(
                  fontFamily: "Satoshi",
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color:Color(0xFF000000)
                ),
                ),
              ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              height:45,
              width:295,
              child: Text("We are here to solve your issue contact us in multiple ways.",
              style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight:FontWeight.w500,
                fontSize: 16,
                color:Color(0xFF5C6A72)
              ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.white,
              height: 74,
              width: 328,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: GestureDetector(
                      onTap: (){
                        callUsController.launchUrl('8886600888');
                      },
                      child: Text("Request a call back")))

                ],
              ),
            )
          ],
        ),
      )

    );
  }
}
