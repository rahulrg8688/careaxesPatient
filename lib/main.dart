import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';

import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/Session_component/session_invoice_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'GetStorage/HiveBox.dart';
import 'GetStorage/shared_prefs_service.dart';
import 'Jitse/call_controller.dart';
import 'Jitse/call_service.dart';
import 'Jitse/my_firebase_messaging_service.dart';
import 'Jitse/navigation_service.dart';
import 'Screens/MainScreens/AboutDoctorScreen/AboutDoctor.dart';

import 'Screens/MainScreens/AboutDoctorScreen/AboutDoctorController.dart';
import 'Screens/MainScreens/Dashboard/ProfileScreen/Admission_component/admission_screen.dart';
import 'Screens/MainScreens/Dashboard/ProfileScreen/Call_us_component/call_us_screen.dart';
import 'Screens/MainScreens/Dashboard/ProfileScreen/Change_password_screen/change_password_screen.dart';

import 'Screens/MainScreens/Dashboard/ProfileScreen/MyAppointmentScreen/appointment_screen.dart';
import 'Screens/MainScreens/Dashboard/ProfileScreen/MyInvoices/Scan_invoice_component/scan_invoice_screen.dart';
import 'Screens/MainScreens/Dashboard/ProfileScreen/MyInvoices/lab_invoice_screen/lab_reports_invoice_screen.dart';
import 'Screens/MainScreens/Dashboard/ProfileScreen/MyInvoices/pharma_invoice_screen/pharma_invoice_screen.dart';

import 'Screens/MainScreens/Dashboard/ProfileScreen/MyRecords/LabReportsScreen/lab_reports_screen.dart';
import 'Screens/MainScreens/Dashboard/ProfileScreen/MyRecords/MyPrescriptions/prescriptions_screen.dart';
import 'Screens/MainScreens/Dashboard/ProfileScreen/My_profile_screen_component/my_profile_screen.dart';
//import 'Screens/MainScreens/Dashboard/ProfileScreen/Scan_invoice_component/scan_invoice_screen.dart';
import 'Screens/MainScreens/Dashboard/ProfileScreen/Session_component/About_session_doctor_component/About_session_doctor.dart';
//import 'Screens/MainScreens/Dashboard/ProfileScreen/lab_invoice_screen/lab_reports_invoice_screen.dart';
//import 'Screens/MainScreens/Dashboard/ProfileScreen/pharma_invoice_screen/pharma_invoice_screen.dart';
import 'Screens/MainScreens/JitseScreen/Jitse.dart';
import 'Screens/MainScreens/JitseScreen/Jitse1.dart';
import 'Screens/MainScreens/ReviewAppointmentScreen/review_appointment.dart';
import 'Screens/MainScreens/ReviewAppointmentScreen/review_appointment_controller.dart';
import 'Screens/MainScreens/dashboard_screens/dashboard.dart';
import 'Screens/MainScreens/recent_doctors_see_all_component/recent_doctor.dart';
import 'Screens/MainScreens/see_all_doctors/see_all.dart';
import 'Screens/MainScreens/specialization_component/specialization_seeall.dart';
import 'Screens/Overrides.dart';

import 'Screens/SplashScreens/SplashScreenWrapper.dart';
import 'Screens/phonenumberScreen/PasswordLogin/Password.dart';
import 'Screens/phonenumberScreen/PhoneNumber/phonenumber.dart';
import 'Screens/phonenumberScreen/VerifyOtp/VerifyOtpScreen.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveBox.init();
  print("I am background");
  await Firebase.initializeApp();
  await SharedPrefsService().init();
  final CallController callController = Get.put(CallController());
  await callController.getMessageValue();
  print("Calling Call Controller");
  //print("Device message data is :: ${StorageService.GetMessageData()}");

  // print("CallCOntroller background called is :: ${CallController().IsJoined}");
  //
  // print("CallCOntroller method background called is :: ${CallController()
  //     .IsJoined}");
  await _storeNavigationData(message.data);
  final prefs = await SharedPreferences.getInstance();
  String? jsonData = prefs.getString('navigation_data');
  print("Background not is :: $jsonData");
  if(message.data['type']=="Telemedicine") {
    await CallService().showNotifications(message);
  }
}
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

HiveBox hiveBox=HiveBox();
Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
  print("state of the application is :: $state");
  if (state == AppLifecycleState.resumed) {
    //Check call when open app from background
    //checkAndNavigationCallingPage();
    print("Background to opened");
  }
  else if(state==AppLifecycleState.detached){
    print("App detached");
  }
  else if(state==AppLifecycleState.inactive){
    print("App Inactive");
  }
  else if(State==AppLifecycleState.paused){
    print("App paused");

  }
  else if(State==AppLifecycleState.hidden){
    print("App Hidden");

  }
  else if(State==AppLifecycleState.values){
    print("App values");

  }
}

Future<void> _storeNavigationData(Map<String, dynamic> data) async {
  final prefs = await SharedPreferences.getInstance();
  //await prefs.setString('navigation_screen', screenToNavigate);
  String JsonData=jsonEncode(data);
  await prefs.setString('navigation_data', JsonData);


}

