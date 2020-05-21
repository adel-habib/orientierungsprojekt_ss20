import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orientierungsprojektss20/InputScreens/NewDesignScreens/WidthHeightPage.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
import 'package:orientierungsprojektss20/utilities/CustomDrawer.dart';
import '../Widgets/entry_card.dart';
import 'package:orientierungsprojektss20/gWidgets/ProgressIndicator.dart';
import 'package:orientierungsprojektss20/utilities/parameters.dart' as globals;
import 'dart:math';
import 'package:orientierungsprojektss20/gWidgets/drawer.dart';

class SMaterialPage extends StatefulWidget {
  static String id = 'id';
  @override
  _SMaterialPageState createState() => _SMaterialPageState();
}

class _SMaterialPageState extends State<SMaterialPage> {
  MaterialCA selectedMaterial=MaterialCA.copper;
  final cDrawer = CustomDrawer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: myAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(top:15, left:15, right: 15, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(child: Container(
                      color: kInactiveCardColour,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text('Material', style: TextStyle(color: Colors.white, fontSize: 25),),
                      ),
                    )),
                   SizedBox(height: 130,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[

                       Expanded(
                         child: EntryCard(
                           cardChild: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: <Widget>[
                                 Text('Copper', style: TextStyle(fontSize: 22),),
                                SizedBox(height: 30,),
                                Transform.rotate(angle: 90 * pi/180,
                                    child: SvgPicture.asset(
                                      cDrawer.displayBusBarsWithArgument(globals.numberOfBars),
                                      height: 100, color: kCopperColor,)
                                ),
                                SizedBox(height: 20,)
                                // Icon(Icons.view_week, size: 100, color: kCopperColor,)
                               ],
                             ),
                           ),
                           onPressed: () {
                             setState(() {
                               cDrawer.selectCopper();
                               selectedMaterial=cDrawer.getSelectedMaterial();
                               print('The Material is: $selectedMaterial');

                             });
                           },
                           color: cDrawer.getSelectedMaterial() == MaterialCA.copper
                               ? kActiveCardColour
                               : kInactiveCardColour,
                         ),
                       ),
                       Expanded(
                         child: EntryCard(
                           cardChild: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: <Widget>[
                                 Text('Aluminum', style: TextStyle(fontSize: 22),),
                                 SizedBox(height: 30,),
                                 Transform.rotate(angle: 90 * pi/180,
                                     child: SvgPicture.asset(
                                       cDrawer.displayBusBarsWithArgument(globals.numberOfBars), height: 100, color: kAluColor,)
                                 ),
                                 SizedBox(height: 20,)
                               ],
                             ),
                           ),
                           onPressed: () {

                             setState(() {
                               cDrawer.selectAluminum();
                               selectedMaterial=cDrawer.getSelectedMaterial();
                               globals.selectedMaterial=selectedMaterial;
                               print('The Material is: $selectedMaterial');

                             });
                           },
                           color:
                           cDrawer.getSelectedMaterial() == MaterialCA.aluminum
                               ? kActiveCardColour
                               : kInactiveCardColour,
                         ),
                       ),
                     ],
                   ),
                    SizedBox(height: 100,),
                    ProgressIdicator(currentStep: 2,),
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
                            print('The Material is: $selectedMaterial');
                            globals.selectedMaterial=selectedMaterial;
                            Navigator.pushNamed(context, WidthHeightPage.id);
                          },
                          color: kInactiveCardColour,
                        )
                      ],
                    )
                  ],
                ),
              ),

          )
        ],
      ),
    );
  }
}
