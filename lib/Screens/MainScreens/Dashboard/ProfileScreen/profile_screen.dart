import 'package:careaxes_patient/Screens/MainScreens/Dashboard/HomeScreen/homeScreen.dart';
import 'package:careaxes_patient/Screens/MainScreens/Dashboard/HomeScreen/home_screen.dart';
import 'package:careaxes_patient/Screens/MainScreens/Dashboard/ProfileScreen/profile_controller.dart';
import 'package:careaxes_patient/Screens/MainScreens/dashboard_screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'MyInvoices/my_invoice_screen.dart';
import 'MyRecords/MyRecordsWidget.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController controller=Get.put(ProfileController());

  void handleInvoiceTap(int index){
    controller.MyInvoiceListSetIndex(index);
  }

  void handleRecordsTap(int index){
    controller.MyRecordsListSetIndex(index);
  }

  void handleGeneralTap(int index){
    controller.MyGeneralListSetIndex(index);
  }

  void handleAccountTap(int index){
    controller.MyAccountListSetIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;
    return GetBuilder<ProfileController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Center(child: Text("My Account",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily:'Poppins',
                ),

              ),


              ),
              leading: IconButton(
                icon: Icon(Icons.home), onPressed: () {
                  Get.offAll(()=>Dashboard());
              },
              ),
            ),
            body: SingleChildScrollView(

              child: Container(
                color:Color(0xffD9D9D9),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        MainText("My Records"),
                        //320
                        //height*0.376
                        BuildRecordInvoices(increaseHeight?height*0.500:height*0.376,controller.MyRecordsList, handleRecordsTap),
                        MainText("My Invoices"),
                        //211
                        BuildRecordInvoices(height*0.244,controller.MyInvoiceList,handleInvoiceTap),
                        MainText("General"),
                        //440
                        BuildRecordInvoices(height*0.508,controller.GeneralList,handleGeneralTap),
                        MainText("Account"),
                        //155
                        BuildRecordInvoices(height*0.178, controller.AccountList,handleAccountTap ),
                      ]
                  ),

                ),
              ),
            ),
          );
        }
    );

  }

  Widget ReturningListView(IconData icons,String text){
    return ListTile(
      leading:Icon(icons),
      title: Text(text),


    );
  }

  Widget MainText(String text){
    return Text(text,
        style:TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff9CA4AB)
        ));
  }
bool increaseHeight=false;
  Widget BuildRecordInvoices(double height,List recordList,void Function(int) onItemTap){
    return  Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Colors.white,
      ),
      width:double.infinity,

      child:Container(
        margin: EdgeInsets.all(20),
        // height:256,
        decoration: BoxDecoration(
            border: Border.all(
                color:Color(0xffD9D9D9)
            ),
            borderRadius: BorderRadius.all(Radius.circular(13))
        ),

        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: recordList.length,
          itemBuilder: (context,index){
            if (recordList[index]['Text'].data == 'Labs') {
              return

                ExpansionTile(
                onExpansionChanged: (bool expanded){
                  if(expanded){
                    print("true");
                    increaseHeight=true;
                    setState(() {

                    });
                  }
                  else{
                    print("false");
                    increaseHeight=false;
                    setState(() {

                    });
                  }

                },

                leading: recordList[index]['IconData'],
                title: Text('Labs'),
                children: <Widget>[
                  ListTile(
                    title: Text('Lab Reports'),
                    onTap: () {
                      Get.to(() => Myrecordswidget(InitialIndex: 2));
                    },
                  ),
                  ListTile(
                    title: Text('Lab Invoice'),
                    onTap: () {
                      Get.to(() => MyInvoiceScreen(InitialIndex: 1));
                    },
                  ),
                ],
              );
            }
            else if( recordList[index]['Text'].data=="My Appointments"){
             return Container(
               decoration: BoxDecoration(
                 border: Border(
                   bottom: BorderSide(color: Color(0xffD9D9D9)),
                 ),
               ),
               child: ExpansionTile(
                  onExpansionChanged: (bool expanded){
                    if(expanded){
                      print("true");
                      increaseHeight=true;
                      setState(() {

                      });
                    }
                    else{
                      print("false");
                      increaseHeight=false;
                      setState(() {

                      });
                    }

                  },

                  leading: recordList[index]['IconData'],
                  title: Text('Appointments'),
                  children: <Widget>[
                    ListTile(
                      title: Text('My Appointments'),
                      onTap: () {
                        Get.toNamed('/MyAppointments');
                        // Get.to(() => Myrecordswidget(InitialIndex: 2));
                      },
                    ),
                    ListTile(
                      title: Text('My Prescriptions'),
                      onTap: () {
                        Get.to(() => Myrecordswidget(InitialIndex: 0,));
                      },
                    ),
                  ],
                ),
             );
            }
            else {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xffD9D9D9)),
                  ),
                ),
                child: ListTile(
                  title: recordList[index]['Text'],
                  leading: recordList[index]['IconData'],
                  onTap: () {
                    print("Index of pressed is : ${index}");
                    onItemTap(index);
                  },
                ),
              );
            }
          },
        ),




      ),

    );
  }
}
