import '../data/daily_tasks_data.dart';
import '../model/daily_task_model.dart' show daily_task_model;

class selectedday_reloader{
  DateTime sday;
  selectedday_reloader({
    required this.sday,
});
  List<daily_task_model> getdata() {
    return daily_task_data.sampleTasks[sday] ?? [];
  }
}