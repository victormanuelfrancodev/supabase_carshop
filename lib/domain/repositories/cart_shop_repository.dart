import 'package:supabasemeetup/core/failure/failure.dart';
import 'package:supabasemeetup/core/result/result.dart';
import 'package:supabasemeetup/domain/entity/product.dart';

abstract class CartShopRepository {
  Future<Result<List<Product>,Failure>> getAllProducts();
  Future<Result<String,Failure>> buyProducts(int userId, List<Product> products);
}
