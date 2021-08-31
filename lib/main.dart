import 'package:flutter/material.dart';
import 'package:fbr/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'fbr',
        appBarTheme: AppBarTheme(
          color: Color(0xFF25445b),
          elevation: 0,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
            
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Shop For FBR',
      home: home(),
    );
  }
}
