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
  bool _submitted = false;

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
      _submitted = true;
      _bmi = bmi;
    });
  }

  void resetBMICalculator() {
    setState(() {
      _submitted = false;
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
            decoration: new InputDecoration(hintText: "Height (cm)"),
            enabled: !_submitted,
          ),
          TextField(
            onChanged: _updateWeight,
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(hintText: "Weight (kg)"),
            enabled: !_submitted,
          ),
          if (_submitted)
            Text(
              'BMI: ${_bmi.toStringAsFixed(2)}',
            ),
          if (_submitted)
            Text(
              'Result: ${getBMIResult(_bmi)}',
            ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton(
                onPressed: _submitted ? null : calculateBMI,
                child: Text("Calculate")),
            TextButton(
                onPressed: _submitted ? resetBMICalculator : null,
                child: Text("Reset")),
          ])
        ],
      ),
    );
  }
}

String getBMIResult(double bmi) {
  if (bmi < 16) {
    return "Severe Thinness";
  }
  if (bmi < 17) {
    return "Moderate Thinness";
  }
  if (bmi < 18.5) {
    return "Mild Thinness";
  }
  if (bmi < 25) {
    return "Normal";
  }
  if (bmi < 30) {
    return "Overweight";
  }
  if (bmi < 35) {
    return "Obese Class I";
  }
  if (bmi < 40) {
    return "Obese Class II";
  }
  return "Obese Class III";
}
