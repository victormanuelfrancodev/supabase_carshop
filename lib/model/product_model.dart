import 'package:supabasemeetup/domain/entity/product.dart';

class ProductModel extends Product{
  const ProductModel({
    required super.id,
    required super.name,
    required super.quantity,
    required super.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}