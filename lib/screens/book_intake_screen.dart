import 'package:flutter/material.dart';
import '../data_models/bookModel.dart';
import '../components/book_form.dart';


class BookIntakeScreen extends StatefulWidget {
  const BookIntakeScreen({super.key});

  @override
  State<BookIntakeScreen> createState() => BookIntakeScreenState();

}

class BookIntakeScreenState extends State<BookIntakeScreen> {

  // field
  Book book = Book(bookTitle: "", bookAuthor: "", bookStatus: BookStatus.toRead, bookRating: 0);

  void updateBook(Book newBook) {
    setState(() {
      book = newBook; // getting data from child widget from form
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add A Book")),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Center(child: Text("What book are you currently reading?",
                    style:TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color:  Color(0xff083f68),
                    ))),
                SizedBox(height:30),
                BookForm(getBookInfo: updateBook),
                SizedBox(height:30),
              ],
            ),
          ),
        )
    );
  }
}