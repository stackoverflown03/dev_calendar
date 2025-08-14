import '../model/daily_task_model.dart';

class daily_task_data{
  static Map<DateTime, List<daily_task_model>> sampleTasks = {
    DateTime(2025, 6, 30): [
      daily_task_model(
        title: 'Morning Meeting',
        description: 'Team sync at 9:30 AM via Google Meet',
        isCompleted: true,
      ),
      daily_task_model(
        title: 'Code Review',
        description: 'Review PRs on GitHub',
        isCompleted: false,
      ),
    ],
    DateTime(2025, 7, 1): [
      daily_task_model(
        title: 'Write README',
        description: 'Add usage instructions and screenshots',
        isCompleted: false,
      ),
      daily_task_model(
        title: 'Test Android Build',
        description: 'Run app on emulator and fix issues',
        isCompleted: true,
      ),
    ],
    DateTime(2025, 7, 2): [
      daily_task_model(
        title: 'Prepare Presentation',
        description: 'Finalize slides for the demo',
        isCompleted: true,
      ),
    ],
    DateTime(2025, 7, 3): [
      daily_task_model(
        title: "Design Task Card UI",
        description: "Improve spacing, add icons and animations.",
        isCompleted: false,
      ),
    ],
    DateTime(2025, 7, 4): [
      daily_task_model(
        title: "Integrate Firebase",
        description: "Add Firestore for storing tasks online.",
        isCompleted: false,
      ),
      daily_task_model(
        title: "Test notifications",
        description: "Check local and scheduled notifications.",
        isCompleted: true,
      ),
    ],
    DateTime(2025, 7, 5): [
      daily_task_model(
        title: "Write README",
        description: "Add setup steps and screenshots.",
        isCompleted: false,
      ),
    ],
  };

}