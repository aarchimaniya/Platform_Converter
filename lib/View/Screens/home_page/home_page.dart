import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_page/cart_page.dart';
import '../../../modal/character modal.dart';
import '../detail_page/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _useCupertino = false;
  List<Book> books = [
    Book(
      name: 'Harry Potter Stone',
      actor: 'J.K. Rowling',
      house: 'Ravenclaw',
      patronus: 'Hare',
      price: '6767',
      imagePath: 'lib/assets/images/category/book1.jpg',
      summaries: [
        'Harry discovers he is a wizard on his 11th birthday.',
        'He attends Hogwarts and makes new friends.',
      ],
    ),
    Book(
      name: "Hermione Granger",
      house: "Gryffindor",
      patronus: "Otter",
      price: '6767',
      actor: "Emma Watson",
      imagePath: "lib/assets/images/category/book2.jpg",
      summaries: [
        "Hermione Jean Granger is one of Harry Potter's best friends.",
        "She is known for her intelligence and resourcefulness."
      ],
    ),
    Book(
      name: "Ron Weasley",
      house: "Gryffindor",
      patronus: "Jack Russell Terrier",
      price: '6767',
      actor: "Rupert Grint",
      imagePath: "lib/assets/images/category/book3.jpg",
      summaries: [
        "Hermione Jean Granger is one of Harry Potter's best friends.",
        "She is known for her intelligence and resourcefulness."
      ],
    ),
    Book(
      name: "Albus Dumbledore",
      house: "Gryffindor",
      patronus: "Phoenix",
      price: '6767',
      actor: "Richard Harris, Michael Gambon",
      imagePath: "lib/assets/images/category/book4.jpg",
      summaries: [
        "Hermione Jean Granger is one of Harry Potter's best friends.",
        "She is known for her intelligence and resourcefulness."
      ],
    ),
    Book(
      name: "Severus Snape",
      house: "Slytherin",
      patronus: "Doe",
      price: '6767',
      actor: "Alan Rickman",
      imagePath: "lib/assets/images/category/book5.jpg",
      summaries: [
        "Hermione Jean Granger is one of Harry Potter's best friends.",
        "She is known for her intelligence and resourcefulness."
      ],
    ),
    Book(
      name: "Draco Malfoy",
      house: "Slytherin",
      patronus: "None",
      price: '6767',
      actor: "Tom Felton",
      imagePath: "lib/assets/images/category/book6.jpg",
      summaries: [
        "Hermione Jean Granger is one of Harry Potter's best friends.",
        "She is known for her intelligence and resourcefulness."
      ],
    ),
    Book(
      name: "Sirius Black",
      house: "Gryffindor",
      patronus: "Large Dog",
      price: '6767',
      actor: "Gary Oldman",
      imagePath: "lib/assets/images/category/book7.jpg",
      summaries: [
        "Hermione Jean Granger is one of Harry Potter's best friends.",
        "She is known for her intelligence and resourcefulness."
      ],
    ),
    Book(
      name: "Rubeus Hagrid",
      house: "Gryffindor",
      patronus: "None",
      price: '6767',
      actor: "Robbie Coltrane",
      imagePath: "lib/assets/images/category/book8.jpg",
      summaries: [
        "Hermione Jean Granger is one of Harry Potter's best friends.",
        "She is known for her intelligence and resourcefulness."
      ],
    ),
    // Add more books here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Bookey App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_basket_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.info_circle_fill,
              color: Colors.white,
            ),
            onPressed: () => _showAlertDialog(),
          ),
          Switch(
            value: _useCupertino,
            onChanged: (value) {
              setState(() {
                _useCupertino = value;
              });
            },
          ),
        ],
      ),
      body:
          _useCupertino ? _buildCupertinoListView() : _buildMaterialListView(),
    );
  }

  void _showAlertDialog() {
    if (_useCupertino) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Cupertino Alert'),
          content: Text('This is a Cupertino style alert dialog.'),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Material Alert'),
          content: Text('This is a Material style alert dialog.'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildMaterialListView() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/images/category/homebackground.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading:
                  Image.asset(books[index].imagePath, width: 100, height: 100),
              title: Text(books[index].name),
              subtitle: Text(books[index].actor),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailPage(book: books[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildCupertinoListView() {
    return CupertinoScrollbar(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/category/homebackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Card(
              child: CupertinoButton(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.asset(books[index].imagePath,
                        width: 100, height: 100),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          books[index].name,
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .navTitleTextStyle,
                        ),
                        Text(
                          books[index].actor,
                          style: CupertinoTheme.of(context).textTheme.textStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => BookDetailPage(book: books[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
