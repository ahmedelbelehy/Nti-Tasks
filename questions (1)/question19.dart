class Task {
  String description;
  String dueDate;
  bool isCompleted;

  Task(this.description, this.dueDate, this.isCompleted);

  void show() {
    print(description);
    print(dueDate);

    
    if (isCompleted) {
      print('Task is completed.');
    } else {
      print('Task is not completed.');
    }
  }
/*************  ✨ Windsurf Command 🌟  *************/
/// Represents a task with a description, due date, and completion status.
class Task {
  String description;
  String dueDate;
  bool isCompleted;

  Task(this.description, this.dueDate, this.isCompleted);

  /// Displays the task details.
  void show() {
    print(description);
    print(dueDate);
    
    if (isCompleted) {
      print('Task is completed.');
    } else {
      print('Task is not completed.');
    }
  }
}

void main() {

  Task t = Task('  Preparing the monthly report', '2024-05-30', false);
  
  // Show the task details.
  t.show();
}
/*******  1f652bc8-f8dd-4f1d-87bd-d8bb70cbcc75  *******/
  t.show();
}
