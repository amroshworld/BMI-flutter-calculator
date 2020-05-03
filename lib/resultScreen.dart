import 'package:flutter/material.dart';
import 'downButton.dart';


class ResultScreen extends StatelessWidget {
  ResultScreen ({@required this.result});

  final String result;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                '    Your body mass index is :',
                style: TextStyle(
                  backgroundColor: Colors.red,
                  fontSize: 60,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  result
                ,
                  style: TextStyle(
                      fontSize: 90,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: DownButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonName: "Calculate new BMI"),
            )
          ],
        ),
      ),
    );
  }
}
