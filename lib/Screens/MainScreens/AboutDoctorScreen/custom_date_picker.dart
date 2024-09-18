import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'AboutDoctorController.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ScrollController scrollController;

  CustomDatePicker({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.scrollController
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final Aboutdoctorcontroller doctorController = Get.find();
  DateTime _selectedDate = DateTime.now();
  List<DateTime> date = [];
  DateTime _currentMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    _updateHighlightedDates();
  }

  void _updateHighlightedDates() {
    List<Map<String, dynamic>> highlightedDates = doctorController.AvailableDatesOnly.value;
    List<DateTime> newDates = [];

    for (var dateData in highlightedDates) {
      DateTime? date = dateData['Date'];
      if (date != null) {
        newDates.add(DateTime(date.year, date.month, date.day));
      }
    }

    setState(() {
      date = newDates;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (doctorController.CalenderLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      return Material(
        child: Container(
          height: 400,
          child: Column(
            children: [
              TableCalendar(
                firstDay: widget.firstDate,
                lastDay: widget.lastDate,
                focusedDay: _currentMonth,
                selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                  });
                },
                onPageChanged: (focusedDay) async {
                  if (focusedDay.month != _currentMonth.month) {
                    setState(() {
                      _currentMonth = focusedDay;
                    });

                    DateTime startDate = DateTime(focusedDay.year, focusedDay.month, 1);
                    DateTime endDate = DateTime(focusedDay.year, focusedDay.month + 1, 0);
                    String startDateString = "${startDate.year}-${startDate.month}-${startDate.day}";
                    String endDateString = "${endDate.year}-${endDate.month}-${endDate.day}";

                    await doctorController.DoctorAvailableDates(
                      StartDate: startDateString,
                      EndDate: endDateString,
                    );
                  }
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    bool isHighlighted = date.any((d) =>
                    d.year == day.year &&
                        d.month == day.month &&
                        d.day == day.day);

                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isHighlighted ? Colors.transparent : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          color: isHighlighted ? Colors.black : Color(0xFFC1C1C1),
                          decoration: isHighlighted ? TextDecoration.none : TextDecoration.lineThrough,
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, _selectedDate);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    int index = doctorController.AvailableDatesOnly.indexWhere(
                            (element) => DateFormat('yyyy-MM-dd').format(element['Date']) == DateFormat('yyyy-MM-dd').format(_selectedDate));

                    print("Index in custom date is $index");
                    if (index != -1) {
                      print("Scroll controller is $widget.scrollController");
                      doctorController.DatesClickedIndex(index);
                      // Wait for the next frame to ensure the ScrollController is attached
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        widget.scrollController.animateTo(
                          index * 100.0,
                          duration: Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                        );
                      });
                    }
                  });
                },
                child: Text('Select'),
              )
            ],
          ),
        ),
      );
    });
  }
}


