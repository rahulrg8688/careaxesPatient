import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'VerifyOtpController.dart';

class Verifyotpscreen extends StatefulWidget {
  const Verifyotpscreen({super.key});

  @override
  State<Verifyotpscreen> createState() => _VerifyotpscreenState();
}

class _VerifyotpscreenState extends State<Verifyotpscreen> {
  bool Move1Next = false;
  bool IsTapped = false;

  Verifyotpcontroller Otpcontroller = Get.put(Verifyotpcontroller());

  @override
  void initState() {
    Move1Next = false;
    IsTapped = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<Verifyotpcontroller>(builder: (Otpcontroller) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: isKeyboardVisible ? 20 : 345),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 13.5, 34),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
                                  child: Text(
                                    'Verification',
                                    style: TextStyle(
                                      fontFamily: 'Playfair Display',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  child: Center(
                                    child: Text(
                                      'Enter the code we just sent to your registered mobile number',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFFB5B5B5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        otpTextField(Otpcontroller.Otp1, true),
                                        otpTextField(Otpcontroller.Otp2),
                                        otpTextField(Otpcontroller.Otp3),
                                        otpTextField(Otpcontroller.Otp4, false, true),
                                      ],
                                    ),
                                  ),
                                ),

                                     Text(
                                  "${Otpcontroller.OtpErr.value}",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                                    ,
                                Container(
                                  margin: EdgeInsets.fromLTRB(0.7, 0, 0.7, 0),
                                  child: TextButton(
                                    onPressed: () {
                                      Otpcontroller?.SendOtp();
                                    },
                                    child: Text(
                                      'Resend Code',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFF1B4DFF),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(Otpcontroller.timerText),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFC1C1C1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Otpcontroller?.CompareOtp(context);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Otpcontroller.otp.toString().length>0&&Otpcontroller.otp.toString().isNum
                                  ? Color(0xFF5E55EA)
                                  : Color(0xFFC1C1C1)),
                          child: Otpcontroller.isLoading.value
                              ? CircularProgressIndicator()
                              : Text(
                            'Verify',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: IsTapped
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // Custom OTP text field widget to reuse the code
  Widget otpTextField(TextEditingController controller,
      [bool autoFocus = false, bool last = false]) {
    return Container(
      width: 53,
      height: 53,
      margin: EdgeInsets.fromLTRB(0, 0, 22, 0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        onChanged: (val) {
          if (val.length == 1 && !last) {
            FocusScope.of(context).nextFocus();

            // Move to next field
          } else if (val.isEmpty) {
            Verifyotpcontroller().OtpErr.value='';
            FocusScope.of(context).previousFocus(); // Move to previous field if empty
          }
        },
        onFieldSubmitted: (_) {
          if (last) {
            FocusScope.of(context).unfocus(); // Close the keyboard on the last field
          }
        },

        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
