import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../../../controller/json_controller.dart';
import '../../../modal/character modal.dart';
import '../detail_page/detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harry Potter Characters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CharacterListScreen(),
    );
  }
}

class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  late List<Book> _futureCharacters;

  @override
  void initState() {
    super.initState();
    _futureCharacters =
        CharacterHelper.characterHelper.parseCharacters("lib/assets/data.json");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter Characters'),
      ),
      body: ListView.builder(
        itemCount: _futureCharacters.length,
        itemBuilder: (context, index) {
          final book = _futureCharacters[index];
          return ListTile(
            title: Text(book.name),
            subtitle: Text(
                'House: ${book.house}\nPatronus: ${book.patronus}\nActor: ${book.actor}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(book: book),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
