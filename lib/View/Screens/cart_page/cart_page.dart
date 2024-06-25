import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/cart_provider.dart';
import '../../../modal/character modal.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.books.length,
        itemBuilder: (context, index) {
          final book = cart.books[index];
          return ListTile(
            leading: Image.asset(book.imagePath, width: 50, height: 50),
            title: Text(book.name),
            subtitle: Text(book.actor),
            trailing: IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Colors.black,
              ),
              onPressed: () {
                _showCupertinoDialog(context, book);
              },
            ),
          );
        },
      ),
    );
  }

  void _showCupertinoDialog(BuildContext context, Book book) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text('Remove Book'),
        content:
            Text('Are you sure you want to remove ${book.name} from the cart?'),
        actions: [
          CupertinoDialogAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('Remove'),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .removeBook(book);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
