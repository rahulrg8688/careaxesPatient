import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_profile_controller.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});

  // Initialize the controller
  final MyProfileController myProfileController = Get.put(MyProfileController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileController>(
      builder: (controller) {
        final size = MediaQuery.of(context).size;
        final height = size.height;
        final width = size.width;

        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  color: Colors.blueAccent.shade100,
                ),
                Positioned(
                  top: height * 0.05,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "My Profile",
                          style: TextStyle(
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 24), // To balance the Row
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.28,
                  left: 0,
                  right: 0,
                  bottom: 0.01,
                  child: SingleChildScrollView(
                    child: Container(
                      height: height, // Adjusted height for better layout
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(33)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(child: _buildForm(context,controller)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.17,
                  left: width * 0.33,
                  child: Container(
                    height: height * 0.16,
                    width: width * 0.33,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/DoctorImages/ProfileImage.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Form widget containing fields
  Widget _buildForm(context,MyProfileController controller) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("First name"),
          SizedBox(height: 8),
          myForm(context,controller.Firstname, "First name", ""),
          SizedBox(height: 16),
          Text("Last name"),
          SizedBox(height: 8),
          myForm(context,controller.Lastname, "Last name", ""),
          SizedBox(height: 16),
          Text("Gender"),
          _buildGenderRadioButtons(controller),
          SizedBox(height: 20),
          Text("Mobile Number"),
          SizedBox(height: 8),
          myForm(context,controller.MobileNumber, "Mobile number",""),
          SizedBox(height: 16),
           Text("Email Id"),
           SizedBox(height: 8,),
           myForm(context,controller.EmailId, "Email Id", " "),
          SizedBox(height: 16),
          Text("Dob"),
          myForm(context,controller.Dob, "Dob","",Icons: Icons.calendar_month),
          SizedBox(height: 16,),
          Text("Age"),
          myForm(context,controller.Age, "Age", ""),
      
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.ButtonClick(); // Call your controller action
              }
            },
            child: Text(
              "Update",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontSize: 16,
              ),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(Get.width, 56), // Adjusted height for better layout
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Color(0xFF2F80ED),
            ),
          ),
        ],
      ),
    );
  }

  // Form input field
  Widget myForm(BuildContext context,TextEditingController controller, String hintText, String labelText,{IconData? Icons}) {
    return TextFormField(
      validator: (val){
        if(val==null|| val.isEmpty){
          return "Field cannot be empty";

        }
        else if(hintText=="Email Id"){
          if(!val.isEmail){
            return "Enter valid Email";
          }
        }
        else if(hintText=="Mobile number"){
          if(!val.isNum){
            return "Plz enter only Numbers";
          }
        }
        else if(hintText=="Gender"){
          if(val.isEmpty){
            return "Plz select";
          }
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: (){
              print("calender");
              myProfileController.showCalendar(context);
            },
            child: Icon(Icons)),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }

  // Gender Radio Buttons
  Widget _buildGenderRadioButtons(MyProfileController controller) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RadioListTile<int>(
            title: const Text('Male'),
            value: 1,
            groupValue: controller.selectedOption,
            onChanged: (value) => controller.updateGender(value!),
          ),
        ),
        Expanded(
          child: RadioListTile<int>(
            title: const Text('Female'),
            value: 2,
            groupValue: controller.selectedOption,
            onChanged: (value) => controller.updateGender(value!),
          ),
        ),
      ],
    );
  }
}