Future<Map<String, dynamic>?> _retrieveNavigationData() async {
  final prefs = await SharedPreferences.getInstance();
  String? jsonData = prefs.getString('navigation_data');

  if (jsonData != null) {
    return jsonDecode(jsonData) as Map<String, dynamic>;
  }
  return null;
}
Future<void> configureBackgroundService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      isForegroundMode: true,
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}
@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    final notificationChannel = AndroidNotificationChannel(
      'background_service_id',
      'Background Service',

      description: 'Background Service',
      importance: Importance.min, // low importance level
    );
    // await service.startForeground(
    //   notificationChannel,
    //   null
    // );
    service.setAutoStartOnBootMode(true);
    service.setAsForegroundService();
    // service.on('setAsForeground').listen((event) {
    //   service.setAsForegroundService();
    // });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}


void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
 //FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // await configureBackgroundService();
  await hiveBox.init();
  await didChangeAppLifecycleState;
  await SharedPrefsService().init();
  print("Main patientId is :: ${SharedPrefsService()
      .GetReferenceIdForPatient()}");
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  final CallController callController = Get.put(CallController());
  await callController.getMessageValue();


  HttpOverrides.global = MyHttpOverrides();
  final context = SecurityContext.defaultContext;
  context.allowLegacyUnsafeRenegotiation = true;
  final httpClient = HttpClient(context: context);
  await GetStorage.init();
  final navigationData = await _retrieveNavigationData();
  print("navigation data is ;; ${navigationData}");
  // if (navigationData != null) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     NavigationService.instance.pushNamed(
  //       '/jitse1',
  //       arguments: {
  //
  //         jsonEncode(navigationData),
  //       },
  //     );
  //   });
  // }
  runApp(ScreenUtilInit(
    designSize: Size(375,812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context,child)=>MyApp(navigationData: navigationData),
  ));
}

class MyApp extends StatefulWidget {
  final Map<String, dynamic>? navigationData;

//final Hivebox hiveBox;
  const MyApp({super.key,this.navigationData});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void backgroundService() async {
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    if (isRunning) {
      Timer.periodic(const Duration(seconds: 1), (timer) async {
        if (mounted) {
          setState(() {
            debugPrint("runningSanjay");

          });
        }
      });
    } else {
      service.startService();
    }

  }
  bool isAvailableToken=false;
  String initialRoute='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // backgroundService();
    // _checkLoginStatus();
    if (widget.navigationData != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        NavigationService.instance.pushNamed(
          '/jitse1',
          arguments: jsonEncode(widget.navigationData),
        );
      });
    }
  }
  bool _hasNavigated=false;
  @override
  Widget build(BuildContext context) {
    final MyFirebaseMessagingService _myFirebaseMessagingService = MyFirebaseMessagingService();
    _myFirebaseMessagingService.initialize(context);
    return GetMaterialApp(
      navigatorKey: NavigationService.instance.navigationKey,
      navigatorObservers: <NavigatorObserver>[NavigationService.instance.routeObserver],
      useInheritedMediaQuery: true,

      title: 'Patient Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF5E55EA)),
        scaffoldBackgroundColor: Color.fromARGB(255, 231, 233, 234),//0xFFEFEFEF//FFE7E9EA
        useMaterial3: true,//255, 231, 233, 234
      ),

      // :
      getPages: [
        GetPage(name: "/", page:()=>Splashscreenwrapper()),
        GetPage(name: "/PhoneNumber", page:()=>phonenumber()),
        GetPage(name: "/VerifyOtp", page:()=>Verifyotpscreen()),
        GetPage(name: "/passwordLogin", page:()=>Password()),
        GetPage(name: "/home", page:()=>Dashboard()),
        GetPage(name: "/AboutDoctor", page:()=> Aboutdoctor(
            DoctDetails: Get.arguments['DoctDetails'],

        )),
        GetPage(name: "/LabReports", page: ()=>LabReportsScreen()),
        GetPage(name: "/MyAppointments", page:()=>AppointmentScreen()),
        GetPage(name: "/MyPrescriptions", page:()=>PrescriptionsScreen()),
        GetPage(name: "/LabInvoiceReport", page:()=>LabReportsInvoiceScreen()),
        GetPage(name: "/SeeAllDoctors", page: ()=>SeeAll()),
        GetPage(name: "/ChangePassword", page:()=> ChangePasswordScreen()),
        GetPage(name: "/SeeAllSpecialization", page:()=>SpecializationSeeall()),
        GetPage(name: "/SeeAllRecentDoctors", page:()=>RecentDoctor()),
        GetPage(name: "/MyprofileUpdate", page:()=>MyProfileScreen()),
        GetPage(name: "/jitse", page:()=>Jitse(data:Get.arguments,pressed: true),
        ),
        GetPage(name: "/jitse1", page:()=>Jitse1(data:Get.arguments,pressed: true),
        ),
        GetPage(name: "/SessionScreen", page:()=>SessionInvoiceScreen()),
        GetPage(name: "/PharmaInvoiceScreen", page:()=> PharmaInvoiceScreen()),
        GetPage(name: "/ScanInvoiceScreen", page:()=>ScanInvoiceScreen()),
        GetPage(name: "/PatientAdmissions", page: ()=>AdmissionScreen()),
        GetPage(name: "/ReviewAppointment", page: ()=>ReviewAppointment(

        )),
        GetPage(name: "/AboutSessionDoctor", page: ()=>AboutSessionDoctor()),
        GetPage(name: "/CallScreen", page: ()=>CallUsScreen())
      ],
      home:Splashscreenwrapper(),

    );
  }
}

