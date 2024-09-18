import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

import 'PhoneNumberController.dart';

class phonenumber extends StatefulWidget {

  phonenumber({super.key});

  @override
  State<phonenumber> createState() => _phonenumberState();
}

class _phonenumberState extends State<phonenumber> {
  bool IsTapped=false;
  Phonenumbercontroller controller=Get.put(Phonenumbercontroller());

  var formkey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    IsTapped=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
        appBar: AppBar(

        ),
        body: GetBuilder<Phonenumbercontroller>(
            builder: (controller) {
              return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),

                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 280,
                          margin: EdgeInsets.fromLTRB(1, 0, 1, 44),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '''Please enter your mobile number to verify''',
                              style: TextStyle(
                                fontFamily: 'Playfair Display',
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 19),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Enter Your mobile number',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        Form(
                          key: formkey,

                          child: Container(
                            margin: EdgeInsets.only(),
                            child: TextFormField(
                              controller: controller.phoneNumber,
                              onTap: (){
                                IsTapped=true;

                                setState(() {
                                  print(IsTapped);
                                });
                              },
                              validator: (val){
                                if(val==null || val.isEmpty) {
                                  return "Plz enter only numbers";
                                }
                                else if(!val.isNum){
                                  return "Plz enter only numbers";
                                }
                                else if(val.length<10){
                                  return "Plz enter valid mobile number";
                                }

                                return null;
                              },
                              onChanged: (val){
                                if(val.length!=10){
                                  controller.EnteringNewMobileNum();
                                }
                                formkey.currentState!.validate();
                              },

                              keyboardType: TextInputType.phone,
                              maxLength: 10,

                              decoration: InputDecoration(
                                prefix: Text("+91  "),
                                hintText: "Plz enter Mobile Number",
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    controller.MobileNumber();
                                  },
                                  icon: controller.IsLoading?CircularProgressIndicator():Icon(Icons.arrow_forward),

                                ),

                                // prefix: CachedNetworkImage(
                                //   imageUrl: "https://cdn.pixabay.com/photo/2021/05/24/09/24/india-6278365_1280.png",
                                //   placeholder: (context, url) => CircularProgressIndicator(),
                                //   errorWidget: (context, url, error) => Icon(Icons.error),
                                //
                                // ),
                                border: OutlineInputBorder(),
                              ),
                            ),

                          ),
                        ),

                        Container(
                          //margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Color(0xFFC1C1C1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(


                                child:
                                Row(
                                  children: [
                                    Expanded(
                                      flex:2,
                                      child: Container(
                                        margin: EdgeInsets.all(9),
                                        child: controller.GotResult?ElevatedButton(
                                          onPressed: (){
                                            print(",,,,,,");

                                            if(formkey.currentState!.validate()){
                                              if(controller.GotResult){
                                                print(controller.phoneNumber.value);
                                                controller.SendOtp();

                                              }
                                            }
                                            else{
                                              null;
                                            }

                                          },

                                          style: ElevatedButton.styleFrom(

                                              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              backgroundColor: IsTapped&&controller.GotResult?Color(0xFF5E55EA):Color(0xFFC1C1C1)
                                          ),
                                          child:Text("send OTP",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: IsTapped?Colors.white:Colors.white,
                                            ),
                                          ),):Container(),
                                      ),
                                    ),
                                    Expanded(
                                      flex:2,
                                      child: controller.GotResult?ElevatedButton(
                                        onPressed: (){
                                          print(",,,,,,");

                                          if(formkey.currentState!.validate()){
                                            if(controller.GotResult && controller.PasswordButton){
                                              print(controller.phoneNumber.value);
                                              controller.LoginWithPassword();

                                            }
                                          }
                                          else{
                                            null;
                                          }

                                        },

                                        style: ElevatedButton.styleFrom(


                                            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            backgroundColor: controller.PasswordButton&&controller.GotResult?Color(0xFF5E55EA):Color(0xFFC1C1C1)
                                        ),
                                        child:Text("Login with password",
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: controller.PasswordButton?Colors.white:Colors.white,
                                          ),
                                        ),):Container(),
                                    ),
                                  ],
                                )

                            ),
                          ),
                        ),


                      ],
                    ),



                  )
              );
            }
        )
    );






  }
}
