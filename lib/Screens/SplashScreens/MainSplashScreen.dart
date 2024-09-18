import 'package:careaxes_patient/Screens/SplashScreens/MainSplashScreenController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../GetStorage/HiveBox.dart';
import '../../Jitse/call_service.dart';
import '../../Jitse/navigation_service.dart';
import '../phonenumberScreen/PhoneNumber/phonenumber.dart';
import 'SplashScreen1.dart';
import 'SplashScreen2.dart';
import 'SplashScreen3.dart';

class Mainsplashscreen extends StatefulWidget {
  Mainsplashscreen({super.key});

  @override
  State<Mainsplashscreen> createState() => _MainsplashscreenState();
}

class _MainsplashscreenState extends State<Mainsplashscreen> {
  late PageController _pageController= PageController();
  int page=0;
  void checkTokenAndNavigate() async {
    CallService().getDeviceToken().then((value) {
      print("Token value is :: $value");
      HiveBox().StoreDeviceToken(value);
    });

    String? hiveToken = HiveBox().getToken();
    print("Token from spalsh HiveBox is ::: $hiveToken");

    // Delay for splash screen animations or any other purpose
    // await Future.delayed(Duration(seconds: 0));
    //
    // if (hiveToken != null) {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (ctx) => Dashboard()));
    //
    // } else {
    //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctr)=>phonenumber()),(route)=>false);
    // //  NavigationService.instance.pushNamedAndRemoveUntil('/home', (route) => false);
    // }
  }
  void initState() {
    super.initState();
    CallService().getDeviceToken().then((value){
      print("Token value is :: $value");
      HiveBox().StoreDeviceToken(value);
      _pageController = PageController(initialPage: 0);
      checkTokenAndNavigate();
    });
    print("TOken  from Hivebox is ::: ${HiveBox().getToken()}");



  }
  final List<String> splashImages = [
    'assets/DoctorImages/SplashScreenImages1.png', // Image for Splashscreen1
    'assets/DoctorImages/SplashScreenImages.png', // Image for Splashscreen2
    'assets/DoctorImages/SplashScreenImages2.png', // Image for Splashscreen3
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    mainsplashScreencontroller mainsplashScreen=Get.put(mainsplashScreencontroller());
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds:  2)), // Delay by 2 seconds
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator or splash screen content
          return Center(
            child: CircularProgressIndicator(), // Or any other loading indicator
          );
        } else {
          // Show the modal bottom sheet after the delay
          WidgetsBinding.instance!.addPostFrameCallback((_) {

            showModalBottomSheet(
              context: context,
              isDismissible: false, // Prevent dismissing by tapping outside
              enableDrag: false,
              builder: (BuildContext context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0.r),
                        topRight: Radius.circular(20.0.r),
                      ),
                      color: Colors.white,
                    ),
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (val){
                        print("Items value is $val");

                        mainsplashScreen.SetValue(val);
                        print("Item val is ${mainsplashScreen.statevalue}");
                      },
                      children: [
                        Splashscreen1(pageController: _pageController),
                        Splashscreen2(pageController2: _pageController),
                        SplashScreen3(pageController3: _pageController),
                      ],
                    ),
                  ),
                );
              },
            );
          });

          // Return an empty container while waiting for the bottom sheet to close
          return Scaffold(

            body: Container(
              color:Color(0xFF5E55EA),

              child: Padding(
                padding:  EdgeInsets.all(40.0.w),
                child: Center(child: Image.asset(splashImages[mainsplashScreen.statevalue])),
              ),
            ),
          );
        }
      },
    );


  }
}
