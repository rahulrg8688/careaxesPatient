import 'package:hive_flutter/adapters.dart';

class HiveBox{
  static final HiveBox _instance=HiveBox._internal();
  Box? _box;
  factory HiveBox(){
    return _instance;
  }
  HiveBox._internal();
  Future<void> init() async{
    await Hive.initFlutter();
    _box=await Hive.openBox('TokenBox');
  }

  Box? get box=>_box;
  StoreCallData(Map<String,dynamic> data) async{
    print("Storing data is :: $data");
    if(box!=null){
      await _box?.put('CallData',data as Map<String,dynamic>);
    }
  }
  Map<String,dynamic> getStoreCallData(){

    Map<String,dynamic>? CallData= _box?.get('CallData');
    print("Call data is :: $CallData");
    if(CallData!=null){
      return CallData;
    }
    return {};
  }
  StoreRandomData(Map<String,dynamic> random)  async{
    print("Storing data is :: $random");
    if(box!=null){
      await _box?.put('CallData11',random as Map<String,dynamic>);
    }
  }
  Map<String,dynamic> getRandomData(){

    Map<String,dynamic>? CallData= _box?.get('CallData11');
    print("Call data is :: $CallData");
    if(CallData!=null){
      return CallData;
    }
    return {};
  }
  DeleteData(){
    if(_box==null){
      init();
    }
    _box?.delete('CallData');
  }
  StoreToken(String value) async{
    if(_box!=null){
      await _box?.put('jwtToken',value);
    }

  }
  String? getToken(){
    String? token= _box?.get('jwtToken');
    if(token!=null){
      return token;
    }
    return null;
  }
  DeleteToken(){
    _box?.delete('jwtToken');
  }

  StoreDeviceToken(String deviceToken) async{
    if(_box==null){
      init();
    }
    await _box?.put('DeviceToken',deviceToken);
  }
  String? GetDeviceToken(){
    String? deviceToken=_box?.get('DeviceToken');
    if(deviceToken!=null){
      return deviceToken;
    }
    return null;
  }
  DeleteDeviceToken(){
    _box?.delete('DeviceToken');
  }
  StoreReferenceToken(String? ReferenceToken) async{
    if(_box==null){
      init();
    }
    await _box?.put('ReferenceToken',ReferenceToken);
  }
  String? GetReferenceToken(){
    String? ReferenceToken=_box?.get('ReferenceToken');
    if(ReferenceToken!=null){
      return ReferenceToken;
    }
    return null;
  }
  DeleteReferenceToken() {
    _box?.delete('ReferenceToken');
  }
  StoreSpecializationList(List? Data) async{
    if(_box==null){
      init();
    }
    await _box?.put('SpecializationList', Data);
  }
  List? GetSpecializationList(){
    List? SpecializationList=_box?.get('SpecializationList');
    if(SpecializationList!=null){
      return SpecializationList;
    }
    return null;
  }


}