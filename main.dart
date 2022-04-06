// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int cartItems = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      appBar: AppBar(
        title: const Text("Badges Demo"),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.scale,
            badgeContent: Text("$cartItems"),
            child: IconButton(onPressed: () => setState(() {
              cartItems = 0;
            }), icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return FoodItemWidget(name: "Food Item ${index+1}", price: "\$${index+1}.99",
              icon: Icons.emoji_food_beverage_rounded, itemPressed: foodItemPressed);
        },
      ),
    );
  }

  void foodItemPressed() {
    setState(() {
      cartItems++;
    });
  }

}

class FoodItemWidget extends StatelessWidget {
  final String name;
  final String price;
  final IconData icon;
  final Function() itemPressed;

  const FoodItemWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.icon,
    required this.itemPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(5, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 60,),
              Expanded(
                child: Column(
                  children: [
                    Text(name),
                    Text(price, style: TextStyle(color: Colors.blue, fontSize: 16),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: itemPressed,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 30,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


