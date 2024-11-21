import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;

  CartItem({required this.id, required this.title, required this.price});
}

// to knowing what's he difference between OOP and FP (functional programming)
class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  void addItem(String id, String title, int price) {
    if (_items.containsKey(id)) {
      return;
    } else {
      _items.putIfAbsent(
          id, () => CartItem(id: id, title: title, price: price));
    }
    notifyListeners();
  }

  void removeItems(String id) {
    // untuk mengurangi items
    _items.remove(id);
    notifyListeners();
  }

  // untuk menghapus cache, menghapus secara permanent
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
