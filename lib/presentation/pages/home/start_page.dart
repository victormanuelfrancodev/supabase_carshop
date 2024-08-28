import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Stopwatch stopwatch = Stopwatch();

  Future<void> insert100UsersFunctionSQL() async {
    await Supabase.instance.client
        .rpc('insertusers', params: {'count': 100}).then((value) {
      print("---> $value");
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> insert100Users() async {
    for (var i = 0; i < 100; i++) {
      await Supabase.instance.client
          .from('users')
          .insert({'name': 'name $i', 'points': 1}).then((value) {
        print("insert!");
      }).catchError((error) {
        print(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  stopwatch.reset();
                  stopwatch.start();
                  await insert100Users();
                  stopwatch.stop();
                  print('Client side: ${stopwatch.elapsed}');
                },
                child: const Text('Insert 100 users - client side'),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  stopwatch.reset();
                  stopwatch.start();
                  await insert100UsersFunctionSQL();
                  stopwatch.stop();
                  print('Function sql: ${stopwatch.elapsed}');
                },
                child: const Text('Insert 100 users Fuction sql'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
