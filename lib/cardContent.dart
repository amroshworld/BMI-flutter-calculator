import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  CardContent({ this.name ,this.icon});
  final String name  ;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon , size: 60,color: Colors.white,),
        Text(name ,style: GoogleFonts.pacifico(color: Colors.blueGrey,fontSize: 20)
          ,)
      ],
    );
  }
}