import '../../../modal/character modal.dart';

class CartModel {
  List<Book> _items = [];

  List<Book> get items => _items;

  void addBook(Book book) {
    _items.add(book);
  }

  void removeBook(Book book) {
    _items.remove(book);
  }
}
