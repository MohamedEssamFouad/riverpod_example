import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>>fetchUsers()async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if(response.statusCode==200){
    List<dynamic>users=json.decode(response.body);
    return users.map((user) => user['name'].toString()).toList();

  }else{
    throw Exception('Failed');
  }
}
final userProvider = FutureProvider<List<String>>((ref) async {
  return fetchUsers();
});