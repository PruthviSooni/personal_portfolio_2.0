import 'package:flutter/material.dart';
import 'package:portfolio/homePage.dart';
import 'package:portfolio/provider/app.provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MaterialApp(
        title: 'Personal Portfolio',
        theme: ThemeData(),
        home: HomePage(),
      ),
    );
  }
}
