
enum BookStatus {
  toRead,
  reading,
  finished
}

class Book {
  String bookTitle;
  final String bookAuthor;
  final BookStatus bookStatus;
  final int bookRating;

  Book({required this.bookTitle, required this.bookAuthor, required this.bookStatus, required this.bookRating});

}