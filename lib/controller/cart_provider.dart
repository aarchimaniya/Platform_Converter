import 'package:flutter/material.dart';
import '../../../modal/character modal.dart';

class CartProvider with ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  void removeBook(Book book) {
    _books.remove(book);
    notifyListeners();
  }
}
