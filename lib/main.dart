import 'package:flutter/material.dart';
import 'package:helloworld/pages/home.dart';
import 'package:helloworld/pages/loading.dart';
import 'package:helloworld/pages/change_location.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChangeLocation(),
      },
    ));
