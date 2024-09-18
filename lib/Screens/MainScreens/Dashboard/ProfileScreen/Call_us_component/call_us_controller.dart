import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUsController extends GetxController{

  Future<void> launchUrl(String phoneNumber) async{
    final String url = 'tel:$phoneNumber';
    try{

      if(await canLaunch(url)) {
        await launch(url);
      }
      else{
        throw 'could not launch $url';
      }
    }

    catch(e){
      print(e.toString());
    }
  }
  //launchUrl(('8886600888'));
}