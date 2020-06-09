import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/InputScreens/NewDesignScreens/NPhaseSystem.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
import 'package:orientierungsprojektss20/utilities/CustomDrawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Widgets/roundedbutton.dart';
import 'package:orientierungsprojektss20/gWidgets/ProgressIndicator.dart';
import 'package:orientierungsprojektss20/utilities/parameters.dart' as tCalculator;
import 'package:orientierungsprojektss20/gWidgets/drawer.dart';



class NBusBarsPage extends StatefulWidget {
  static String id = 'nBusBarsPageId';
  @override
  _NBusBarsPageState createState() => _NBusBarsPageState();

}

class _NBusBarsPageState extends State<NBusBarsPage> {

  final cDrawer = CustomDrawer(); // an instance of our drawing class

  int numberOfBusBars=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: myAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:15,left: 15, right: 15, bottom: 2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: kInactiveCardColour,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Number of Busbars',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(height: 70,),

                    SvgPicture.asset(
                      cDrawer
                          .displayBusBars(), // The address of the SVG icon stored in String
                      height: 140,
                      color: cDrawer.getSelectedMaterial() ==
                          MaterialCA.copper
                          ? kCopperColor
                          : kAluColor,
                    ),
                    SizedBox(height: 60,),
                    Text(
                      cDrawer.getNumberOfBusBars().toString(),
                      style: kNumberTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedButton(
                            icon: Icons.add,
                            onLongPress: (){
                              setState(() {
                                cDrawer.longPressBusBar();
                                numberOfBusBars=cDrawer.getNumberOfBusBars();
                              });
                              print('The Number of Busbars is: $numberOfBusBars');
                            },
                            onPress: () {
                              setState(() {
                                cDrawer.increaseBusBars();
                                numberOfBusBars=cDrawer.getNumberOfBusBars();
                              });
                              print('The Number of Busbars is: $numberOfBusBars');
                            },
                          ),
                          SizedBox(width: 10,),
                          RoundedButton(
                            icon: Icons.remove,
                            onPress: () {
                              setState(()
                              {
                                cDrawer.decreaseBusBars();
                                numberOfBusBars=cDrawer.getNumberOfBusBars();
                              }
                              );
                              print('The Number of Busbars is: $numberOfBusBars');
                            },
                          ),
                        ],
                      ),
                    ),
                    ProgressIdicator(currentStep: 0,),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          child: Text('Back'),
                          onPressed: (){


                          },
                          color: kInactiveCardColour,
                        ),
                        FlatButton(
                          child: Text('Next'),
                          onPressed: (){
                            print('The Number of Busbars is: $numberOfBusBars');
                            tCalculator.parameters.setNumberOfBusBars(numberOfBusBars: numberOfBusBars);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NPhasePage()),
                            );
                          },
                          color: kInactiveCardColour,
                        )
                      ],
                    )
                  ],
                ),

            ),
          ),

        ],
      ),
    );
  }
}
