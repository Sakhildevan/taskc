import 'package:taskc/page/home_page.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:table_calendar/table_calendar.dart';

import 'page/add_event.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: content()),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventEditingPage()));
          },
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Align(
            alignment: AlignmentDirectional(-0.75, -0.9),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Text(
                'taask',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFFEB5757),
                  fontSize: 35,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: TableCalendar(
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              weekendStyle:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            calendarStyle: CalendarStyle(
              weekendTextStyle: TextStyle(fontWeight: FontWeight.bold),
              defaultTextStyle: TextStyle(fontWeight: FontWeight.bold),
              outsideTextStyle:
                  TextStyle(color: Color.fromARGB(255, 51, 170, 40)),
              todayDecoration: BoxDecoration(
                color: Color.fromARGB(255, 177, 84, 84),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Color(0xFFEB5757),
                shape: BoxShape.circle,
              ),
            ),
            locale: "en_US",
            rowHeight: 40,
            headerStyle: const HeaderStyle(
                titleTextStyle:
                    TextStyle(fontSize: 30, color: Color(0xFFEB5757)),
                formatButtonVisible: false,
                titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: ((day) => isSameDay(day, today)),
            onDaySelected: _onDaySelected,
            firstDay: DateTime.utc(2020, 10, 10),
            lastDay: DateTime.utc(2040, 10, 10),
            focusedDay: today,
          ),
        ),
        Text(
          today.toString().split(" ")[0],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFFEB5757)),
        ),
      ],
    );
  }
}
