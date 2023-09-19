import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/models/food.dart';

class Shop extends ChangeNotifier{
  // food List
  final List<Food> _foodMenu = [

    Food(name: "Salmon Sushi",
        price: "21.0",
        imagePath: "lib/images/salmon_sushi.png",
        rating: "5"),

    Food(name: "Tuna",
        price: "20.0",
        imagePath: "lib/images/tuna.png",
        rating: "4.5")

  ];

//   customer Cart
  List<Food> _cart = [];

// getter methoda
  List<Food> get foodMenu => _foodMenu;

  List<Food> get cart => _cart;

// Add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

// remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}