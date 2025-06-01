class Book {
  String title;
  String author;
  int pages;
  bool isRead;

  
  Book(this.title, this.author, this.pages, this.isRead);
}

void main() {
  
  Book book = Book('The Great Gatsby', 'F. Scott Fitzgerald', 180, true);

  
  print('Title: ${book.title}');
  print('Author: ${book.author}');

 
  if (book.isRead) {
    print('This book has been read.');
  }
}
