import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI計算',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'BMI計算'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double height = 170;
  double weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Your Height is ',
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: "$height",
                    onChanged: (m) {
                      try {
                        height = double.parse(m);

                        setState(() {

                        });
                      } catch (exception) {
                        height = null;
                      }
                    },
                  ),
                ),
                Text(
                  " cm."
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Your Weight is ',
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: "$weight",
                    onChanged: (m) {
                      try {
                        weight = double.parse(m);

                        setState(() {

                        });
                      } catch (exception) {
                        weight = null;
                      }
                    },
                  ),
                ),
                Text(
                    " kg."
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Your BMI is "
                    ),
                    Text(
                        calcBMI(height, weight),
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

String calcBMI(double height, double weight) {
  if(height == null || weight == null) {
    return "InValid";
  }
  else {
    double bmi = weight / pow(height / 100, 2);

    return bmi.toStringAsFixed(2);
  }
}