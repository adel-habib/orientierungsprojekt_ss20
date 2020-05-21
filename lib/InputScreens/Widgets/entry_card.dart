import 'package:flutter/material.dart';
class EntryCard extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final Widget cardChild;
  EntryCard({this.color, this.onPressed, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),
        color: color),
        child: cardChild,
      ),
    );
  }
}
