import 'package:flutter/material.dart';
import 'package:p4/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        title: 'Material App',
        home: HomePage());
  }
}
