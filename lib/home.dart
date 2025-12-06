import 'package:basic_flutter_learning/practice1.dart';
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
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountEmail: Text('dhgfds@hfkdfj'),
                accountName: Text('dsdsdsd'),
                currentAccountPicture: CircleAvatar(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyParamRoute(
                          title: 'Robiul Hossain',
                          subTitle: 'Softwere Engineer',
                          onTapMessage: handleMessage,
                          count: 10,
                        ),
                      ),
                    );
                  },
                  child: const Text('Go to Param Page'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/productcard');
                  },
                  child: const Text('Go to Card Page'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  handleMessage(String p1) {
    debugPrint('dhsdyugs $p1');
  }
}
