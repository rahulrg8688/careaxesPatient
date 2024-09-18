import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:patient_application/Screens/MainScreens/Dashboard/ProfileScreen/Change_password_screen/change_password_controller.dart';

import 'change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  ChangePasswordController change_password_controller=Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
        builder: (change_password_controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios,
                size: 18,
                color: Colors.black12,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
              
                      Container(
                        //margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                        child: Container(
                          height:127,
                          width:127,
                          decoration: BoxDecoration(
                            color:Color(0xFFE7F0FE),
                            borderRadius: BorderRadius.circular(80)
                          ),
                          child: Icon(Icons.security,
                          color:Color(0xFF5D9DF8),
                            size: 46,
              
                          ),
              
                        ),
                      ),
                      Container(
                        height:35,
                        width: double.infinity,
                        child: Center(child: Text("Create new password",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          fontFamily: "Satoshi"
                        ),
                        )),
                      ),
                      Container(
                        height: 45,
                        width:295,
              
                        child: Text("Your new password should be different from previous password",
                        overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xFF5C6A72)
                          ),
                        ),
                      )
                    ],
                  ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 60, 0, 0),
                  child: Text("Current Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    fontStyle:FontStyle.italic ,
                    color: Color(0xFF3D4D56)
                  ),
                  ),
                ),
                  FormFiled(change_password_controller.password1, "Enter your password",change_password_controller.textAndPasswordToggleForm1,change_password_controller.IsTextAndCharform1),
                  SizedBox(height:10),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("New Password",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          fontStyle:FontStyle.italic ,
                          color: Color(0xFF3D4D56)
                      ),
                    ),
                  ),
                  FormFiled(change_password_controller.password2, "Re Enter your password",change_password_controller.textAndPasswordToggleForm2,change_password_controller.IsTextAndCharform2),
              
              
              
              
                Center(
              
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: () {
                      change_password_controller.changePasswordApi();
                              }, child:
              
                              Text("Update",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontSize: 16,
              
                              ),
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(MediaQuery.of(context).size.width,50),
                                shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                              backgroundColor: Color(0xFF2F80ED),
                              foregroundColor: Colors.white,
              
                              ),
                    ),
                  ),
                )
                ],
              ),
            ),
          );
        }
    );
  }
  Widget FormFiled(TextEditingController a,String text,VoidCallback callback,bool IsPasswordVisible){
    return Container(
      margin: EdgeInsets.all(8),
      child: TextFormField(
      obscureText: IsPasswordVisible,
        obscuringCharacter: '*',
        style: TextStyle(fontSize: 16,
        fontWeight: FontWeight.w500,
          color:Color(0xFF3D4D56)
        ),
      
        controller: a,
        validator: (val){
          if(val==null || val.isEmpty){
            return "Plz enter the field";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(fontSize: 15,
              fontWeight: FontWeight.w500,
              color:Color(0xFF3D4D56)

          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,25,0),
            child: GestureDetector(
              onTap: callback,
              child: IsPasswordVisible?Icon(Icons.visibility_outlined,
              size: 20,
              ):Icon(Icons.visibility_off_outlined),
            ),
          ),
          fillColor: Color(0xFFF3F3F3),
          filled: true,
          suffixIconColor: Color(0xFF5C6A72),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,

          )
          ),

        ),
      
      );

  }


}
