import 'package:dev_calendar/data/daily_tasks_data.dart';
import 'package:dev_calendar/model/daily_task_model.dart';

class add_task extends daily_task_model{
  add_task({
    required super.title,
    required super.description,
    required super.isCompleted
  });
  void new_task(){
    DateTime today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if(!daily_task_data.sampleTasks.containsKey(today)) {
      daily_task_data.sampleTasks[today] = [];
    }
      daily_task_data.sampleTasks[today]!
          .add(daily_task_model(
          title: title,
          description: description,
          isCompleted: isCompleted
      ));
  }
}