import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Avocado", 2.00, "lib/images/avocado.png", Colors.green],
    ["Apple", 1.50, "lib/images/apple.png", Colors.red],
    ["Banana", 1.20, "lib/images/banana.png", Colors.yellow],
    ["Orange", 1.80, "lib/images/orange.png", Colors.orange],
    ["Grapes", 2.50, "lib/images/grapes.png", Colors.purple],
  ];

  List _cartItems = [];

  List get shopItems => _shopItems;
  List get cartItems => _cartItems;

  void addToCart(int index) {
    // Create a new list with the item data (not a reference)
    _cartItems.add([..._shopItems[index]]);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotalPrice() {
    double total = _cartItems.fold(0.0, (sum, item) => sum + (item[1] as double));
    return total.toStringAsFixed(2);
  }
}