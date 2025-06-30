import 'package:dev_calendar/data/today_data.dart';
import 'package:dev_calendar/widget/todaywidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'calendar_screen.dart';


class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}
final wid=TodayData.todayTasks;
DateTime date = DateTime.now();
String day = DateFormat('EEEE').format(date);
String time=DateFormat('HH.MM').format(date);
String mon=DateFormat('MMM').format(date);
int no=wid.length;
String selectedTab="today";

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
                      },
                      child:Text("Today"),
                        style:ElevatedButton.styleFrom(
                          foregroundColor: selectedTab!='today' ? Colors.black : Colors.white,
                          backgroundColor: selectedTab!='today' ? Colors.grey[300] : Colors.black,
                        )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CalendarScreen()));
                      },
                      child: Text("Calendar"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedTab=='today' ? Colors.black : Colors.white,
                      backgroundColor: selectedTab=='today' ? Colors.grey[300] : Colors.black,
                    ),
                    ),
                ),
              ]
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$day",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.left),
            ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("$time",
                          style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              height: 0.9
                            )
                          ),
                          Text("$mon",
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            height: 1.0,
                            )
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 110,
                            width: 4,
                            color: Colors.black,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("$no",
                            style: TextStyle(
                                fontSize: 80,
                              fontWeight: FontWeight.w600,
                            ),),
                          Text("tasks left today",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),)
                        ],
                      )
                    ],
                  ),
           Expanded(
             child: DraggableScrollableSheet(
             initialChildSize:1,
             minChildSize: 1,
             maxChildSize: 1,
             builder: (BuildContext context,ScrollController scrollcontroller){
               return ListView.builder(
                 controller: scrollcontroller,
                 itemCount: wid.length,
                 itemBuilder: (context,index){
                   return Todaywidget(widget: wid[index]);
                 },
               );
             }),
           )
              ],
            )
      ),
    );
  }
}
