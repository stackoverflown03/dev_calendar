import 'package:dev_calendar/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}
String selectedTab="today";

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              children: [
          Row(
          children: [
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: (){
                setState(() {
                  selectedTab='today';
                });
                Navigator.push(context, MaterialPageRoute(builder:(context)=> homescreen()));
              },
              child:Text("Today"),
              style:ElevatedButton.styleFrom(
                foregroundColor: selectedTab=='today' ? Colors.black : Colors.white,
                backgroundColor: selectedTab=='today' ? Colors.grey[300] : Colors.black,
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                selectedTab='calendar';
              });;
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CalendarScreen()));
            },
            child: Text("Calendar"),
            style: ElevatedButton.styleFrom(
              foregroundColor: selectedTab=='calendar' ? Colors.black : Colors.white,
              backgroundColor: selectedTab=='calendar' ? Colors.grey[300] : Colors.black,
            ),
          ),
        ),
        ]
    ),
    ]
    )
    )
    );
  }
}
