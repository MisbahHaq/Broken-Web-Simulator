import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps/Components/Button.dart';
import 'package:maps/Theme/colors.dart';

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
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Promo Message
                Column(
                  children: [
                    Text(
                      "Get 32% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Redeem Button
                    MyButton(text: "Redeem", onTap: () {}),
                  ],
                ),

                // Image
                Image.asset('assets/sushi5.png', height: 100),
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
