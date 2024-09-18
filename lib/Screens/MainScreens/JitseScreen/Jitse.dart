import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../GetStorage/HiveBox.dart';
import '../../../Jitse/call_controller.dart';
import '../../../Jitse/navigation_service.dart';

import 'call_state.dart';


class Jitse extends StatefulWidget {

  final dynamic data;
  bool pressed=true;
  Jitse({super.key,required this.pressed,required this.data});
  CallController callcontroller=CallController();


  @override
  State<Jitse> createState() => JitseState();
}

class JitseState extends State<Jitse> with WidgetsBindingObserver{
  final callState=CallState.instance;
//CallController controller=Get.put(CallController());
  CallController cont=CallController();
  final CallController controller = Get.find<CallController>();

// GetMessageData() async{
  //   SharedPreferences prefs=await SharedPreferences.getInstance();
  //   prefs.remove('messageNotification');
  //   //
  //   // String? data=(prefs.getString('messageNotification'));
  //   // print("Getting call screen pref data is ${jsonDecode(data!)}");
  //   // dynamic message=jsonDecode(data);
  //   // print("After pref data is ${message}");
  //   // data=message.toString();
  //   // setState(() {
  //   //   print("Async data is $data");
  //   // });
  //   // //print("message data of shared preference is :: ${messagedata.data.toString()}");
  //   // return message;
  // }
  Map<String, dynamic> payload = {};
  dynamic data;
  //Joinclass classjoin=Joinclass();
  GetData()async{
    print("gettttttttt");
    // await GetMessageData().then((value){
    //   setState(() {
    //     print("data is :: ${data}");
    //     data=value;
    //   });
    // });
  }
  @override
  void initState() {
    super.initState();
    print(HiveBox().getStoreCallData());
    print("Widget data from jitse class is :: ${(widget.data)}");

    // print("widget data of each is :: ${widget.data['id']}");
    payload=jsonDecode(widget.data);
    print("widget payload is :: $payload");

    print("original room no is  ${payload['extra']['userId']}");
    WidgetsBinding.instance.addObserver(this);
    // _loadData();
    print("widget controller data is :: ${widget.callcontroller.MessageData}");


    // GetMessageData();

    //print("widget data is :: ${widget.data}");
    print("widget is pressed is :: ${widget.pressed}");


    // print("Is pressed is : ${widget.pressed}");
    // print("Data of widget is : ${widget.data}");
    //
    // String jsonString = widget.data;


    // print("Json String is :: $jsonString");
    //
    // payload = jsonDecode(jsonString);
    // print(payload["title"]);
    // String bodyString = (payload['body'].replaceAll("'", '"'));
    // payload['body'] = jsonDecode(bodyString);
    // print("Data from the loading is $payload");
    // print("Data of title is : ${payload['title']}");
    // print("Data of payload is : ${payload['body']['room no']}");
    if(widget.pressed){
      print("Data is :: ${widget.pressed}");

      join();
    }
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Save data when app is paused
      print("paused");
      // _saveData();
    } else if (state == AppLifecycleState.resumed) {
      // Load data when app is resumed
      print("resumed");

    }
  }
  // Future<void> _saveData() async {
  //   print("Savedata");
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('messageData', jsonEncode(controller.MessageData.value));
  // }
  // Future<void> _loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? dataString = prefs.getString('messageData');
  //   print("load data ${dataString}");
  //   if (dataString != null) {
  //     setState(() {
  //       controller.MessageData.value = jsonDecode(dataString);
  //     });
  //   }
  // }
  bool audioMuted = true;
  bool videoMuted = true;
  bool screenShareOn = false;
  List<String> participants = [];
  final _jitsiMeetPlugin = JitsiMeet();

  join() async {
    HiveBox().DeleteData();

    //final CallController controller = Get.find<CallController>();
    //controller.IsVideoJoined();

    // print("Controller jitse before  caller ${controller.IsJoined}");
    // //controller.IsVideoJoined();
    // print("Controller jitse afetr caller ${controller.IsJoined}");
    //callState.StartCall();
    print("Call State end is :: ${callState.isInCall}");
    //print("room no is ::${payload['id']}");
    final Map<String, dynamic> messageData = await controller.getMessageValue();
    print("join method data is :: ${controller.MessageData}");
    print("join method message data is :: ${messageData}");
    var options = JitsiMeetConferenceOptions(
        serverURL: "https://conference.careaxes.net",
        room: payload['extra']['userId'],
        configOverrides: {
          "startWithAudioMuted": true,
          "startWithVideoMuted": true,
        },
        featureFlags: {
          FeatureFlags.addPeopleEnabled: true,
          FeatureFlags.welcomePageEnabled: false,
          FeatureFlags.preJoinPageEnabled: false,
          FeatureFlags.unsafeRoomWarningEnabled: false,
          FeatureFlags.resolution: FeatureFlagVideoResolutions.resolution720p,
          FeatureFlags.audioFocusDisabled: true,
          FeatureFlags.audioMuteButtonEnabled: true,
          FeatureFlags.audioOnlyButtonEnabled: true,
          FeatureFlags.calenderEnabled: true,
          FeatureFlags.callIntegrationEnabled: true,
          FeatureFlags.carModeEnabled: true,
          FeatureFlags.closeCaptionsEnabled: true,
          FeatureFlags.conferenceTimerEnabled: true,
          FeatureFlags.chatEnabled: true,
          FeatureFlags.filmstripEnabled: true,
          FeatureFlags.fullScreenEnabled: true,
          FeatureFlags.helpButtonEnabled: true,
          FeatureFlags.inviteEnabled: false,
          FeatureFlags.androidScreenSharingEnabled: true,
          FeatureFlags.speakerStatsEnabled: true,
          FeatureFlags.kickOutEnabled: true,
          FeatureFlags.liveStreamingEnabled: true,
          FeatureFlags.lobbyModeEnabled: true,
          FeatureFlags.meetingNameEnabled: false,
          FeatureFlags.meetingPasswordEnabled: false,
          FeatureFlags.notificationEnabled: true,
          FeatureFlags.overflowMenuEnabled: true,
          FeatureFlags.pipEnabled: true,
          FeatureFlags.pipWhileScreenSharingEnabled: true,
          FeatureFlags.preJoinPageHideDisplayName: true,
          FeatureFlags.raiseHandEnabled: true,
          FeatureFlags.reactionsEnabled: true,
          FeatureFlags.recordingEnabled: true,
          FeatureFlags.replaceParticipant: true,
          FeatureFlags.securityOptionEnabled: true,
          FeatureFlags.serverUrlChangeEnabled: true,
          FeatureFlags.settingsEnabled: true,
          FeatureFlags.tileViewEnabled: true,
          FeatureFlags.videoMuteEnabled: true,
          FeatureFlags.videoShareEnabled: true,
          FeatureFlags.toolboxEnabled: true,
          FeatureFlags.iosRecordingEnabled: true,
          FeatureFlags.iosScreenSharingEnabled: true,
          FeatureFlags.toolboxAlwaysVisible: true,
        },
        userInfo: JitsiMeetUserInfo(
          displayName: payload['nameCaller'][0].toString().toUpperCase()??'R',
          email:payload['id'],
// "https://avatars.githubusercontent.com/u/57035818?s=400&u=02572f10fe61bca6fc20426548f3920d53f79693&v=4"),
        ) );

    var listener = JitsiMeetEventListener(
      conferenceJoined: (url) {
        debugPrint("conferenceJoined: url: $url");
      },
      conferenceTerminated: (url, error) {
        debugPrint("conferenceTerminated: url: $url, error: $error");
        HiveBox().DeleteData();

        //Get.toNamed("/home");

        NavigationService.instance.pushNamedIfNotCurrent('/home');
        debugPrint("I am cancelling the call");
        FlutterCallkitIncoming.endCall(payload['id']);
        // controller.IsJoined.value=false;

      },
      conferenceWillJoin: (url) {
        debugPrint("conferenceWillJoin: url: $url");
      },
      participantJoined: (email, name, role, participantId) {
        debugPrint(
          "participantJoined: email: $email, name: $name, role: $role, "
              "participantId: $participantId",
        );
        participants.add(participantId!);
      },
      participantLeft: (participantId) {
        debugPrint("participantLeft: participantId: $participantId");
      },
      audioMutedChanged: (muted) {
        debugPrint("audioMutedChanged: isMuted: $muted");
      },
      videoMutedChanged: (muted) {
        debugPrint("videoMutedChanged: isMuted: $muted");
      },
      endpointTextMessageReceived: (senderId, message) {
        debugPrint(
            "endpointTextMessageReceived: senderId: $senderId, message: $message");
      },
      screenShareToggled: (participantId, sharing) {
        debugPrint(
          "screenShareToggled: participantId: $participantId, "
              "isSharing: $sharing",
        );
      },
      chatMessageReceived: (senderId, message, isPrivate, timestamp) {
        debugPrint(
          "chatMessageReceived: senderId: $senderId, message: $message, "
              "isPrivate: $isPrivate, timestamp: $timestamp",
        );
      },
      chatToggled: (isOpen) => debugPrint("chatToggled: isOpen: $isOpen"),
      participantsInfoRetrieved: (participantsInfo) {
        debugPrint(
            "participantsInfoRetrieved: participantsInfo: $participantsInfo, ");
      },
      readyToClose: () {
        debugPrint("readyToClose");
      },
    );
    await _jitsiMeetPlugin.join(options, listener);

  }


  hangUp() async {
     HiveBox().DeleteData();
    await _jitsiMeetPlugin.hangUp();
    print("Call is hanging up flutter kit is ended");
    FlutterCallkitIncoming.endCall(payload['id']);
    // controller.IsJoined.value=false;
    NavigationService.instance.pushNamedIfNotCurrent('/home');

  }

  setAudioMuted(bool? muted) async {
    var a = await _jitsiMeetPlugin.setAudioMuted(muted!);
    debugPrint("$a");
    setState(() {
      audioMuted = muted;
    });
  }

  setVideoMuted(bool? muted) async {
    var a = await _jitsiMeetPlugin.setVideoMuted(muted!);
    debugPrint("$a");
    setState(() {
      videoMuted = muted;
    });
  }

  sendEndpointTextMessage() async {
    var a = await _jitsiMeetPlugin.sendEndpointTextMessage(message: "HEY");
    debugPrint("$a");

    for (var p in participants) {
      var b =
      await _jitsiMeetPlugin.sendEndpointTextMessage(to: p, message: "HEY");
      debugPrint("$b");
    }
  }

  toggleScreenShare(bool? enabled) async {
    await _jitsiMeetPlugin.toggleScreenShare(enabled!);

    setState(() {
      screenShareOn = enabled;
    });
  }

  openChat() async {
    await _jitsiMeetPlugin.openChat();
  }

  sendChatMessage() async {
    var a = await _jitsiMeetPlugin.sendChatMessage(message: "HEY1");
    debugPrint("$a");

    for (var p in participants) {
      a = await _jitsiMeetPlugin.sendChatMessage(to: p, message: "HEY2");
      debugPrint("$a");
    }
  }

  closeChat() async {
    await _jitsiMeetPlugin.closeChat();
  }

  retrieveParticipantsInfo() async {
    var a = await _jitsiMeetPlugin.retrieveParticipantsInfo();
    debugPrint("$a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              onPressed: join,
              child: const Text("Join"),
            ),
            TextButton(onPressed: hangUp, child: const Text("Hang Up")),
            Row(children: [
              const Text("Set Audio Muted"),
              Checkbox(
                value: audioMuted,
                onChanged: setAudioMuted,
              ),
            ]),
            Row(children: [
              const Text("Set Video Muted"),
              Checkbox(
                value: videoMuted,
                onChanged: setVideoMuted,
              ),
            ]),
            TextButton(
              onPressed: sendEndpointTextMessage,
              child: const Text("Send Endpoint Text Message"),
            ),
            TextButton(
              onPressed: () => toggleScreenShare(!screenShareOn),
              child: Text(
                  screenShareOn ? "Stop Screen Share" : "Start Screen Share"),
            ),
            TextButton(onPressed: openChat, child: const Text("Open Chat")),
            TextButton(onPressed: sendChatMessage, child: const Text("Send Chat Message")),
            TextButton(onPressed: closeChat, child: const Text("Close Chat")),
            TextButton(
              onPressed: retrieveParticipantsInfo,
              child: const Text("Retrieve Participants Info"),
            ),
          ],
        ),
      ),
    );
  }
}
