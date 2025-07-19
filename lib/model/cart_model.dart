import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _shopItems = [
    ["Avocado", 2.00, "lib/images/avocado.png", Colors.green],
    ["Apple", 1.50, "lib/images/apple.png", Colors.red],
    ["Banana", 1.20, "lib/images/banana.png", Colors.yellow],
    ["Orange", 1.80, "lib/images/orange.png", Colors.orange],
    ["Grapes", 2.50, "lib/images/grapes.png", Colors.purple],
  ];
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add item to cart
  void addToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  //remove item from cart
  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
  //calculate total price
String calculateTotalPrice() {
    double totalPrice = 0.0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}