import 'package:flutter/material.dart';

class TextExampleWidget extends StatelessWidget {

  const TextExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
          textAlign: TextAlign.center,
          "I am text living inside a text widget",
          style: TextStyle(
            fontSize: 24,
            color:Colors.blue,
          )
      ),
    );
  }
}