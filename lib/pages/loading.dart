import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async{
      String theUrl = 'https://jsonplaceholder.typicode.com/todos/1';
      Uri uri = Uri.parse(theUrl);
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      print(data);
      print(data['userId']);
      print(data['title']);
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('im running');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
