void main() {
  Map employees = {'Ali': 3000, 'Sara': 4000, 'Ahmed': 3500, 'Laila': 4500};

  employees['Khaled'] = 5000;

  if (employees.containsKey('Ali')) {
    print('Ali is in the map.');
  }
  employees.remove('Ahmed');

  print('name of employees : ${employees.keys}');

  print('salary of employees : ${employees.values}');


   Map newEmployees = {"Ali": 3000, "Sara": 4000, "Ahmed": 3500, "Laila": 4500};
  newEmployees.forEach((key, value) {
    print("the salary of $key is ${value + (value * 10 / 100)}.");
  });
}
