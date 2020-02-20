import 'package:flutter/material.dart';

import 'ui/homepage/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Events',
      debugShowCheckedModeBanner: false, // This is used to remove that debug label from top right
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFFFFFF),
        primaryColor: Color(0XFFFF4700),
      ),
      home: HomePage(),
      
    );
  }
}
