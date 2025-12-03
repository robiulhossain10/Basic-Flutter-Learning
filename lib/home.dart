import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Home Page'), centerTitle: true),

      body: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // CENTER PROPERLY
          children: [
            ElevatedButton(onPressed: () {}, child: Icon(Icons.cabin)),
            SizedBox(width: 20),
            ElevatedButton(onPressed: () {}, child: Icon(Icons.cabin)),
            SizedBox(width: 20),
            ElevatedButton(onPressed: () {}, child: Icon(Icons.cabin)),
            SizedBox(width: 20),
            ElevatedButton(onPressed: () {}, child: Icon(Icons.cabin)),
          ],
        ),
      ),
    );
  }
}
