import 'package:flutter/material.dart';
class Mybutton extends StatelessWidget {
 final String label;
 Color text_color = Colors.white;
 Color button_color = Colors.blueAccent;
 final Function do_something;
 Mybutton({this.label, this.do_something, this.button_color, this.text_color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50.0,
      margin: const EdgeInsets.only(left: 10.0,top: 30.0),
      child: new RaisedButton(
        onPressed: do_something,
        child: new Text(
          label,
          style: new TextStyle(
              color: text_color
          ),
        ),
        color: button_color,
      ),

    );
  }
}