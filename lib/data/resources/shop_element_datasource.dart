import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabasemeetup/data/resources/shop_element_remote_datasource.dart';
import 'package:supabasemeetup/domain/entity/product.dart';
import 'package:supabasemeetup/model/product_model.dart';

class ShopElementDatasource implements ShopElementRemoteDatasource {
  const ShopElementDatasource({required SupabaseClient client})
      : _client = client;

  final SupabaseClient _client;

  @override
  Future<List<ProductModel>> getShopElements() async {
    final response = await _client.from('products').select('*');
    final List<Map<String, dynamic>> products = response;
    return products.map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<String> buyProducts(int userId, List<Product> products) async {
    try {
       final productList = products.map((product) => product.id).toList();
      final response = await Supabase.instance.client.rpc(
        'process_purchase',
        params: {
          'user_id': userId,
          'product_ids': productList,
        },
      );

      if (response != null) {
        return response as String;
      } else {
        print("Error: $response");
        return "Error: $response";
      }
    } catch (error) {
      print("Exception: $error");
      return "Exception: $error";
    }
  }
}
