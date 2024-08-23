import 'package:flutter/material.dart';
import 'package:supabasemeetup/home/start_page.dart';
import 'package:supabasemeetup/presentation/pages/car_shop_page.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartPage()),
                );
              },
              child: const Text('Efficient Example'),
            ),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CarShopPage()),
                          );
              },
              child: const Text('Car Shop'),
            ),
          ],
        ),
      ),
    );
  }
}
