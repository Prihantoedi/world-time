import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async{

    // make the request
    String timeUrlStr = 'http://worldtimeapi.org/api/timezone/Europe/London';
    Uri timeUri = Uri.parse(timeUrlStr);
    Response response = await get(timeUri);
    Map data = jsonDecode(response.body);
    // print(data);

    // get the properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].toString().substring(1,3);
    // print(datetime);
    // print(offset);

    // create Datetime object
    DateTime now = DateTime.parse(datetime);
    now.add(Duration(hours: int.parse(offset)));
    print(now);
  }


  @override
  void initState() {
    super.initState();
    getTime();
    print('im running');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
