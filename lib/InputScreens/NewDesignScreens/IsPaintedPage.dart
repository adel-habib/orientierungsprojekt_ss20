import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/InputScreens/NewDesignScreens/frequencyPage.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
import 'package:orientierungsprojektss20/utilities/CustomDrawer.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
import '../Widgets/entry_card.dart';
import '../Widgets/BackgroundCard.dart';
import 'package:orientierungsprojektss20/gWidgets/ProgressIndicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orientierungsprojektss20/utilities/parameters.dart' as globals;
import 'package:orientierungsprojektss20/gWidgets/drawer.dart';

class IsPaintedPage extends StatefulWidget {
  static String id = 'IPid';
  @override
  _IsPaintedPageState createState() => _IsPaintedPageState();
}

class _IsPaintedPageState extends State<IsPaintedPage> {
  final cDrawer = CustomDrawer();
  bool busbarOverlay=false;
  int _value = 1;
  List<String> myChoices = ['Painted', 'Blank'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: myAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: EntryCard(
              cardChild: Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                        child: Container(
                      color: kInactiveCardColour,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Surface',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: BackGroundCard(
                        cardChild: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'The Busbar is',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Wrap(
                                    spacing: 10,
                                    children: List<Widget>.generate(
                                      2,
                                      (int index) {
                                        return ChoiceChip(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          selectedColor: kActiveSwitchColor,
                                          labelStyle: TextStyle(fontSize: 19),
                                          label: Text(myChoices[index]),
                                          selected: _value == index,
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _value = selected ? index : null;
                                              _value == 0
                                                  ? busbarOverlay = true
                                                  : busbarOverlay = false;
                                              globals.barOverlay =
                                                  busbarOverlay;
                                              busbarOverlay
                                                  ? print(
                                                      'The Busbars are painted')
                                                  : print(
                                                      'The Busbars are blank');
                                            });
                                          },
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          SvgPicture.asset(
                            cDrawer.displayBusBarsWithArgument(
                                globals.numberOfBars),
                            height: 140,
                            color: barColor(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    ProgressIdicator(
                      currentStep: 4,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          child: Text('Back'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: kInactiveCardColour,
                        ),
                        FlatButton(
                          child: Text('Next'),
                          onPressed: () {
                            Navigator.pushNamed(context, FrequencyPage.id);
                          },
                          color: kInactiveCardColour,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color barColor() {
    if(!busbarOverlay){
      return globals.selectedMaterial==MaterialCA.copper?kCopperColor:kAluColor;
    }
    if(busbarOverlay){
      return Colors.grey;
    }
  }
}
