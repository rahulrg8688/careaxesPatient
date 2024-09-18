

import '../GetStorage/HiveBox.dart';


class Authenticate{
  bool isLoggedIn(){
    String? token=HiveBox().getToken();
    print("Is Authenticate token is :: $token");
    if(token!=null){
      return true;
    }
    return false;
  }
}