import 'package:supabasemeetup/core/failure/failure.dart';
import 'package:supabasemeetup/core/result/result.dart';
import 'package:supabasemeetup/domain/entity/product.dart';
import '../data/resources/shop_element_datasource.dart';
import '../domain/repositories/cart_shop_repository.dart';

class CartShopRepositoryImplementation implements CartShopRepository {
  const CartShopRepositoryImplementation(
      {required ShopElementDatasource shopElementDatasource})
      : _shopElementDatasource = shopElementDatasource;

  final ShopElementDatasource _shopElementDatasource;

  @override
  Future<Result<List<Product>, Failure>> getAllProducts() async {
    try {
      final products = await _shopElementDatasource.getShopElements();
      return Success(products);
    } catch (e) {
      print(e);
      return Error(Failure('Error fetching products ${e.toString()}'));
    }
  }
  
  @override
  Future<Result<String, Failure>> buyProducts(int userId, List<Product> products) async{
     try{
       final response = await _shopElementDatasource.buyProducts(userId, products);
       return Success(response);
     }catch (e){
        print(e);
        return Error(Failure('Error buying products ${e.toString()}'));
     }
  }
}
