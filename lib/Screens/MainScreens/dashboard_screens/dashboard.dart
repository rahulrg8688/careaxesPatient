import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Jitse/call_service.dart';

import '../Dashboard/HomeScreen/homeScreen.dart';
import '../Dashboard/HomeScreen/home_screen.dart';
import '../Dashboard/ProfileScreen/profile_screen.dart';
import '../Dashboard/notification_screen/notification.dart';
import '../Dashboard/support_screen/support_screen.dart';
import 'dashboard_controller.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with WidgetsBindingObserver {
  CallService callService=CallService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("Patient id is :: ${StorageService.GetPatientAccountId()}");
    callService.requestNotificationPermissions();
    callService.foregroundMessage();
    callService.firebaseInit(context);
    callService.getDeviceToken().then((value){
      print("Token value is :: $value");
    });
    callService.isRefreshToken();

    WidgetsBinding.instance.addObserver(this);
    callService.handleCallEvents();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  List dashboardScreens=[
    homeScreen(),
    SupportScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return GetBuilder<DashboardController>(
        init: DashboardController(),

        builder: (controller) {

          return DefaultTabController(
            length:4,
            initialIndex: 0,

            child: Scaffold(
              key:_scaffoldKey,
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: controller.BottomNavBarIndex,

                  onTap: (position){
                    print("position is : ${position}");
                    controller.bottomNavBarIndexFunc(position);
                    //controller.BottomNavBarIndex.value=position;
                    print("Controller value index : ${controller.BottomNavBarIndex}");
                  },
                  backgroundColor: Color(0xFFFFFFFF),
                  type:BottomNavigationBarType.fixed,
                  selectedItemColor: Color(0xFF5E55EA),
                  selectedIconTheme: IconThemeData(color:Color(0xFF5E55EA)),
                  unselectedIconTheme: IconThemeData(color:Colors.black),
                  unselectedItemColor: Colors.black,
                  items:[

                    BottomNavigationBarItem(icon:Icon(Icons.home,
                      size: 20,

                    ),label:"Home"),
                    BottomNavigationBarItem(icon:Icon(Icons.support_agent,size: 20,),label:"Support",backgroundColor: Colors.black),
                    BottomNavigationBarItem(icon:Icon(Icons.notifications,size: 20,),label:"Notifications"),
                    BottomNavigationBarItem(icon:Icon(Icons.account_circle,size: 20,),label:"Profile"),

                  ]
              ),
              body:dashboardScreens[controller.BottomNavBarIndex] ,
            ),
          );
        }
    );
  }
}
