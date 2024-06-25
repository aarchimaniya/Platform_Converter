import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/cart_provider.dart';
import '../../../modal/character modal.dart';
import '../cart_page/cart_page.dart';
import '../home_page/home_page.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    bool isCupertino = Theme.of(context).platform == TargetPlatform.iOS;

    return isCupertino
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(book.name),
              leading: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                },
                child: const Icon(CupertinoIcons.home),
              ),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addBook(book);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: const Icon(CupertinoIcons.cart),
              ),
            ),
            child: _buildDetailContent(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                book.name,
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                icon: const Icon(CupertinoIcons.home, color: Colors.white),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addBook(book);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                ),
              ],
            ),
            body: _buildDetailContent(),
          );
  }

  Widget _buildDetailContent() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/images/category/homebackground.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(book.imagePath, height: 300),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                CupertinoIcons.book,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                book.name,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.person,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                'Actor: ${book.actor}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.house,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                'House: ${book.house}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.pets,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                'Patronus: ${book.patronus}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Icon(
                Icons.summarize,
                color: Colors.white,
              ),
              SizedBox(width: 5),
              Text(
                'Summaries:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          for (var summary in book.summaries)
            Text(
              summary,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
        ],
      ),
    );
  }
}
