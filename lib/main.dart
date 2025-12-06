import 'package:basic_flutter_learning/contact.dart';
import 'package:basic_flutter_learning/form.dart';
import 'package:basic_flutter_learning/home.dart';
import 'package:basic_flutter_learning/iosmain.dart';
import 'package:basic_flutter_learning/practice1.dart';
import 'package:basic_flutter_learning/productcard.dart';
import 'package:basic_flutter_learning/scanner.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: '/',

      routes: {
        '/': (context) => MyHomePage(),
        '/demo': (context) => demoPage(),
        '/form': (context) => DemoForm(),
        '/contact': (context) => MyContactPage(),
        '/ios': (context) => IOSMainPage(),
        '/productcard': (context) => MyProductCard(),
        '/scanner': (context) => ScannerPage(),
      },
    );
  }
}
