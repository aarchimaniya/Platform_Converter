import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'View/Screens/home_page/home_page.dart';
import 'View/Screens/splash_screens/splash_screens.dart';
import 'controller/cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bookey App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
