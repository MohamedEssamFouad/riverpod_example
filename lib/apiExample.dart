import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/Service/requestApi.dart';

class Apiexample extends StatelessWidget {
  const Apiexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users List'),),
    body: Center(
      child: Consumer(
        builder: (context,ref,child){
          final userAsyncValue=ref.watch(userProvider);
          return userAsyncValue.when(data: (users)=>ListView.builder(
            itemCount: users.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(users[index]),
              );
            },
          ),
              error: (error, stack) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
          );
        },
      ),
    ),
    );

  }
}
