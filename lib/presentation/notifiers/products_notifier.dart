import 'package:flutter/cupertino.dart';
import 'package:supabasemeetup/core/result/result.dart';
import 'package:supabasemeetup/domain/entity/product.dart';

import '../../domain/repositories/cart_shop_repository.dart';

sealed class ProductState {}

class InitialState extends ProductState {}

class LoadingState extends ProductState {}

class LoadedState extends ProductState {
  LoadedState({required this.products});
  final List<Product> products;
}

class FailureState extends ProductState {}

class ProductNotifier extends ChangeNotifier {
  ProductNotifier({required CartShopRepository cartShopRepository})
      : _cartShopRepository = cartShopRepository;

  final CartShopRepository _cartShopRepository;
  ProductState productState = InitialState();

  void generateProducts() async {
    productState = LoadingState();
    notifyListeners();
    final result = await _cartShopRepository.getAllProducts();
    if (result is Success) {
      productState = LoadedState(products: (result as Success).value);

      notifyListeners();
      return;
    }
    productState = FailureState();
    notifyListeners();
  }

}
