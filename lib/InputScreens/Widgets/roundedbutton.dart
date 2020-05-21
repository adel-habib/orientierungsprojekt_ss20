import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton({this.icon, @required this.onPress, this.onLongPress});
  final IconData icon;
  final Function onPress;
  final Function onLongPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      child: Icon(icon, color: Colors.black, ),
      onPressed: onPress,
      onLongPress: onLongPress,
      constraints: BoxConstraints.tightFor(
          height: 44,
          width: 44
      ),
      shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
    );
  }
}