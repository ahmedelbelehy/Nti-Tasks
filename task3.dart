
void main() {
  List<String> names = [
    "Apple",
    "Banana",
    "Orange",
  ];

  print(names);

  names.add("strawberry");

  print(names);

  names.remove("Banana");

  print(names);

names[1] ="grapes";
print(names);


names.removeAt(1);
print(names);
}
