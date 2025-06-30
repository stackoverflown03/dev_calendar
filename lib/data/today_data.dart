import '../model/today_card_model.dart';
class TodayData {
  static List<todaycard> todayTasks = [
    todaycard(
      mes: "Meeting with client",
      start: "10:00 AM",
      end: "10:30 AM",
      dur: 30,
    ),
    todaycard(
      mes: "Code review session",
      start: "11:00 AM",
      end: "12:00 PM",
      dur: 60,
    ),
    todaycard(
      mes: "Team stand-up",
      start: "01:00 PM",
      end: "01:30 PM",
      dur: 30,
    ),
    todaycard(
      mes: "Design discussion",
      start: "03:00 PM",
      end: "04:00 PM",
      dur: 60,
    ),
    todaycard(
      mes: "Write documentation",
      start: "04:30 PM",
      end: "05:30 PM",
      dur: 60,
    ),
  ];
}