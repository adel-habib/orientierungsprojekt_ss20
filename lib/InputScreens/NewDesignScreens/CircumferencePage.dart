import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/InputScreens/NewDesignScreens/AmbientTemperaturePage.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
import '../Widgets/entry_card.dart';
import 'package:flutter/services.dart';
import 'package:orientierungsprojektss20/gWidgets/ProgressIndicator.dart';
import 'package:orientierungsprojektss20/utilities/parameters.dart' as globals;
import 'package:orientierungsprojektss20/gWidgets/drawer.dart';

class EnclosurePerimeterPage extends StatefulWidget {
  static String id = 'Enclosureparemeterid';
  @override
  _EnclosurePerimeterPageState createState() => _EnclosurePerimeterPageState();
}

class _EnclosurePerimeterPageState extends State<EnclosurePerimeterPage> {
  final enclosurePerimeterController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double enclosurePerimeter = 1;
  bool validateHeight(String val) {return !(val.isEmpty || double.parse(val) < 0.5 || double.parse(val) > 10);}

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    enclosurePerimeterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: myAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: EntryCard(
              cardChild: Padding(
                padding: EdgeInsets.only(top:15, right: 15, left:15, bottom: 1),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:20, right: 20, bottom: 15, top: 10),
                        child: Center(
                            child: Container(
                              color: kInactiveCardColour,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Perimeter of Enclosure',
                                  style: TextStyle(color: Colors.white, fontSize: 25),
                                ),
                              ),
                            )),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: _formKey,
                        autovalidate: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child:  Padding(
                                padding: const EdgeInsets.all(25),
                                child: TextFormField(
                                  controller: enclosurePerimeterController,
                                  autovalidate: false,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(fontSize: 18),
                                    helperStyle: TextStyle(fontSize: 15, color: Colors.white),
                                    labelStyle: TextStyle(fontSize: 20,),
                                    suffixStyle: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 20),
                                    labelText: 'Perimeter Of Enclosure',
                                    suffixText: 'm',
                                    helperText: '0.5... 10 m',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    // Allowing the user to only input max 3 digits
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  validator: (value) {
                                    if (!validateHeight(value))
                                      return 'Invalid Perimeter';
                                  },
                                  onSaved: (value) => setState(() =>
                                  validateHeight(value)
                                      ? enclosurePerimeter = double.parse(value)
                                      : value = value),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 241,),
                      ProgressIdicator(currentStep: 7,),
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

                              _formKey.currentState.validate();
                              _formKey.currentState.save();
                              print('The Perimeter of the enclosire is: $enclosurePerimeter');
                              if (validateHeight(enclosurePerimeterController.text))  {
                                globals.enclosurePerimeter=enclosurePerimeter.round();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AmbientTemperaturePage()),
                                );
                              }
                            },
                            color: kInactiveCardColour,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
