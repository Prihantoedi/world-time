import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String? location; // location name for the UI
  String? time; // the time in that location
  String? flag; // url to an asset flag icon
  String? url; // location url for API endpoint
  bool? isDaytime; // true or false if daytime or not


  WorldTime({required this.location, required this.flag, required this.url});


  Future<void> getTime() async{

    try{
      // make the request
      String timeUrlStr = 'http://worldtimeapi.org/api/timezone/$url';
      Uri timeUri = Uri.parse(timeUrlStr);
      Response response = await get(timeUri);
      Map data = jsonDecode(response.body);
      // print(data);

      // get the properties from data
      // String datetime = data['utc_datetime'];
      int datetime = data['unixtime'];
      String offset = data['utc_offset'].toString().substring(1,3);
      print(datetime);
      print(offset);

      // create Datetime object
      // DateTime now = DateTime.parse(datetime);
      // now.add(Duration(hours: int.parse(offset)));
      int offsetToMs = int.parse(offset) * 3600000;
      print(offsetToMs);
      // datetime = datetime + offsetToMs;
      print(datetime);
      var now = DateTime.fromMillisecondsSinceEpoch(datetime * 1000);
      // now.add(Duration(milliseconds: offsetToMs));

      print(now);


      // set the time property
      isDaytime = now.hour > 6 && now.hour < 18  ? true : false;
      time = DateFormat.jm().format(now);
      print(time);
    } catch(e){
        print('caught error: $e');
        time = 'could not get time data';
    }

  }

}

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
// instance.getTime();

