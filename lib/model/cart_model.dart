import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _cartItems = [
    ["Avocado", 2.00, "lib/images/avocado.png", Colors.green],
    ["Apple", 1.50, "lib/images/apple.png", Colors.red],
    ["Banana", 1.20, "lib/images/banana.png", Colors.yellow],
    ["Orange", 1.80, "lib/images/orange.png", Colors.orange],
    ["Grapes", 2.50, "lib/images/grapes.png", Colors.purple],
  ];
  get getCartItems => _cartItems;
}