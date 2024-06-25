import 'dart:convert';

import '../modal/character modal.dart';

class CharacterHelper {
  CharacterHelper._();
  static CharacterHelper characterHelper = CharacterHelper._();

  List<Book> parseCharacters(String jsonString) {
    final parsed = json.decode(jsonString);
    return parsed.map<Book>((json) => Book.fromJson(json)).toList();
  }
}
