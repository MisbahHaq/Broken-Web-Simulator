import 'package:flutter/material.dart';
import 'package:maps/Models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
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
                children: [
                  // Image
                  Image.asset(widget.food.imagePath, height: 200),

                  const SizedBox(height: 25),

                  // Rating
                  Row(
                    children: [
                      // Star Icon
                      Icon(Icons.star, color: Colors.yellow[800]),

                      const SizedBox(width: 15),

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

                  // Food Name

                  // Description
                ],
              ),
            ),
          ),

          // Price + Quantity + Add to Cart Button
        ],
      ),
    );
  }
}
