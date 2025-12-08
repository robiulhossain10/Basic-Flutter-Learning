// import 'package:basic_flutter_learning/expanded.dart';
// import 'package:basic_flutter_learning/practice1.dart';
// import 'package:basic_flutter_learning/sqLite/model/ui/user_list.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Home Page', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         iconTheme: const IconThemeData(
//           color: Colors.white, // Drawer icon color
//           size: 28, // optional: icon size
//         ),
//         backgroundColor: Colors.deepOrange,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/form');
//             },
//             icon: Icon(Icons.network_wifi),
//           ),
//           IconButton(onPressed: () {}, icon: Icon(Icons.lan_rounded)),
//           IconButton(onPressed: () {}, icon: Icon(Icons.android)),
//         ],
//       ),
//       drawer: SafeArea(
//         child: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               const UserAccountsDrawerHeader(
//                 accountEmail: Text('dhgfds@hfkdfj'),
//                 accountName: Text('dsdsdsd'),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundImage: AssetImage('assets/new.jpg'),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.home),
//                 title: const Text("Form"),
//                 onTap: () {
//                   Navigator.of(context).popAndPushNamed('/form');
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.settings),
//                 title: const Text("Settings"),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // প্রথম row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/demo');
//                   },
//                   child: const Text('Go to Demo Page'),
//                 ),
//                 const SizedBox(width: 20), // spacing between buttons
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/form');
//                   },
//                   child: const Text('Go to Form Page'),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20), // spacing between rows
//             // দ্বিতীয় row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/contact');
//                   },
//                   child: const Text('Go to Contact Page'),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/ios');
//                   },
//                   child: const Text('Go to IOS Page'),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MyParamRoute(
//                           title: 'Robiul Hossain',
//                           subTitle: 'Softwere Engineer',
//                           onTapMessage: handleMessage,
//                           count: 10,
//                         ),
//                       ),
//                     );
//                   },
//                   child: const Text('Go to Param Page'),
//                 ),
//                 const SizedBox(width: 20),
//               ],
//             ),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/productcard');
//                   },
//                   child: const Text('Go to Card Page'),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/scanner');
//                   },
//                   child: const Text('Go to Scanner Page'),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => UserList()),
//                     );
//                   },
//                   child: const Text('Go to User Page'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MyExpand()),
//                     );
//                   },
//                   child: const Text('Go to Expand Page'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void handleMessage(String p1) {
//     debugPrint('dhsdyugs $p1');
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic_flutter_learning/expanded.dart';
import 'package:basic_flutter_learning/practice1.dart';
import 'package:basic_flutter_learning/sqLite/model/ui/user_list.dart';

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
        title: const Text(
          'My Home Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white, size: 28),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            onPressed: () => context.push('/form'),
            icon: const Icon(Icons.network_wifi),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.lan_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.android)),
        ],
      ),

      // Drawer
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
                  Navigator.pop(context);
                  context.go('/form'); // Replaces the page
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.push('/demo'),
                  child: const Text('Go to Demo Page'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.push('/form'),
                  child: const Text('Go to Form Page'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.push('/contact'),
                  child: const Text('Go to Contact Page'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.push('/ios'),
                  child: const Text('Go to IOS Page'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Param Route
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
              ],
            ),

            const SizedBox(height: 20),

            // Row 4
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.push('/productcard'),
                  child: const Text('Go to Card Page'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.push('/scanner'),
                  child: const Text('Go to Scanner Page'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Row 5
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.push('/userlist'),
                  child: const Text('Go to User Page'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => MyExpand()),
                    );
                  },
                  child: const Text('Go to Expand Page'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handleMessage(String p1) {
    debugPrint('dhsdyugs $p1');
  }
}

class MyParamRouteData {
  final String title;
  final String subTitle;
  final int count;

  MyParamRouteData({
    required this.title,
    required this.subTitle,
    required this.count,
  });
}
