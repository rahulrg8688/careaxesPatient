import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscreen2 extends StatelessWidget {
  final PageController pageController2;
  Splashscreen2({super.key, required this.pageController2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Connect Anytime Anywhere",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFF000000),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              '''Expert care, whenever and wherever 
you need it.''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFFB5B5B5),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                pageController2.nextPage(duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: Color(0xFF5E55EA),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    Icon(Icons.arrow_forward_sharp,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
