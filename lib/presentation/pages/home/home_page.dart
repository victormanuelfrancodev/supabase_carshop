import 'package:supabasemeetup/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).homePage),
      ),
      body: const Center(
        child: Text(S.of(context).welcomeToTheHomePage),
      ),
    );
  }
}
