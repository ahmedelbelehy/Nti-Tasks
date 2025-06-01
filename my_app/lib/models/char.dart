String getChar(int index) {
  List<String> chars = [];
  for (int i = 97; i <= 122; i++) {
    chars.add(String.fromCharCode(i));
  }
  for (int i = 48; i <= 53; i++) {
    chars.add(String.fromCharCode(i));
  }
  return chars[index];
}
