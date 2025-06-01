class Animal {
  String species;
  String name;
  int age;
  bool isWild;
  Animal(this.species,this.name, this.age, this.isWild);
}



void main(){
  Animal animal1 = Animal("lion", "Simba", 5, true);

  print("name of animal : ${animal1.name}");
  print("Kinds of animal : ${animal1.species}");
  if(animal1.isWild){
    print(" Be Careful");
  }
  else{
    print("Be Safe");
  }
}
