import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
class BackGroundCard extends StatelessWidget {
  final Widget cardChild;
  BackGroundCard({this.cardChild});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kInactiveCardColour,),
      child: cardChild,
    );
  }
}
