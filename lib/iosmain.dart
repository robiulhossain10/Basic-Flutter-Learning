import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIOSApp extends StatelessWidget {
  const MyIOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(home: IOSMainPage());
  }
}

class IOSMainPage extends StatelessWidget {
  const IOSMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "Settings",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 1:
            return const MyDialogPage();
          case 2:
            return const SettingsPage();
          default:
            return const HomePage();
        }
      },
    );
  }
}

/////////////////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("iOS Home"),
        trailing: GestureDetector(
          onTap: () {
            showCupertinoActionSheet(context);
          },
          child: const Icon(CupertinoIcons.line_horizontal_3),
        ),
      ),
      child: Center(
        child: CupertinoButton.filled(
          child: const Text("Show Toast"),
          onPressed: () {
            showToast(context, "Hello from iOS Toast!");
          },
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////

class MyDialogPage extends StatelessWidget {
  const MyDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text("Contact Page")),
      child: Center(
        child: CupertinoButton(
          child: const Text("Show Dialog"),
          onPressed: () {
            showIOSDialog(context);
          },
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(child: Column(children: [
          
        ],
      ));
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

// 🔵 iOS Drawer Alternative → Action Sheet
void showCupertinoActionSheet(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      title: const Text("Menu"),
      message: const Text("Choose an option"),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Option 1"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Option 2"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Option 3"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Option 4"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Option 5"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Option 6"),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () => Navigator.pop(context),
        child: const Text("Cancel"),
      ),
    ),
  );
}

// 🔵 iOS Dialog
void showIOSDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text("iOS Dialog"),
      content: const Text("This is a Cupertino-style alert dialog."),
      actions: [
        CupertinoDialogAction(
          child: const Text("Close"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

// 🔵 iOS Toast
void showToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);

  OverlayEntry entry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 80,
      left: MediaQuery.of(context).size.width * 0.2,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      ),
    ),
  );

  overlay.insert(entry);

  Future.delayed(const Duration(seconds: 2)).then((_) => entry.remove());
}
