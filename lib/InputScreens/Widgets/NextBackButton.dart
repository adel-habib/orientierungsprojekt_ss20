import 'package:flutter/material.dart';
class NextBackBotton extends StatelessWidget {
  NextBackBotton(this.icon, this.onPressed);
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.redAccent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.red)
      ),
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Icon(icon,size: 32,),
        ],
      ),
    );
  }
}