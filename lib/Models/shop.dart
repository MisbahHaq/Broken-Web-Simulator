import 'package:Sushi/Models/food.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    // Salmon Sushi
    Food(
      name: "Salmon Sushi",
      price: "21.00",
      imagePath: "assets/salmon.png",
      rating: "4.9",
    ),

    // Bento
    Food(
      name: "Bento",
      price: "23.00",
      imagePath: "assets/sushi3.png",
      rating: "4.3",
    ),

    // Bento
    Food(
      name: "Bento Set 3",
      price: "49.00",
      imagePath: "assets/sushi5.png",
      rating: "4.3",
    ),

    // Maki Sushi
    Food(
      name: "Maki Sushi",
      price: "27.00",
      imagePath: "assets/sushi.png",
      rating: "4.8",
    ),

    // Maki Sushi
    Food(
      name: "Maki Sushi Set 3",
      price: "50.00",
      imagePath: "assets/sushi2.png",
      rating: "4.1",
    ),

    // Tuna
    Food(
      name: "Tuna",
      price: "23.00",
      imagePath: "assets/tuna.png",
      rating: "4.3",
    ),
  ];

  // Customer Cart
  List<Food> _cart = [];

  // Getter Methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // Add to Cart
  void addToCart(Food fooditem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(fooditem);
    }
    notifyListeners();
  }

  // Remove from Cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
