class Student {
  String name;
  int age;
  double grade;

  
  Student(this.name, this.age, this.grade);
}

void main() {
  
  Student student = Student('Ali', 16, 95);

  
  print('Student Name: ${student.name}');
  print('Age: ${student.age}');

  
  if (student.grade >= 90) {
    print('Excellent');
  }
}
