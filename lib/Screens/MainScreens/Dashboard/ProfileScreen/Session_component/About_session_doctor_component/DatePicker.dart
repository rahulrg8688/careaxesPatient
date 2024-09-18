import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import 'About_session_controller.dart';



class DatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  DatePicker({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<DatePicker> {
  final AboutSessionController _aboutSessionController = Get.find();
  DateTime _selectedDate = DateTime.now();
  List<DateTime> date = [];
  DateTime _currentMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    _updateHighlightedDates();
  }

  void _updateHighlightedDates() {
    List<String> highlightedDates = _aboutSessionController.sessionDates;
    List<DateTime> newDates = [];

    for (var dateData in highlightedDates) {
      DateTime? date = DateTime.parse(dateData);
      if (date!=null) {
        newDates.add(DateTime(date.year, date.month, date.day));
      }
    }

    setState(() {
      date = newDates;
    });
  }



  @override
  Widget build(BuildContext context) {
print("Dates are :: ${date}");


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
                },
                child: Text('Select'),
              ),
            ],
          ),
        ),
      );

  }
}


