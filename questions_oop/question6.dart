
class Color{
  late int R;
  late int G;
  late int B;
  Color({required this.R, required this.G, required this.B});
}

void main(){
  Color color1 = Color(R: 200, G: 50, B: 50);

 print(color1.R);
 print(color1.G);
 print(color1.B);

  if(color1.R > color1.G && color1.R > color1.B){
    print("THE COLOR IS RED");
  }
  else if(color1.G > color1.R && color1.G > color1.B){
    print("THE COLOR IS GREEN");
  }
  else{
  print("THE COLOR IS BLUE");
  }
}
