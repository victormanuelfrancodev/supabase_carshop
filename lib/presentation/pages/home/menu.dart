import 'package:supabasemeetup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:supabasemeetup/presentation/pages/home/start_page.dart';
import 'package:supabasemeetup/presentation/pages/car_shop_page.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).menu),
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
              child: Text(S.of(context).efficientExample),
            ),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CarShopPage()),
                          );
              },
              child: Text(S.of(context).carShop),
            ),
          ],
        ),
      ),
    );
  }
}
