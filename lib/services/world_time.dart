import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String? location; // location name for the UI
  String? time; // the time in that location
  String? flag; // url to an asset flag icon
  String? url; // location url for API endpoint


  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{

    // make the request
    String timeUrlStr = 'http://worldtimeapi.org/api/timezone/$url';
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

    time = now.toString();

  }

}

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
// instance.getTime();

