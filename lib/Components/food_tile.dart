import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps/Models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;

  const FoodTile({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Image.asset(food.imagePath, height: 140),

          // Text
          Text(food.name, style: GoogleFonts.dmSerifDisplay(fontSize: 20)),

          // Price + Rating
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Text(
                  "\$" + food.price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),

                Row(
                  children: [
                    // Rating
                    Icon(Icons.star, color: Colors.yellow[800]),

                    //Text
                    Text(food.rating, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
