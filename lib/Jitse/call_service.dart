import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/ios_params.dart';
import 'package:flutter_callkit_incoming/entities/notification_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../AuthenticateLogin/Authenticate.dart';
import '../GetStorage/HiveBox.dart';



import '../Screens/MainScreens/JitseScreen/call_state.dart';
import 'call_controller.dart';
import 'navigation_service.dart';

class CallService{
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final callState=CallState.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  Map<String,dynamic> messagingData={};
  CallController controller=Get.put(CallController());

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    ////(//(
    return token!;
  }
  void isRefreshToken() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
     // //(//(
    });
  }
  Future<void> requestNotificationPermissions() async {
    //(//(
    if (Platform.isIOS) {
      await messaging.requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: true,
          criticalAlert: true,
          provisional: true,
          sound: true
      );
    }
    NotificationSettings notificationSettings = await messaging
        .requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true
    );
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
     // //("user has granted permission");
    }
    else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      //("user has already granted provisional permisso");
    }
    else {
      //(//(//(
    }
  }
  Future foregroundMessage() async {
    //(//(
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true
    );
  }
  void firebaseInit(BuildContext context) {
    //(//(
    FirebaseMessaging.onMessage.listen((message) {
      //(//(
      //RemoteNotification? notification = message.data;
      //AndroidNotification? android = message.notification!.android;
      //(//(
      // //(//(
      // //(//(
      //(//(
      //(//(
      //handleIncomingCall(message.data);
      // messagedata = message;
      ////(//(
      if (Platform.isIOS) {
        foregroundMessage();
      }
      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotifications(message);
      }
    });
  }
  void initLocalNotifications(BuildContext context,
      RemoteMessage message) async {

    var androidInitSettings = const AndroidInitializationSettings(
        '@mipmap/launcher_icon');
    var IosInitSettings = const DarwinInitializationSettings();
    var InitSettings = InitializationSettings(
        android: androidInitSettings,
        iOS: IosInitSettings
    );
    await _flutterLocalNotificationsPlugin.initialize(InitSettings,
        onDidReceiveNotificationResponse: (payload) {
          handleMessage(context, message);
        }
    );
  }
  handleMessage(BuildContext context, RemoteMessage message) {
    //(//(
    if (message.data['type'] == 'text') {
      //redirect to one screen
      //(//(
      Navigator.pushNamed(context, '/jitse');
    }
    if (message.data['type'] == 'call') {
      //(//(
      NavigationService.instance.pushNamedIfNotCurrent('/jitse',arguments: message);
    }
  }
  Future<void> showNotifications(RemoteMessage message) async {

    // var textFile =  File("D:\\RahulSoftwares\\AndroidAppPractice\\patient_application\\lib\\Jitse\\temp.txt");
    // textFile.writeAsString("This is temp text file ",mode:FileMode.writeOnly);


    //(//(
    //(//( 

    controller.UpdateValue(message.data['type']);
    // Get.dialog(Notificationmodel(
    //   title: message.data['message'],
    //   body: message.data['roomName'],
    //
    // ));
    //(//( 
    if (message.data['type'] == "Telemedicine") {
      handleIncomingCall(message.data);
    }
    else if(message.data['type']=="Telemedicine Ended"){
      NavigationService.instance.pushNamedIfNotCurrent('/home');
      await HiveBox().DeleteData();
    }

    // else {
    AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
      // message.notification!.android!.channelId.toString(),
        "high_importance_channel",

        // message.notification!.android!.channelId.toString(),
        message.data['message'].toString(),


        importance: Importance.max,
        showBadge: true,
        playSound: true

    );
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        androidNotificationChannel.id,
        androidNotificationChannel.name,
        channelDescription: 'FLutter Notification',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        ticker: 'ticker',
        sound: androidNotificationChannel.sound

    );
    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,

    );
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails
    );
    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.data['message'],
          message.data['roomNo'],
          notificationDetails);
    });
  }
  // }
  void handleIncomingCall(Map<String, dynamic> data) async{
    ////(//(print))("Call handling incoming is :: ${callState.isInCall}");
    // //(//(print))("Controller Isvideo caller ${controller.IsJoined}");
    // if(controller.IsVideoJoined()){
    if(true){
      //(//(print))("Call handling incoming is :: ${callState.isInCall}");
      if(data['type']=="Telemedicine"){
      await showCallkitIncoming(data);
      }
    }
    else{
      //(//(print))("All ready in call");
      // CallScreen().handleCallEvents();
    }


  }
  Future<void> showCallkitIncoming(Map<String,dynamic> message) async {
    ////(//(print))("showing call kit $uuid");
    //(//(print))("Showing kit data is :: ${message}");
    controller.setMessageDataValue(message);
    //(//(print))("controller data is :: ${controller.MessageData}");
    //SharedPreferences prefs=await SharedPreferences.getInstance();

    messagingData=message;
    bool isloggedIn=Authenticate().isLoggedIn();
    if(isloggedIn) {
      final params = CallKitParams(
        id: message['telemedicineId'],
        nameCaller: message['message'],
        appName: message['message'],
        avatar: '',
        handle: '0123456789',
        type: 0,
        duration: 30000,
        textAccept: 'Accept',
        textDecline: 'Decline',
        missedCallNotification: const NotificationParams(
          showNotification: true,
          isShowCallback: true,
          subtitle: 'Missed call',
          callbackText: 'Call back',
        ),
        extra: <String, dynamic>{'userId': message['originalRoomName'],'type':message['type']},
        headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
        android: const AndroidParams(
          isCustomNotification: true,
          isShowLogo: false,
          ringtonePath: 'system_ringtone_default',
          backgroundColor: '#0955fa',
          backgroundUrl: 'assets/test.png',
          actionColor: '#4CAF50',
          textColor: '#ffffff',
        ),
        ios: const IOSParams(
          iconName: 'CallKitLogo',
          handleType: '',
          supportsVideo: true,
          maximumCallGroups: 2,
          maximumCallsPerCallGroup: 1,
          audioSessionMode: 'default',
          audioSessionActive: true,
          audioSessionPreferredSampleRate: 44100.0,
          audioSessionPreferredIOBufferDuration: 0.005,
          supportsDTMF: true,
          supportsHolding: true,
          supportsGrouping: false,
          supportsUngrouping: false,
          ringtonePath: 'system_ringtone_default',
        ),
      );

      await FlutterCallkitIncoming.showCallkitIncoming(params);
    }
    else{
      //(//(print))("user not logged in call ignored");
    }
  }


  void checkAndNavigationCallingPage() async {
    // //(//(print))("i am at check and nav");
    //
    // //(//(print))("Data from users is :: ${data}");
    // Map<String, dynamic> messagedata = {};
    // //(//(print))("checking czall and navigate funcn");
    // //(//(print))("Messga e data is ::::>> ${messagingData ?? "empty"}");
    // if (messagingData.isEmpty) {
    //   // await GetMessageData().then((value){
    //   //   //(//(print))("value from bg is :: $value");
    //   //   messagingData=value;
    //   messagingData = jsonDecode(
    //       SharedPrefsService().prefs.getString('messageNotification') ?? '');
    //
    //   //(//(print))("Messaging again data is :: ${messagingData}");
    //(//(print))("Current Navigator State: ${NavigationService.instance.navigationKey
        //.currentState}");

    // NavigationService.instance.pushNamedIfNotCurrent(
    //     '/jitse');
  }


  //


  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    //(//(print))("state of the application is :: $state");
    if (state == AppLifecycleState.resumed) {
      //Check call when open app from background
      //checkAndNavigationCallingPage();
    }
  }
  void handleCallEvents() {
    //(//(print))("handling events at "

    FlutterCallkitIncoming.onEvent.listen((event) {
      //(//(print))("event is :: $event");

      if (event!.event == Event.actionCallAccept) {
        HiveBox().StoreCallData(event.body);
        if (Authenticate().isLoggedIn()) {
          //(//(print))("Call is accepted");
          //(//(print))("${event.body}");
          //(//(print))("Json encode is ${jsonEncode(event.body)}");
          //(//(print))(event.body['id']);
          // //(//(print))("Json Decode is ${jsonDecode(event.body)}");
          NavigationService.instance.pushNamedIfNotCurrent(
              '/jitse', arguments: jsonEncode(event.body));
          //checkAndNavigationCallingPage();
        }
      }
      if (event.event == Event.actionCallDecline) {
        //(//(print))("call is declined");
      }
      //  switch (event!.event) {
      //     case Event.ACTION_CALL_INCOMING:
      //     // Handle incoming call
      //       break;
      //     case Event.ACTION_CALL_ACCEPT:
      //     // Handle call accepted
      //       //(//(print))('Call accepted');
      //       // Navigate to the call screen or perform any other action
      //       NavigationService.instance.pushNamed('/jitse', arguments: event.body);
      //       break;
      //     case Event.ACTION_CALL_DECLINE:
      //     // Handle call declined
      //       //(//(print))('Call declined');
      //       break;
      //     case Event.ACTION_CALL_ENDED:
      //     // Handle call ended
      //       //(//(print))('Call ended');
      //       break;
      //     case Event.ACTION_CALL_TIMEOUT:
      //     // Handle call timeout
      //       //(//(print))('Call timed out');
      //       break;
      //     case Event.ACTION_CALL_CALLBACK:
      //     // Handle call callback
      //       //(//(print))('Call callback');
      //       break;
      //     default:
      //       //(//(print))('Unhandled event: ${event.event}');
      //       break;
      //   }
    });
  }
}
