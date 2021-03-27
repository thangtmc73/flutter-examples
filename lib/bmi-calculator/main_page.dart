import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _height = 0;
  int _weight = 0;

  void _updateHeight(String height) {
    int intHeight = int.parse(height);
    setState(() {
      _height = intHeight;
    });
  }

  void _updateWeight(String weight) {
    int intWeight = int.parse(weight);
    setState(() {
      _weight = intWeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            onChanged: _updateHeight,
            keyboardType: TextInputType.number,
          ),
          TextField(
            onChanged: _updateWeight,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
