class Recipe {
  String name;
  String ingredients;
  int time;

  Recipe(this.name, this.ingredients, this.time);

  void show() {
    print(name);
    print('$time minutes');
    if (time > 60) {
      print('Long recipe');
    }
  }
}

void main() {
  var r = Recipe('Chocolate Cake', 'Flour, sugar, eggs, cocoa', 45);
  r.show();
}
