import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1, // Default quantity is 1
  });
}

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  // Calculate the total price of items in the cart
  int get totalPrice {
    return _items.values
        .fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  // Add an item to the cart
  void addItem(String id, String title, int price, String image, int quantity) {
    if (_items.containsKey(id)) {
      // If the item already exists in the cart, increase its quantity
      _items[id]!.quantity += quantity;
    } else {
      // If the item is not in the cart, add it
      _items[id] = CartItem(
        id: id,
        title: title,
        price: price,
        image: image,
        quantity: quantity,
      );
    }
    notifyListeners();
  }

  // Remove an item completely from the cart
  void removeItems(String id) {
    _items.remove(id);
    notifyListeners();
  }

  // Increase the quantity of a specific item
  void increaseQuantity(String id) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity++;
      notifyListeners();
    }
  }

  // Decrease the quantity of a specific item
  void decreaseQuantity(String id) {
    if (_items.containsKey(id)) {
      if (_items[id]!.quantity > 1) {
        _items[id]!.quantity--;
      } else {
        // If quantity is 1, remove the item completely
        _items.remove(id);
      }
      notifyListeners();
    }
  }
}
