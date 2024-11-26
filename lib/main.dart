import 'package:country_ornek/country_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Main());
}
class Main extends StatefulWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountryPage(),
    );
  }
}