import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabasemeetup/presentation/inherited/user_car_product_provider.dart';
import 'package:supabasemeetup/presentation/notifiers/buy_notifier.dart' as buy;

import '../../data/resources/shop_element_datasource.dart';
import '../../repositories/cart_shop_repository_implementation.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _buyStateNotifier = buy.BuyNotifier(
      cartShopRepository: CartShopRepositoryImplementation(
          shopElementDatasource:
              ShopElementDatasource(client: Supabase.instance.client)));

  @override
  Widget build(BuildContext context) {
    final userCarProducts = UserCarProductProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
            animation: userCarProducts!.userCarProductsNotifier,
            builder: (context, child) {
              return ListenableBuilder(
                  listenable: _buyStateNotifier,
                  builder: (context, child) {
                    return switch (_buyStateNotifier.buyState) {
                      buy.LoadedState(result: final result) =>
                        Center(child: Text(result)),
                      buy.InitialState() => Column(
                          children: [
                            const SizedBox(
                              height: 40,
                              child: Column(
                                children: [
                                  Text('My Products'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: userCarProducts
                                    .userCarProductsNotifier.products.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(userCarProducts
                                        .userCarProductsNotifier
                                        .products[index]
                                        .name),
                                    subtitle: Text(userCarProducts
                                        .userCarProductsNotifier
                                        .products[index]
                                        .price
                                        .toString()),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        userCarProducts.userCarProductsNotifier
                                            .removeProduct(userCarProducts
                                                .userCarProductsNotifier
                                                .products[index]);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _buyStateNotifier.buyProducts(
                                    22,
                                    userCarProducts
                                        .userCarProductsNotifier.products);
                              },
                              child: Text(
                                  'Pay Total ${userCarProducts.userCarProductsNotifier.getTotalPrice().toStringAsFixed(2)}'),
                            ),
                          ],
                        ),
                      buy.LoadingState() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      buy.FailureState() => const Center(
                          child: Text('Failed'),
                        ),
                    };
                  });
            }),
      ),
    );
  }
}
