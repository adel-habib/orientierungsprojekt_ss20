import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
class PlankOrPainted extends StatefulWidget {
  @override
  _PlankOrPaintedState createState() => _PlankOrPaintedState();
}

class _PlankOrPaintedState extends State<PlankOrPainted> {
  int _value = 1;

  List<String> myChoices=['Painted','blank'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List<Widget>.generate(
        2,
            (int index) {
          return ChoiceChip(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

            selectedColor: kActiveSwitchColor,
            labelStyle: TextStyle(fontSize: 19),
            label: Text(myChoices[index]),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
              print(_value);
              print(index);
            },
          );
        },
      ).toList(),
    );
  }
}