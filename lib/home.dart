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
      appBar: AppBar(
        title: Text('My Home Page', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountEmail: const Text('dhgfds@hfkdfj'),
              accountName: Text('dsdsdsd'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/new.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Form"),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/form');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // প্রথম row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/demo');
                  },
                  child: const Text('Go to Demo Page'),
                ),
                const SizedBox(width: 20), // spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/form');
                  },
                  child: const Text('Go to Form Page'),
                ),
              ],
            ),

            const SizedBox(height: 20), // spacing between rows
            // দ্বিতীয় row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                  child: const Text('Go to Contact Page'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ios');
                  },
                  child: const Text('Go to IOS Page'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
