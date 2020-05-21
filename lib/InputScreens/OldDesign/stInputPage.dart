import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orientierungsprojektss20/InputScreens/OldDesign/ndInputPage.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
import 'package:orientierungsprojektss20/subscription_pages/PricingPage.dart';
import '../Widgets/roundedbutton.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
import '../Widgets/entry_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:orientierungsprojektss20/utilities/CustomDrawer.dart';
import 'package:orientierungsprojektss20/utilities/auth.dart';
import 'package:orientierungsprojektss20/utilities/PhasePainter.dart';
class StInputPage extends StatefulWidget {
  static String id = 'Input Page';
  StInputPage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _StInputPageState createState() => _StInputPageState();
}

class _StInputPageState extends State<StInputPage> {
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final cDrawer = CustomDrawer();

  int width = 10;
  int height = 100;

  bool validateHeight(String val) {return !(val.isEmpty || int.parse(val) < 10 || int.parse(val) > 200);}
  bool validateWidth(String val) {return !(val.isEmpty || int.parse(val) < 5 || int.parse(val) > 15);}

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    heightController.dispose();
    widthController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(


        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),

              child: Icon(Icons.monetization_on, size: 40,),
            ),
            ListTile(
              onTap: (){},
              title: Text('My Account '),
              leading: Icon(Icons.account_box),
            ),
            ListTile(
              title: Text('Upgrade to premium'),
              leading: Icon(Icons.shop),
              onTap: (){
                Navigator.pushNamed(context, PricingPage.id);
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings_applications),
              onTap: (){},
            ),
            ListTile(
              onTap: (){},
              title: Text('Sign out'),
              leading: Icon(Icons.exit_to_app),
            )
          ],
        ),
      ),
      appBar: myAppBar(),
      body: SingleChildScrollView(
        //to make sure there is no overflow
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: EntryCard(
                      color: kInactiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Busbars',
                            style: kLabelTextStyle,
                          ),
                          SvgPicture.asset(
                            cDrawer
                                .displayBusBars(), // The address of the SVG icon stored in String
                            height: 80,
                            color: cDrawer.getSelectedMaterial() ==
                                    MaterialCA.copper
                                ? kCopperColor
                                : kAluColor,
                          ),
                          Text(
                            cDrawer.getNumberOfBusBars().toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedButton(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    cDrawer.increaseBusBars();
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
                                    cDrawer.decreaseBusBars();
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: EntryCard(
                        color: kInactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Phase System', style: kLabelTextStyle),
                           CustomPaint(
                             painter: PhasePainter(cDrawer.getNumberOfPhase()),
                           ),
                            Text(cDrawer.getNumberOfPhase().toString(),
                                style: kNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedButton(
                                  icon: Icons.add,
                                  onPress: () {
                                    setState(() {
                                      cDrawer.increasePhase();
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
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: EntryCard(
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                            'Copper',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SvgPicture.asset(
                            kCopperIcon,
                            width: 80,
                            color: kCopperColor,
                          )
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          cDrawer.selectCopper();
                        });
                      },
                      color: cDrawer.getSelectedMaterial() == MaterialCA.copper
                          ? kActiveCardColour
                          : kInactiveCardColour,
                    ),
                  ),
                  Expanded(
                    child: EntryCard(
                      cardChild: Column(
                        children: <Widget>[
                          Text(
                            'Aluminum',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SvgPicture.asset(
                            kCopperIcon,
                            width: 80,
                            color: kAluColor,
                          )
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          cDrawer.selectAluminum();
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                            child: TextFormField(
                              controller: heightController,
                              autovalidate: false,
                              decoration: InputDecoration(
                                labelText: 'Height of the Busbar',
                                helperText: 'min: 10 cm  -  max: 200 cm',
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                // Allowing the user to only input max 3 digits
                                LengthLimitingTextInputFormatter(3),
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              validator: (value) {
                                if (!validateHeight(value))
                                  return 'Invalid Height';
                              },
                              onSaved: (value) => setState(() =>
                                  validateHeight(value)
                                      ? height = int.parse(value)
                                      : value = value),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: widthController,
                              autovalidate: false,
                              decoration: InputDecoration(
                                labelText: 'Width of the Busbar',
                                helperText: 'min: 5 cm -  max: 15 cm',
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2),
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              validator: (value) {
                                if (!validateWidth(value))
                                  return 'Invalid Width';
                              },
                              onSaved: (value) => setState(() =>
                                  validateWidth(value)
                                      ? width = int.parse(value)
                                      : value = value),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      color: Colors.redAccent,
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        _formKey.currentState.validate();
                        _formKey.currentState.save();
                        print(height);
                        print(width);
                        print(heightController.text);
                        print(widthController.text);
                        if (validateHeight(heightController.text) &&
                            validateWidth(widthController.text)) {
                          Navigator.pushNamed(context, NdInputPage.id);
                        }
                      },
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

// ignore: missing_return
