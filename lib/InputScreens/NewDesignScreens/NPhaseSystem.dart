import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
import 'package:orientierungsprojektss20/utilities/CustomDrawer.dart';
import '../Widgets/roundedbutton.dart';
import 'package:orientierungsprojektss20/gWidgets/ProgressIndicator.dart';
import 'sMaterialPage.dart';
import 'package:orientierungsprojektss20/utilities/PhasePainter.dart';
import 'package:orientierungsprojektss20/utilities/parameters.dart' as tCalculator;
import 'package:orientierungsprojektss20/gWidgets/drawer.dart';

class NPhasePage extends StatefulWidget {

  static String id = 'NPhasePageId';
  @override
  _NPhasePageState createState() => _NPhasePageState();

}

class _NPhasePageState extends State<NPhasePage> {
  final cDrawer = CustomDrawer();
  int phase=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: myAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:15.0, right: 15, left: 15, bottom: 5),
              child:  Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(color: kInactiveCardColour,child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text('Phase System', style: TextStyle(color: Colors.white, fontSize: 25)),
                    )),
                    SizedBox(height: 110,),
                    CustomPaint(
                      size: Size(340,100),
                      painter: PhasePainter(cDrawer.getNumberOfPhase(),
                      ),
                    ),
                    SizedBox(height: 70,),
                    Text(cDrawer.getNumberOfPhase().toString(),
                        style: kNumberTextStyle),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(top:10, left: 30, right: 30, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedButton(
                            icon: Icons.add,
                            onPress: () {
                              setState(() {
                                cDrawer.increasePhase();
                                phase=cDrawer.getNumberOfPhase();
                                print('The Phase is: $phase');
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundedButton(
                            icon: Icons.remove,
                            onPress: () {
                              setState(() {
                                cDrawer.decreasePhase();
                                phase=cDrawer.getNumberOfPhase();
                                print('The Phase is: $phase');
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    ProgressIdicator(currentStep: 1,),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          child: Text('Back'),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          color: kInactiveCardColour,
                        ),
                        FlatButton(
                          child: Text('Next'),
                          onPressed: (){
                            print('The Phase is: $phase');
                            tCalculator.parameters.setPhase(phase: phase);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SMaterialPage()),
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
