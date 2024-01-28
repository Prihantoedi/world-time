import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(color: Colors.white), // change the color of back button in appbar
        title: Text(
            'Choose a Location',
            style: TextStyle(
              color: Colors.white
            ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
          onPressed: (){},
          child: Text('counter is'),
      )
    );
  }
}
