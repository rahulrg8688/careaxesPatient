import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class AppointmentSuccessPage extends StatefulWidget {
  const AppointmentSuccessPage({super.key});

  @override
  State<AppointmentSuccessPage> createState() => _AppointmentSuccessPageState();
}

class _AppointmentSuccessPageState extends State<AppointmentSuccessPage> {
  bool ShowImage=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        ShowImage=true;
      });
      Future.delayed(Duration(seconds: 3),(){
        setState(() {
          ShowImage=false;
        });
        Get.offAndToNamed("/home");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          child:Image.asset("assets/gif/Gifs_done.gif")
        ),
      ),
    );
  }
}
