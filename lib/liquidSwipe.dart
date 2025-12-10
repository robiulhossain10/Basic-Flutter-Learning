import 'package:basic_flutter_learning/contact.dart';
import 'package:basic_flutter_learning/form.dart';
import 'package:basic_flutter_learning/practice1.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyLiqudSwipe extends StatelessWidget {
  MyLiqudSwipe({super.key});
  final pages2 = [demoPage(), DemoForm(), MyContactPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liquid Swipe'),
        backgroundColor: Colors.amber,
      ),
      body: LiquidSwipe(pages: pages2),
    );
  }
}

class MyGrids extends StatefulWidget {
  const MyGrids({super.key});

  @override
  State<MyGrids> createState() => _MyGridsState();
}

class _MyGridsState extends State<MyGrids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Grids'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(color: Colors.amberAccent),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(color: Colors.green),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(color: Colors.yellowAccent),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(color: Colors.cyanAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
