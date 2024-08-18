import 'package:flutter/cupertino.dart';
import 'package:supabasemeetup/core/result/result.dart';
import 'package:supabasemeetup/domain/entity/product.dart';

import '../../domain/repositories/cart_shop_repository.dart';

sealed class BuyState {}

class InitialState extends BuyState {}

class LoadingState extends BuyState {}

class LoadedState extends BuyState {
  LoadedState({required this.result});
  final String result;
}

class FailureState extends BuyState {}

class BuyNotifier extends ChangeNotifier {
  BuyNotifier({required CartShopRepository cartShopRepository})
      : _cartShopRepository = cartShopRepository;

  final CartShopRepository _cartShopRepository;
  BuyState buyState = InitialState();

  void buyProducts(int userId, List<Product> products) async {
     buyState = LoadingState();
    notifyListeners();
    final result = await _cartShopRepository.buyProducts(userId, products);
    if (result is Success) {
      buyState = LoadedState(result: (result as Success).value);
      
      notifyListeners();
      return;
    }

    buyState = FailureState();
    notifyListeners();
  }
}
