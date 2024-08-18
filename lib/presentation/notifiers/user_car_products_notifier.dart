
import 'package:flutter/material.dart';
import 'package:supabasemeetup/domain/entity/product.dart';

class UserCarProductsNotifier extends ChangeNotifier{

  List<Product> _products = [];
  List<Product> get products => _products;

  void addProduct(Product product){
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product){
    _products.remove(product);
    notifyListeners();
  }

  double getTotalPrice() {
    return _products.fold(0.0, (total, current) => total + current.price);
  }
}