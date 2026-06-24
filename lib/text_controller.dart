import 'package:flutter/material.dart';

class TextControllerExample extends StatefulWidget {
  const TextControllerExample({super.key});

  @override
  _TextControllerExampleState createState() => _TextControllerExampleState();

}

class _TextControllerExampleState extends State<TextControllerExample> {
  final TextEditingController _bookTitleController = TextEditingController();
  final TextEditingController _bookAuthorController = TextEditingController();

  final List<String> bookTitleList = ["Narnia", "The Story of a Soul", "The Lord of the Rings"];
  final List<String> bookAuthorList = ["C.S Lewis", "Thérèse of Lisieux","J.R.R. Tolkien" ];

  @override
  void dispose() {
    _bookTitleController.dispose();
    _bookAuthorController.dispose();
    super.dispose();
  }

  void addBook(){
    setState(() {
      bookTitleList.add(_bookTitleController.text);
      bookAuthorList.add(_bookAuthorController.text);
    });
    print("new book added");
    _bookTitleController.clear();
    _bookAuthorController.clear();

  }

  void deleteBook() {
    setState(() {
      if (bookTitleList.length > 0){
        bookTitleList.removeLast();
        bookAuthorList.removeLast();
      }
    });
    print("deleted!");
  }



  @override
  Widget build(BuildContext context) {
    return Center(child:
        Container(width: 550,
        color: Colors.grey[100],
        child:  Column(
         children: [
           SizedBox(width: 250,
           child:
            TextField(
          controller: _bookTitleController,
          decoration: InputDecoration(
            labelText: "Enter a book you like",
            border: UnderlineInputBorder(),
          ),
        ),),
           SizedBox(height:20),
           SizedBox(width: 250,
             child:
             TextField(
               controller: _bookAuthorController,
               decoration: InputDecoration(
                 labelText: "Enter the author of this book",
                 border: UnderlineInputBorder(),
               ),
             ),),
           SizedBox(height:20),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
             ElevatedButton(onPressed: addBook, child: Text("Add Books")),
             SizedBox(width:30),
             ElevatedButton(onPressed: deleteBook, child: Text("Delete Book")),
           ],),
           SizedBox(height:20),
           Expanded(
             child:
                 Container(
                 width:300,
                 child: ListView.builder(
                   itemCount: bookTitleList.length,
                   itemBuilder: (context, index) {
                     return GestureDetector(
                       onTap: () {
                         print("Card Tapped!");
                       },
                       child: SizedBox(
                         height: 110,
                         child: Card(
                           color: Colors.yellow[100],
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(
                                 16.0), // Change this number to adjust roundness
                           ),
                           child: Column(
                             children: [
                               SizedBox(height: 15,),
                               Text("${bookTitleList[index]}",
                                   style: TextStyle(fontWeight: FontWeight.bold)),
                               SizedBox(height: 15,),
                               Text("${bookAuthorList[index]}"),
                             ],
                           ),
                         ),
                       ),
                     );
                   },
                 ), )
             ),
        ],
        ),
        ),
        );
  }
}