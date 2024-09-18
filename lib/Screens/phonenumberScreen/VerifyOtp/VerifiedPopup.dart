import 'package:flutter/material.dart';

class Verifiedpopup extends StatelessWidget {
  Verifiedpopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Color(0x0F121212),
              offset: Offset(0, 4),
              blurRadius: 13,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 132, 0, 133),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(1, 0, 0, 18),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'assets/images/httpslottiefiles_comanimationsverified_oearu_zpcqq_1.gif',
                      ),
                    ),
                  ),
                  child: Container(
                    width: 110,
                    height: 110,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
                    child: Text(
                      'Verfied!!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Text(
                    'Hurry! You have successfully verfied your mobile number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFFB5B5B5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
