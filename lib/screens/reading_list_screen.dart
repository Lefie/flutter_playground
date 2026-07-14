import 'package:flutter/material.dart';
import '../data_models/bookModel.dart';

class ReadingListScreen extends StatefulWidget {
  const ReadingListScreen({super.key});

  State<ReadingListScreen> createState() => ReadingListScreenState();
}

List<Book> bookList = [
  Book(bookTitle: "Project Hail Mary", bookAuthor: "Andy Weir", bookStatus: BookStatus.reading,bookRating: 5),
  Book(bookTitle: "Atomic Habits", bookAuthor: "James Clear", bookStatus: BookStatus.finished,bookRating: 5),
  Book(bookTitle: "Designing Data-Intensive Apps", bookAuthor: "Martin Kleppmann", bookStatus: BookStatus.toRead,bookRating: 5)
];

class ReadingListScreenState extends State<ReadingListScreen> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Reading List"),
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Container(child: Text("Search Bar"),),
           Container(
             color: Colors.blue,
             height: 800,
             child: BookListView(),
           )
         ],
       )
     )
   );
  }
}

class BookListView extends StatelessWidget {

  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: bookList.length,
      itemBuilder: (context,index) {
        return ListTile(
          leading: Icon(Icons.book),
          title: Text(bookList[index].bookTitle),
          subtitle: Text(bookList[index].bookAuthor),
          trailing: StatusLabel(status: bookList[index].bookStatus),
        );
      },
      separatorBuilder: (context,index){
        return Divider();
      }, );
  }
}

class StatusLabel extends StatelessWidget {
  StatusLabel({super.key, required this.status});

  BookStatus status;

  @override
  Widget build(BuildContext context) {
     return Container(

       child: switch(status){
          BookStatus.reading => Container(
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child:  Center(child: Text("Reading"),),
            ),
          BookStatus.toRead => Container(width: 80,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12),
            ), child: Center(child: Text("Finished"),),
          ),
          BookStatus.finished => Container(
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text("To Read"),),)
       }
     );
  }
}


