import 'package:flutter/material.dart';
import 'package:maps/Components/Button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.grey[900]),
        title: Text("Tokyo", style: TextStyle(color: Colors.grey[900])),
      ),
      body: Column(
        children: [
          // Promo Banner
          Container(
            child: Row(
              children: [
                // Promo Message
                Text("Get 32% Promo"),

                // Redeem Button
                MyButton(text: "Redeem", onTap: () {}),
              ],
            ),
          ),

          // Search Bar

          // Menu List

          // Popular Food
        ],
      ),
    );
  }
}
