import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String location = data['location'];
    String flag = data['flag'];
    String time = data['time'];
    bool isDateTime = data['isDateTime'];

    String bgImage = data['isDateTime']
        ? 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-33/world_time_app/assets/day.png'
        : 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-33/world_time_app/assets/night.png';

    return Scaffold(
      appBar: AppBar(
        title: Text('World Time '),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage('$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    setState(() async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDateTime': result['isDateTime'],
                          'flag': result['flag'],
                        };
                      });
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Change location ')),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$location',
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '$time',
                style: TextStyle(fontSize: 66.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
