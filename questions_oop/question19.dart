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
}

void main() {
  Task t = Task('  Preparing the monthly report', '2024-05-30', false);
  t.show();
}
