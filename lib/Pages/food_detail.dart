import 'package:Sushi/Components/Button.dart' show MyButton;
import 'package:Sushi/Models/food.dart';
import 'package:Sushi/Models/shop.dart';
import 'package:Sushi/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // Quanity
  int quantityCount = 0;

  // Decrement Quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // Increment Quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    // Only Add to Cart if there is something in Cart
    if (quantityCount > 0) {
      // Get Access to Shop
      final shop = context.read<Shop>();

      // Add to Cart
      shop.addToCart(widget.food, quantityCount);

      // Let User know it was Successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (context) => AlertDialog(
              backgroundColor: primaryColor,
              content: const Text(
                "Successfully added to Cart",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              actions: [
                // Okay Button
                IconButton(
                  onPressed: () {
                    // Pop once to Remove
                    Navigator.pop(context);

                    // Pop again to go to Previous screen
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.done_all_rounded, color: Colors.white),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // Listview of Food Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  // Image
                  Image.asset(widget.food.imagePath, height: 100),

                  const SizedBox(height: 25),

                  // Rating
                  Row(
                    children: [
                      // Star Icon
                      Icon(Icons.star, color: Colors.yellow[800]),

                      const SizedBox(width: 5),

                      // Rating Number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Food Name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.poppins(fontSize: 28),
                  ),

                  const SizedBox(height: 17),

                  // Description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Sushi is a Japanese dish consisting of cooked rice that is seasoned with vinegar, and typically combined with other ingredients such as seafood, vegetables, and occasionally cooked ingredients. While often associated with raw fish, sushi can also include cooked ingredients or be entirely vegetarian. ",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Price + Quantity + Add to Cart Button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // Price + Quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    Text(
                      "\$" + widget.food.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    // Quantity
                    Row(
                      children: [
                        // Minus Button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(Icons.remove, color: Colors.white),
                          ),
                        ),

                        // Quantity Button
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        // Plus Button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Add to Cart Button
                MyButton(text: "Add to Cart", onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
