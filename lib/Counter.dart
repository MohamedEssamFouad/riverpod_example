import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider=StateProvider<int>((ref)=>0);

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Consumer(
          builder: (context,ref,child){
            final counter=ref.watch(counterProvider);
            return Text('counter : $counter');
          },
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context,ref,child){
          return FloatingActionButton(onPressed: (){
            ref.read(counterProvider.notifier).state++;
          });

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
