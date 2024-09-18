import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../phonenumberScreen/PhoneNumber/phonenumber.dart';

class SplashScreen3 extends StatelessWidget {
  SplashScreen3({super.key,required this.pageController3});
  final PageController pageController3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Maternity Support",
            style:  TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFF000000),
            ),
          ),
          SizedBox(height: 10),
          Text(
              '''No need to travel with your heavy 
            stomach take support with careaxes''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily:
                'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFFB5B5B5),
              )
          ),
          SizedBox(height: 30),
          SizedBox(
            width:double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async{

                await Future.delayed(Duration(milliseconds: 50), () {
                  Get.offAndToNamed("/PhoneNumber"); // Navigate to the new screen
                });


              },
              style: ElevatedButton.styleFrom(
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                backgroundColor: Color(0xFF5E55EA),

              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Get Started",

                        style:TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                        )
                    ),
                    Icon(Icons.arrow_forward_sharp,
                      size: 30,
                      color:Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
