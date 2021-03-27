import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _height = 0;
  double _weight = 0;
  double _bmi = 0;

  void _updateHeight(String height) {
    int intHeight = int.parse(height);
    setState(() {
      _height = intHeight;
    });
  }

  void _updateWeight(String weight) {
    double doubleWeight = double.parse(weight);
    setState(() {
      _weight = doubleWeight;
    });
  }

  void calculateBMI() {
    double heightInMeter = _height / 100;
    double bmi = _weight / (heightInMeter * heightInMeter);
    setState(() {
      _bmi = bmi;
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
              decoration: new InputDecoration(hintText: "Height (cm)")),
          TextField(
            onChanged: _updateWeight,
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(hintText: "Weight (kg)"),
          ),
          Text(
            'BMI: $_bmi',
          ),
          TextButton(onPressed: calculateBMI, child: Text('Calculate'))
        ],
      ),
    );
  }
}
