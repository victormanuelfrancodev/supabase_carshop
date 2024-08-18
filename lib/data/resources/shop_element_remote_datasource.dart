

import '../../domain/entity/product.dart';

abstract class ShopElementRemoteDatasource {
  Future<List<Product>> getShopElements();
  Future<String> buyProducts(int userId, List<Product> products);
}