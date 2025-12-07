import 'package:flutter/material.dart';

class MyExpand extends StatelessWidget {
  const MyExpand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                // Box 1
                Expanded(
                  child: Container(
                    height: 500,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'Grid-1',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 15),

                // Box 2
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text('Grid-2', style: TextStyle(fontSize: 25)),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 15),

                // Box 3
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Grid-3',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
