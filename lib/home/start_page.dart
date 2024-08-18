import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextEditingController _nameController = TextEditingController();
  Stopwatch stopwatch = Stopwatch();

  Future<void> insertName(String name)async{
    await Supabase.instance.client.from('user').insert({'name': name, 'points': 1}).then((value) {
      print("ok!");
    }).catchError((error){
      print(error);
    });
  }

  Future<void> fetchNames() async{
    final response = await Supabase.instance.client.from('user').select();
    print(response);
  }

  Future<void> commit() async {
    await Supabase.instance.client.rpc('commit_transaction').then((value) {
      print("commit ok!");
    }).catchError((error){
      print(error);
    });
  }

  Future<void> rollback() async {
    await Supabase.instance.client.rpc('revert_changes').then((value) {
      print("rollback ok!");
    }).catchError((error){
      print(error);
    });
  }

  Future<void> insertNewUser(String functionName, {Map<String, dynamic>? params}) async {
    await Supabase.instance.client.rpc(functionName, params: params).then((value) {
      print("insert ok!");
    }).catchError((error){
      print(error);
    });
  }

  Future<void> insert500UsersStoreProcedures() async {
    await Supabase.instance.client.rpc('insert_users_batch', params: {'count':500}).then((value) {
      print("insert ok!");
    }).catchError((error){
      print(error);
    });
  }

  Future<void>insert500Users() async {
    for (var i = 0; i < 500; i++) {
      await Supabase.instance.client.from('user').insert({'name': 'name$i', 'points': 1}).then((value) {
        print("ok!");
      }).catchError((error){
        print(error);
      });
    }
  }


  Future<void> addPoints(String name, int points) async {
    final url = Uri.parse('https://francodev.live/monkeyapi/pointsinsert.php');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'name': name, 'points': points.toString()},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success']) {
          print('User added successfully with ID: ${data['id']}');
        } else {
          print('Failed to add user: ${data['error']}');
        }
      } else {
        print('Failed to load data: Server responded with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> updatePointsFromProcedure()async{
    await Supabase.instance.client.rpc('update_user_points').then((value) {
      print("insert ok!");
    }).catchError((error){
      print(error);
    });
  }

  Future<void> updatePointsFromNormalProcess()async{

    final getUsers = await Supabase.instance.client.from('user').select('*');
    final List<Map<String, dynamic>> users = getUsers;
    for (var user in users) {
      int points = int.parse(user['points'].toString());
      int newPoints = (points > 100 ? points * 2 : points ~/ 2);
      await Supabase.instance.client.from('user').update({'points': newPoints}).eq('id', user['id']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Enter your name',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: ()async{
               //await insertNewUser('insert_name_with_decision', params: {'name': _nameController.text});
              await insertName(_nameController.text);
            },
            child: const Text('Submit'),
          ),

          ElevatedButton(
            onPressed: ()async{
              await commit();
            },
            child: const Text('commit'),
          ),
          ElevatedButton(
            onPressed: () async{
              await rollback();
            },
            child: const Text('rollback'),
          ),
          ElevatedButton(
            onPressed: () async{
              stopwatch.reset();
              stopwatch.start();
              await insert500Users();
              stopwatch.stop();
              print('Normal mode: ${stopwatch.elapsed}');
            },
            child: const Text('Insert 500 users  Names normal mode'),
          ),
          ElevatedButton(
            onPressed: () async{
              stopwatch.reset();
              stopwatch.start();
              await insert500UsersStoreProcedures();
              stopwatch.stop();
              print('Store procedures mode: ${stopwatch.elapsed}');
            },
            child: const Text('Insert 500 users  Names store procedures'),
          ),
          ElevatedButton(
            onPressed: () async{
              stopwatch.reset();
              stopwatch.start();
              await updatePointsFromProcedure();
              stopwatch.stop();
              print('Store procedures mode: ${stopwatch.elapsed}');
            },
            child: const Text('Update points from procedure'),
          ),

          ElevatedButton(
            onPressed: () async{
              stopwatch.reset();
              stopwatch.start();
              await updatePointsFromNormalProcess();
              stopwatch.stop();
              print('Store procedures mode: ${stopwatch.elapsed}');
            },
            child: const Text('Update points from normal process'),
          ),
          ElevatedButton(
            onPressed: ()async{
              await addPoints(_nameController.text, 1);
            },
            child: const Text('Incrementa mas puntos con inyeccion sql'),
          ),
        ],
      ),
    );
  }
}
