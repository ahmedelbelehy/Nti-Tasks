class Movie {
  String title;
  String director;
  double rating;
  int releaseYear;

  Movie(this.title, this.director, this.rating, this.releaseYear);

  void show() {
    print(title);
    print(director);
    if (rating >= 8) {
      print('High rated movie');
    }
  }
}

void main() {
  var m = Movie('The Shawshank Redemption', 'Frank Darabont', 8.5, 2023);
  m.show();
}
