// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ECommerceApp extends StatefulWidget {
  const ECommerceApp({super.key});

  @override
  State<ECommerceApp> createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {
  bool isDark = true;
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.brown,
      ),
      home: ShopPage(),
    );
  }
}

class Product {
  String productName;
  int productPrice;
  String productImage;
  bool isFav = false;
  Product(
      {required this.productPrice,
      required this.productName,
      this.productImage = "assets/images/myPict.jpg"});

  void favorite() {
    isFav = !isFav;
  }
}

List<Product> productData = [
  Product(
      productPrice: 2000,
      productName: "Headset Gaming",
      productImage: "assets/images/myFace.jpg"),
  Product(productPrice: 2000, productName: "Microphone"),
  Product(productPrice: 2000, productName: "Kamera")
];

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("E-Commerce"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritePage()),
                );
              },
              icon: Icon(Icons.favorite)),
          // Switch(
          //     value: isDark,
          //     onChanged: (value) {
          //       setState(() {
          //         isDark = value;
          //       });
          //     })
        ],
      ),
      body: ListView.builder(
        itemCount: productData.length,
        itemBuilder: (context, index) {
          return ProductCard(product: productData[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  Product product;
  ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    widget.product.productImage,
                    width: 64.0,
                    height: 64.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.productName),
                    Text("Rp. ${widget.product.productPrice}"),
                  ],
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.product.favorite();
                    });
                  },
                  icon: widget.product.isFav
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(Icons.favorite_border),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite"),
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopPage()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: productData.length,
        itemBuilder: (context, index) {
          if (productData[index].isFav) {
            return ProductCard(
              product: productData[index],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
