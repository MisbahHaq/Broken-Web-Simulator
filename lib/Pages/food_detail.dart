import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps/Models/food.dart';
import 'package:maps/Theme/colors.dart';

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
      quantityCount--;
    });
  }

  // Increment Quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
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
                  Image.asset(widget.food.imagePath, height: 200),

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

                // Add to Cart Button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
