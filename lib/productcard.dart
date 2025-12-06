import 'dart:ffi';

import 'package:flutter/material.dart';

class MyProductCard extends StatefulWidget {
  const MyProductCard({super.key});

  @override
  State<MyProductCard> createState() => _MyProductCardState();
}

class _MyProductCardState extends State<MyProductCard> {
  final category = [
    'ALL',
    'ELECTRONICS',
    'FASHION',
    'BEAUTY',
    'HARBAL',
    'CLOTHINGS',
    'TOYS',
    'DRINKS',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Easy'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            iconSize: 30,
          ),
        ],
        backgroundColor: Colors.lightGreen,
      ),

      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search product",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 15),

            //Tags
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Chip(
                      label: Text(
                        category[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.indigo,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20,),

            Expanded(child: 
            GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12
              ),
              itemCount: products.length,
               itemBuilder: (context, index){
                final 
               }))
          ],
          
          //
        ),
      ),
    );
  }
}


class Productcard{
  final String name;
  final String img;
  final Double price;

  Productcard({required this.name, required this.img, required this.price});

  
}