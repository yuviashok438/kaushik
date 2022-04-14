import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helloworld/services/world_time.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getWorldTime() async {
    WorldTime instance =
        WorldTime(flag: 'Berlin', location: 'London', url: 'Europe/london');

    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDateTime': instance.isDateTime,
    });
  }

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Center(
            child: SpinKitCircle(
          color: Colors.white,
          size: 100.0,
        )));
  }
}
