import 'dart:convert';

import 'package:get/get.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CallController extends GetxController{
  var MessageData = <String, dynamic>{}.obs;
  var TypeTelemedicine="".obs;
  // RxBool IsJoined=false.obs;
  void setMessageDataValue(Map<String, dynamic> data) async{
    MessageData.value = data;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('messageData', jsonEncode(data)); // Save as J
    update();
  }

  Future<Map<String, dynamic>> getMessageValue() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataString = prefs.getString('messageData');
    if (dataString != null) {
      MessageData.value = jsonDecode(dataString); // Convert JSON string back to a map
    }
    return MessageData.value;
  }
  setNull(){
    MessageData.value={};
    update();
  }
  // bool IsVideoJoined(){
  //   // IsJoined.value=!IsJoined.value;
  //
  //   update();
  //   // return IsJoined.value;
  // }
  UpdateValue(String Type){

    TypeTelemedicine.value=Type;
    if(TypeTelemedicine.value=="Telemedicine Ended"){
      JitsiMeet().hangUp();

    }
    update();
  }
}