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

  // PRODUCT LIST
  final List<ProductCardModel> products = [
    ProductCardModel(
      name: "Smart Watch",
      img: "https://cdn.bdstall.com/product-image/giant_247997.jpg",
      price: 1999.0,
    ),
    ProductCardModel(
      name: "Headphone",
      img: "https://cdn.bdstall.com/product-image/giant_247997.jpg",
      price: 999.0,
    ),
    ProductCardModel(
      name: "Shoes",
      img: "https://cdn.bdstall.com/product-image/giant_247997.jpg",
      price: 1499.0,
    ),
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
            SizedBox(height: 20),

            // PRODUCT GRID
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final p = products[index];
                  return ProductCardUI(product: p);
                },
              ),
            ),
          ],

          //
        ),
      ),
    );
  }
}

// PRODUCT CARD UI
class ProductCardUI extends StatelessWidget {
  final ProductCardModel product;

  const ProductCardUI({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(1, 1)),
        ],
      ),
      child: Column(
        children: [
          // IMAGE
          Expanded(
            flex: 7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.img,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          SizedBox(height: 5),

          // NAME
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // PRICE
          Text(
            "৳ ${product.price}",
            style: TextStyle(
              fontSize: 13,
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 5),
        ],
      ),
    );
  }
}

// PRODUCT MODEL
class ProductCardModel {
  final String name;
  final String img;
  final double price;

  ProductCardModel({
    required this.name,
    required this.img,
    required this.price,
  });
}
