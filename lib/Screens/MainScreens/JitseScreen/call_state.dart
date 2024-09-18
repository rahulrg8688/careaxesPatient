class CallState{
  CallState._privateConstructor();
  static final CallState instance=CallState._privateConstructor();

  bool isInCall=false;

  void StartCall(){
    isInCall=true;
  }
  void EndCall(){
    isInCall=false;
  }

}