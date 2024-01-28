import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async{

    // simulate network request for a username
    String username = await Future.delayed(const Duration(seconds: 3), (){
      // print('prihanto');
      return 'prihanto';
    });


    // Simulate network request to get bio of the username
    String bio = await Future.delayed(const Duration(seconds: 2), (){
      // print('vega, musician & egg collector');
      return 'vega, musician & egg collector';
    });

    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('hey there!');
  }

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
