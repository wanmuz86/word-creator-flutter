import 'package:flutter/material.dart';
class Second extends StatelessWidget {
  // I will retrieve selectedWord from first page to second page
  final String selectedWord;
  Second({this.selectedWord});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Second Page"),
    ),
    body:Center(child: Text(selectedWord),)
    );
  }
}