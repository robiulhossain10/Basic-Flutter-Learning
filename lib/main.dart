// import 'package:basic_flutter_learning/contact.dart';
// import 'package:basic_flutter_learning/form.dart';
// import 'package:basic_flutter_learning/home.dart';
// import 'package:basic_flutter_learning/iosmain.dart';
// import 'package:basic_flutter_learning/practice1.dart';
// import 'package:basic_flutter_learning/productcard.dart';
// import 'package:basic_flutter_learning/scanner.dart';
// import 'package:basic_flutter_learning/sqLite/model/ui/user_list.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
//       initialRoute: '/',

//       routes: {
//         '/': (context) => MyHomePage(),
//         '/demo': (context) => demoPage(),
//         '/form': (context) => DemoForm(),
//         '/contact': (context) => MyContactPage(),
//         '/ios': (context) => IOSMainPage(),
//         '/productcard': (context) => MyProductCard(),
//         '/scanner': (context) => ScannerPage(),
//         '/userlist': (context) => UserList(),
//       },
//     );
//   }
// }

import 'package:basic_flutter_learning/contact.dart';
import 'package:basic_flutter_learning/form.dart';
import 'package:basic_flutter_learning/home.dart';
import 'package:basic_flutter_learning/iosmain.dart';
import 'package:basic_flutter_learning/liquidSwipe.dart';
import 'package:basic_flutter_learning/practice1.dart';
import 'package:basic_flutter_learning/productcard.dart';
import 'package:basic_flutter_learning/scanner.dart';
import 'package:basic_flutter_learning/sqLite/model/ui/user_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => MyHomePage(),
        ),
        GoRoute(
          path: '/demo',
          builder: (context, state) => demoPage(),
        ),
        GoRoute(
          path: '/form',
          builder: (context, state) => DemoForm(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => MyContactPage(),
        ),
        GoRoute(
          path: '/ios',
          builder: (context, state) => IOSMainPage(),
        ),
        GoRoute(
          path: '/productcard',
          builder: (context, state) => MyProductCard(),
        ),
        GoRoute(
          path: '/scanner',
          builder: (context, state) => ScannerPage(),
        ),
        GoRoute(
          path: '/userlist',
          builder: (context, state) => UserList(),
        ),
           GoRoute(path: '/swipe', builder: (context, state) => MyLiqudSwipe()),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

