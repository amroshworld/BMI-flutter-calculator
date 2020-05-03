import 'package:flutter/material.dart';

class SmallBox extends StatelessWidget {
  SmallBox({@required this.colour, this.cardWidget, this.updateSelector});

  final Color colour;
  final Widget cardWidget;
  final Function updateSelector;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: updateSelector,
        child: Container(
          child: cardWidget,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: colour,
          ),
        ),
      ),
    );
  }
}
