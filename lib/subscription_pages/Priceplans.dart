import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Plansmanager.dart';
class Priceplan extends StatelessWidget {
  final int index;
  Priceplan(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: Text(
            planslist[index].plan_type,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              planslist[index].price,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
            Text(planslist[index].period, style: TextStyle(color: Colors.white),)

          ],),
      ],
    );
  }
}
