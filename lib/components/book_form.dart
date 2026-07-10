import 'package:flutter/material.dart';
import '../data_models/bookModel.dart';

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
  String _selectedBookReadingStatus = "";
  String _selectedRating = "";


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
                        labelStyle: TextStyle(color: Color(0xff0c3855), fontWeight: FontWeight.w500),
                        hintText: "Enter the book title",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color(0xff155b8c)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color(0xff0c3855), width: 2),
                        )
                    ),
                    onSaved: (value){
                      setState(() {
                        title = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "title is required";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Author",
                        labelStyle: TextStyle(color: Color(0xff0c3855), fontWeight: FontWeight.w500),
                        hintText: "Author Name",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color(0xff155b8c)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color(0xff0c3855), width: 2),
                        )
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
                        value:"",
                        child: Text("Status"),
                      ),
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
                        value:"",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TextButton(
                    onPressed: (){
                      print("Cancel");
                    },
                    child: Text("Cancel"),),
                  SizedBox(width: 10,),
                  TextButton(
                      onPressed: (){
                        _bookFormKey.currentState!.save();
                        print("${author}, ${title}, ${status}, ${rating}");
                        Book b = Book(bookAuthor: author, bookTitle: title, bookStatus: status, bookRating: rating);
                        widget.getBookInfo(b);
                      },
                      child: Text("Add"))
                ],),
              ],
            ),
          ),
        ),
      );
  }
}