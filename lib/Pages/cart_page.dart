import 'package:flutter/material.dart';
import 'package:maps/Models/shop.dart';
import 'package:maps/Theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder:
          (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text("My Cart"),
              backgroundColor: primaryColor,
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                // Get Food from Cart

                // Get Food Name

                // Get Food Price

                // Return List Tile
              },
            ),
          ),
    );
  }
}
