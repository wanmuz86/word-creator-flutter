import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'second.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    //final wordPair = "HelloWorld";
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(appBar: AppBar(title: Text("Welcome to my Flutter app"),),body: 
      Center(child: RandomWordState(),)
      )
    );
  }
}

class RandomWordState extends StatefulWidget {
  @override
  _RandomWordStateState createState() => _RandomWordStateState();
}

class _RandomWordStateState extends State<RandomWordState> {
final List<WordPair> _suggestions = <WordPair>[];
//final List<String> entries = <String>['A', 'B', 'C', 'D'];


//  final List<String> _sugeestions = ["Item1","Item2","Item3"];
  @override
  Widget build(BuildContext context) {
    // GIve me a random 10 words
    _suggestions.addAll(generateWordPairs().take(10));
   
    return ListView.builder(
      itemCount: _suggestions.length,
      itemBuilder: (BuildContext context, int index){
      return _buildRow(_suggestions[index]);
      }
    );
  }
  // How to create a function on Dart
  // Widget - the return type is of Type Widget
  // function name is _buildRow
  // It accept one argument/parameter, wordPair and of Type WordPair
  // In Javascript thtgk is is code function _buildRow(wordPair) { }
  Widget _buildRow(WordPair wordPair){
    final TextStyle _biggerFont = const TextStyle(fontSize:18);
    return 
    Card(child:
    ListTile(title: 
    Text(wordPair.asPascalCase, 
    style: _biggerFont
     ),
     onLongPress: (){
       _pushSaved(wordPair.asPascalCase);
     }, 
    )
    );

  }
  void _pushSaved(String word){
    // Basic code to open a new page
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
// WHat to show in the new page
return Second(selectedWord: word);
      })
    );
  }
}
// 1) How to create a List
// 2) Style a ListITem - Container showing row, ListTile
// 3) How to open a new page
// 4) How to pass data from page 1 to page 2