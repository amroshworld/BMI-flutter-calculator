import 'package:flutter/material.dart';

class DownButton extends StatelessWidget {
  DownButton({@required this.onTap, @required this.buttonName});

  final Function onTap;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white70,
            ),
          ),
        ),
        width: double.infinity,
        height: 90,
        margin: EdgeInsets.only(top: 13),
        decoration: BoxDecoration(
          color: Color(0XFFD92344),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}