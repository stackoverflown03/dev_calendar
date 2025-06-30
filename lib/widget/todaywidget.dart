import 'package:dev_calendar/model/today_card_model.dart';
import 'package:flutter/material.dart';


class Todaywidget extends StatefulWidget {
  final todaycard widget;

  const Todaywidget({super.key, required this.widget});


  @override
  State<Todaywidget> createState() => _TodaywidgetState();
}


class _TodaywidgetState extends State<Todaywidget> {
  @override
  Widget build(BuildContext context) {
    final card=widget.widget;
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text("${card.mes}",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                        )),
                  ),
                  Spacer(),
                  Icon(Icons.account_circle_outlined,
                    size: 35,)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("${card.start} \n   Start",
                      style: TextStyle(
                          fontSize: 18
                      ),),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${card.dur} min",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black
                          )
                      ),
                    ),
                    Text("${card.end} \n      End",
                      style: TextStyle(
                          fontSize: 18
                      ),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

