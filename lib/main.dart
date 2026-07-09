import 'package:flutter/material.dart';
import '../data_models/bookModel.dart';



void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff083f68)),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff083f68),
          foregroundColor: Color(0xff84d0ff)
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xff083f68),
              foregroundColor: Color(0xff84d0ff)
            ),
        ),
        useMaterial3: true,
      ),
      home: BookIntakeScreen(),
    );
  }
}



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
      backgroundColor: Color(0xff84d0ff),
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
            SizedBox(height:10),
            BookForm(getBookInfo: updateBook),
          ],
        ),
        ),
      )
    );
  }
}

class BookForm extends StatefulWidget {
  const BookForm({super.key, required this.getBookInfo});

  final void Function(Book) getBookInfo;



  @override
  State<BookForm> createState() => BookFormState();
}

class BookFormState extends State<BookForm> {

  final _bookFormKey = GlobalKey<FormState>();

  String title = "";
  String author = "";
  BookStatus status = BookStatus.toRead;
  int rating = 0;
  String _selectedBookReadingStatus = "to read";
  String _selectedRating = "0";


  @override
  Widget build(BuildContext context) {
    return
    Card(
      color: Color(0xff4db9ff) ,
      child:
      Form(
      key: _bookFormKey,
      child: Padding(padding: EdgeInsets.all(12),
        child: Column(
        children: [
          SizedBox(
            width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "The Little Prince"
                ),
                onSaved: (value){
                  setState(() {
                      title = value!;
                  });
                },
              ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Author",
                  hintText: "Author Name"
              ),
              onSaved: (value){
                setState(() {
                  author = value!;
                });
              },
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: 300,
            child: Align(child:  DropdownButton<String>(
              isExpanded: true,
               value: _selectedBookReadingStatus,
                items: [
                  DropdownMenuItem(
                      value:"to read",
                      child: Text("To Read"),
                  ),
                  DropdownMenuItem(
                    value:"reading",
                    child: Text("Reading"),
                  ),
                  DropdownMenuItem(
                    value:"finished",
                    child: Text("Finished"),
                  ),
                ],
                onChanged: (value){
                    print("something $value");
                    setState(() {
                      _selectedBookReadingStatus = value!;
                      if (value == "to read") {
                        status = BookStatus.toRead;
                      }
                      if (value == "reading") {
                        status = BookStatus.reading;
                      }
                      if (value == "finished") {
                        status = BookStatus.finished;
                      }
                    });
                },
               ), ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: 300,
            child: Align(child:  DropdownButton<String>(
              isExpanded: true,
              value: _selectedRating,
              items: [
                DropdownMenuItem(
                  value:"0",
                  child: Text("Rating"),
                ),
                DropdownMenuItem(
                  value:"1",
                  child: Text("1"),
                ),
                DropdownMenuItem(
                  value:"2",
                  child: Text("2"),
                ),
                DropdownMenuItem(
                  value:"3",
                  child: Text("3"),
                ),
                DropdownMenuItem(
                  value:"4",
                  child: Text("4"),
                ),
                DropdownMenuItem(
                  value:"5",
                  child: Text("5"),
                ),
              ],
              onChanged: (value){
                print("something $value");
                setState(() {
                  _selectedRating = value!;
                  rating = int.parse(value);
                });
              },
            ), ),
          ),
          SizedBox(height: 20,),
          TextButton(
              onPressed: (){
                _bookFormKey.currentState!.save();
                print("${author}, ${title}, ${status}, ${rating}");
                Book b = Book(bookAuthor: author, bookTitle: title, bookStatus: status, bookRating: rating);
                widget.getBookInfo(b);
              },
              child: Text("Add"))
        ],
      ),
      ),
    ),
    );
  }
}












