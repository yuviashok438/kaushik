import 'package:flutter/material.dart';
import 'package:helloworld/services/world_time.dart';

class ChangeLocation extends StatefulWidget {
  ChangeLocation({Key? key}) : super(key: key);

  @override
  _ChangeLocationState createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag:
            'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/uk.png'),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag:
            'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/greece.png'),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag:
            'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/egypt.png'),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag:
            'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/kenya.png'),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag:
            'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/usa.png'),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag:
            'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/usa.png'),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag:
            'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/south_korea.png'),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag:
            'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/indonesia.png'),
  ];

  void upDateTime(Index) async {
    WorldTime instance = locations[Index];
    await instance.getData();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDateTime': instance.isDateTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change location '),
          centerTitle: true,
          backgroundColor: Colors.blue[500],
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      upDateTime(Index) {}
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            }));
  }
}
