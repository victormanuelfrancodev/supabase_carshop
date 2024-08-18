import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabasemeetup/presentation/inherited/user_car_product_provider.dart';
import 'package:supabasemeetup/presentation/notifiers/products_notifier.dart';
import 'package:supabasemeetup/presentation/pages/payment_page.dart';
import 'package:supabasemeetup/repositories/cart_shop_repository_implementation.dart';

import '../../data/resources/shop_element_datasource.dart';

class CarShopPage extends StatefulWidget {
  const CarShopPage({super.key});

  @override
  State<CarShopPage> createState() => _CarShopPageState();
}

class _CarShopPageState extends State<CarShopPage> {
  final _carShopStateNotifier = ProductNotifier(
      cartShopRepository: CartShopRepositoryImplementation(
          shopElementDatasource:
              ShopElementDatasource(client: Supabase.instance.client)));

  @override
  void initState() {
    _carShopStateNotifier.generateProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userCarProducts = UserCarProductProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Car Shop'),
          actions: [
            AnimatedBuilder(
                animation: userCarProducts!.userCarProductsNotifier,
                builder: (context, child) {
                  return Row(
                    children: [
                      Text(
                          'Total: ${userCarProducts.userCarProductsNotifier.products.length}'),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentPage()),
                          )
                        },
                      ),
                    ],
                  );
                })
          ],
        ),
        body: Center(
          child: RefreshIndicator(
            onRefresh: () async {
              _carShopStateNotifier.generateProducts();
            },
            child: ListenableBuilder(
              listenable: _carShopStateNotifier,
              builder: (context, child) {
                return switch (_carShopStateNotifier.productState) {
                  InitialState() => const SizedBox(),
                  LoadingState() => const CircularProgressIndicator(),
                  FailureState() => const Text('Failed'),
                  LoadedState(products: final products) => ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return products[index].quantity >= 1
                            ? Card(
                                child: ListTile(
                                  title: Text(products[index].name),
                                  subtitle:
                                      Text(products[index].price.toString()),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.add_shopping_cart),
                                    onPressed: () => {
                                      userCarProducts.userCarProductsNotifier
                                          .addProduct(products[index]),
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                    ),
                };
              },
            ),
          ),
        ));
  }
}
