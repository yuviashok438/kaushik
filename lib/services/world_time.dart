import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time = 'null';
  String flag;
  String url;
  bool isDateTime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDateTime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = 'did not get the time ';
    }
    //print(offset);
    // print(data);
    // print(dateTime);
    // print(now);
  }
}
