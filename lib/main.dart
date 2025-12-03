import 'package:crud_flutter/contact.dart';
import 'package:crud_flutter/form.dart';
import 'package:crud_flutter/home.dart';
import 'package:crud_flutter/practice1.dart';
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
      },
    );
  }
}
