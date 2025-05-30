void main() {
  var name = "Elbelehy";
  print("My name is $name ");


  dynamic age = 20;
  print(" my age is $age years old");

  // name = 21;

  age = "Twenty ";

  print(
      "the var cannot change the value in different types but the dynamic can change the value in different types.\n");


  // final and const
  final name1 = "Elbelehy";
  print("My name is $name1 ");
  
  const age1 = 20;
  print(" my age is $age1 years old");  
  

  // name1 = "elbelehy";

  // age1 = 20;

  print("final Value is assigned once; can be determined at runtime.\nconst Value is a compile-time component (assigned once) and ensures deep immutability for objects/collections.");
}
