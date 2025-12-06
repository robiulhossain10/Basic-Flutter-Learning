import 'package:flutter/material.dart';

class demoPage extends StatelessWidget {
  demoPage({super.key});

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Widget Demo"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(10),
        // Vertical Scrollable Container
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Robiul !!!! Welcome to Flutter",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 20),

              // Horizontal Scrollable Container
              Container(
                padding: const EdgeInsets.all(16.0),
                height: 100.00,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: const Color.fromARGB(255, 50, 1, 141),
                    width: 1.0,
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 40.0),
                      Icon(Icons.network_cell, color: Colors.white, size: 40.0),
                      Icon(
                        Icons.mobile_friendly,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      Icon(Icons.car_rental, color: Colors.white, size: 40.0),
                      Icon(Icons.house, color: Colors.white, size: 40.0),
                      Icon(Icons.water, color: Colors.white, size: 40.0),
                      Icon(Icons.food_bank, color: Colors.white, size: 40.0),
                      Icon(
                        Icons.bluetooth_disabled,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      Icon(
                        Icons.bluetooth_disabled,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      Icon(
                        Icons.bluetooth_disabled,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      Icon(
                        Icons.bluetooth_disabled,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      Icon(
                        Icons.bluetooth_disabled,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      Icon(
                        Icons.desktop_access_disabled,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Text Field Widget
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Enter Your name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 14.0),
                ),
              ),
              SizedBox(height: 20),

              // Elevated Button with Icon
              ElevatedButton.icon(
                onPressed: () {
                  final name = _nameController.text;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Hello, $name!')));
                },
                icon: Icon(Icons.send),
                label: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
              Image.asset(
                'assets/White and Gray Simple Business LinkedIn Article Cover Image.png',
              ),
              Image.asset(
                'assets/White and Gray Simple Business LinkedIn Article Cover Image.png',
              ),
              Image.asset(
                'assets/White and Gray Simple Business LinkedIn Article Cover Image.png',
              ),
              Image.asset(
                'assets/White and Gray Simple Business LinkedIn Article Cover Image.png',
              ),
              SizedBox(
                height: 20,
                child: Text(
                  "Network Image Below:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Image.network(
                'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
              ),

              //Circle Avatar Widget
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/new.jpg'),
                ),
              ),
              SizedBox(height: 20),
              Text("Fade In Image Below:"),
              SizedBox(height: 10),

              //Fade In Image Widget
              FadeInImage.assetNetwork(
                placeholder: 'assets/new.jpg',
                image: 'https://www.w3schools.com/w3images/lights.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyParamRoute extends StatelessWidget {
  final String title;
  final String? subTitle;
  final int count;
  final Function(String)? onTapMessage;

  const MyParamRoute({
    super.key,
    required this.title,
    this.subTitle,
    this.count = 0,
    this.onTapMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parameter Route')),
      body: Card(
        elevation: 5,
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(fontSize: 12)),
            if (subTitle != null)
              Text(subTitle!, style: TextStyle(fontSize: 12)),
            Text('Count $count'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (onTapMessage != null) {
                  onTapMessage!('Button Tapped');
                } else {
                  Navigator.pop(context);
                }
              },
              child: onTapMessage != null
                  ? const Text('Send Callback')
                  : const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
