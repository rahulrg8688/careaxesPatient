import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../GetStorage/HiveBox.dart';
import '../../Jitse/call_service.dart';
import '../../Jitse/navigation_service.dart';

import '../MainScreens/dashboard_screens/dashboard.dart';
import 'MainSplashScreen.dart';

class Splashscreenwrapper extends StatefulWidget {
  Splashscreenwrapper({super.key});

  @override
  State<Splashscreenwrapper> createState() => _SplashscreenwrapperState();
}

class _SplashscreenwrapperState extends State<Splashscreenwrapper> {
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    CallService().getDeviceToken().then((value) {
      print("Token value is :: $value");
      HiveBox().StoreDeviceToken(value);
    });
    _checkLoginStatus();
  }
  Future<void> _checkLoginStatus() async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate a delay
    // print("Getting is :: ${SharedPrefsService().prefs.getString('patientToken')}");
    // String? token = SharedPrefsService().prefs.getString('patientToken');
    String? HiveToken = HiveBox().getToken();
    print("Main method token is :: ${HiveToken}");
    if(_hasNavigated){
      print("Duplicate found");
      return ;
    }
    _hasNavigated=true;print("TOken from Wrapper is :::>> $HiveToken");
    if(HiveToken!=null){
      // NavigationService.instance.pushNamed('/home');
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => Dashboard()));

    }
    else{
      //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctr)=>Mainsplashscreen()),(route)=>false);
      NavigationService.instance.pushNamedAndRemoveUntil('/PhoneNumber', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: CircularProgressIndicator());
  }



}

