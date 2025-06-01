class Song {
  String title;
  String artist;
  int durationSeconds;
  String genre;

  Song(this.title, this.artist, this.durationSeconds, this.genre);

  void show() {
    print(title);
    print(artist);
    if (genre == 'Rock') {
      print('Awesome Rock Music!');
    }
  }
}

void main() {
  var s = Song('nakhaby ley', 'wa2l ', 240, 'Pop');
  s.show();
}
