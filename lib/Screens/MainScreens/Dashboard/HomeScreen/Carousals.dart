import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../ModelClass/GetDoctorBookings.dart';
import '../../../../Screens/MainScreens/Dashboard/HomeScreen/homeController.dart';

class Carousals {
  List<Widget> getCarousals() {
    return [
      GetAppointmentRecentDetails(),
      Image.asset('assets/Carousals/carousal2.png'),
      Image.asset('assets/Carousals/carousal3.png'),
    ];
  }
}

Widget GetAppointmentRecentDetails() {

  homeController controller = Get.find(); // Use Get.find() if controller is already initialized

  if (controller.DoctorBookings.isEmpty) {
    return Container(
      color: Colors.grey[200],
      child: Center(child: Text("No Appointments Available")),
    );
  }

  GetDoctorBookings doctorBooking = controller.DoctorBookings[0];


  return Container(
    padding: EdgeInsets.all(16),
    color: Color(0xFF5E55EA),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctorBooking.providerName ?? "Unknown Doctor",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          doctorBooking.specializationName ?? "Unknown Specialization",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                doctorBooking.appointmentDate ?? "Unknown Date",
                style: TextStyle(color: Color(0xFF5E55EA), fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 8),
            Text(
              doctorBooking.appointmentTime ?? "Unknown Time",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
