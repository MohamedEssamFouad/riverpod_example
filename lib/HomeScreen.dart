import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = Provider<String>((ref) {
  return 'Hello World';
});

class Homescreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final helloworld=ref.watch(helloWorldProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Example'),

      ),
      body: Center(
        child: Text(helloworld),
      ),
    );
  }
}
