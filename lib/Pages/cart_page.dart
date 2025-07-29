import 'package:flutter/material.dart';
import 'package:maps/Components/Button.dart';
import 'package:maps/Models/food.dart';
import 'package:maps/Models/shop.dart';
import 'package:maps/Theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Remove From Cart
  void removeFromCart(Food food, BuildContext context) {
    // Get access to Shop
    final shop = context.read<Shop>();

    // Remove form Cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder:
          (context, value, child) => Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              title: Text("My Cart"),
              backgroundColor: primaryColor,
              elevation: 0,
            ),
            body: Column(
              children: [
                // Customer Cart
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      // Get Food from Cart
                      final Food food = value.cart[index];

                      // Get Food Name
                      final String foodName = food.name;

                      // Get Food Price
                      final String foodPrice = food.price;

                      // Return List Tile
                      return Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                        ),
                        child: ListTile(
                          title: Text(
                            foodName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            foodPrice,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () => removeFromCart(food, context),
                            icon: Icon(Icons.delete, color: Colors.grey[300]),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Pay Button
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: MyButton(text: "Pay Now", onTap: () {}),
                ),
              ],
            ),
          ),
    );
  }
}
