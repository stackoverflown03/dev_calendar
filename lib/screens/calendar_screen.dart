import 'package:dev_calendar/data/daily_tasks_data.dart';
import 'package:dev_calendar/functions/add_task.dart';
import 'package:dev_calendar/model/daily_task_model.dart';
import 'package:dev_calendar/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../functions/selectedday_refresh.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}
String selectedTab = "today";
DateTime now = DateTime.now();
DateTime _focusedday = DateTime(now.year, now.month, now.day);
DateTime _selectedday = DateTime(_focusedday.year, _focusedday.month,_focusedday.day);
TextEditingController _titleController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();

class _CalendarScreenState extends State<CalendarScreen> {
  List<daily_task_model> data = daily_task_data.sampleTasks[_selectedday] ?? [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedTab = 'today';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => homescreen()),
                      );
                    },
                    child: Text("Today"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          selectedTab == 'today' ? Colors.black : Colors.white,
                      backgroundColor:
                          selectedTab == 'today'
                              ? Colors.grey[300]
                              : Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedTab = 'calendar';
                      });
                      ;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarScreen(),
                        ),
                      );
                    },
                    child: Text("Calendar"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          selectedTab == 'calendar'
                              ? Colors.black
                              : Colors.white,
                      backgroundColor:
                          selectedTab == 'calendar'
                              ? Colors.grey[300]
                              : Colors.black,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Add a new Task"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: "Title",
                                    ),
                                    controller: _titleController,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                        labelText: "Description"
                                    ),
                                    controller: _descriptionController,
                                  ),
                                  ElevatedButton(onPressed: () {
                                    setState(() {
                                      add_task(
                                          title: _titleController.text,
                                          description: _descriptionController.text,
                                          isCompleted: false
                                      ).new_task();
                                    });
                                    Navigator.pop(context);
                                  }, child: Text("Add"))
                                ],
                              ),
                            );
                          }
                      );
                    },
                    icon: Icon(Icons.add_circle,
                      size: 35,)
                )
              ],
            ),
            TableCalendar(
              focusedDay: _focusedday,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day)=>isSameDay(_selectedday, day),
              availableCalendarFormats: const{
                CalendarFormat.month: "Month"
              },
              headerVisible: true,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedday = DateTime(selectedDay.year,selectedDay.month,selectedDay.day);
                  print(_selectedday);
                  _focusedday = DateTime(selectedDay.year,selectedDay.month,focusedDay.day);
                  print(_focusedday);
                  if(_selectedday!=DateTime.now())
                    {
                      data=selectedday_reloader(sday: _selectedday).getdata();
                    }
                });
              },
            ),
            Flexible(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].title),
                    subtitle: Text(data[index].description),
                    trailing: Checkbox(
                      value: data[index].isCompleted,
                      onChanged: (value) {
                        setState(() {
                          data[index].isCompleted = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
