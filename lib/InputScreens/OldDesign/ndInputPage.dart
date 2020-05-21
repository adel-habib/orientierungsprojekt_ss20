import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
import 'package:orientierungsprojektss20/subscription_pages/PricingPage.dart';
import 'package:orientierungsprojektss20/InputScreens/NewDesignScreens/LastInputPage.dart';
import '../Widgets/BlankPaintedChips.dart';
import '../Widgets/FilterChips.dart';
import '../Widgets/BackgroundCard.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';

class NdInputPage extends StatefulWidget {
  static String id = 'SecondInputPage';

  @override
  _NdInputPageState createState() => _NdInputPageState();
}

class _NdInputPageState extends State<NdInputPage> {
  int freq = 100;
  int ambientTemp = 20;

  bool toggled = false;
  bool enclosure=false;
  bool insideOverlay=false;
  bool outsideOverlay=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child: ListView(
          children: <Widget>[
            DrawerHeader(

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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              BackGroundCard(

                cardChild: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'The Busbar is',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Center(
                      child: PlankOrPainted(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              BackGroundCard(
                cardChild: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          'What is the frequency?',
                          style: kLabelTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          freq.toString(),
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'HZ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                        thumbColor: Color(0xffeb1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                      ),
                      child: Slider(
                        value: freq.toDouble(),
                        min: minFreq.toDouble(),
                        max: maxFreq.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            freq = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: BackGroundCard(
                  cardChild: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Is the System Enclosed?: ',
                        style: kLabelTextStyle,
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: toggled ? kActiveSwitchColor : Color(0xffFF1744),
                        ),
                        child: Stack(
                          children: <Widget>[
                            AnimatedPositioned(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOut,
                              top: 3,
                              left: enclosure ? 30 : 0,
                              right: enclosure ? 0 : 30,
                              child: InkWell(
                                onTap: toggleAction,
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 200),
                                  transitionBuilder:
                                      (Widget child, Animation<double> animation) {
                                    return RotationTransition(
                                      child: child,
                                      turns: animation,
                                    );
                                  },
                                  child: enclosure
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                          key: UniqueKey(),
                                          size: 25,
                                        )
                                      : Icon(
                                          Icons.cancel,
                                          key: UniqueKey(),
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              toggled?Wrap(
                spacing: 5,
                children: <Widget>[
                  isPaintedInside,
                  isPaintedOutside,
                ],
              ):Container(),
              SizedBox(height: 10,),
              BackGroundCard(
                cardChild: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          'What is the ambient temprature?',
                          style: kLabelTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          ambientTemp.toString(),
                          style: TextStyle(
                            fontSize: 30,
                              color: sliderLabelColor(ambientTemp.toDouble())
                          ),
                        ),
                        Text(
                          '°C',
                          style: TextStyle(color: sliderLabelColor(ambientTemp.toDouble())),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                        thumbColor: Color(0xffeb1555),
                        activeTrackColor: sliderLabelColor(ambientTemp.toDouble()),
                        inactiveTrackColor: Colors.grey,
                      ),
                      child: Slider(
                        value: ambientTemp.toDouble(),
                        min: minAmbientTemp.toDouble(),
                        max: maxAmbientTemp.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            ambientTemp = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              RaisedButton(
                color: Colors.redAccent,
                child: Text('Next',style: TextStyle(fontSize: 20),),
                onPressed: (){
                  Navigator.pushNamed(context, RdInputPage.id);

                },
              )

            ],
          ),
        ),
      ),
    );
  }

  toggleAction() {
    setState(() {
      enclosure = !enclosure;
    });
  }
}



Color sliderLabelColor(double val){
  if(val<-4)
    return Color(0xff2962FF);
  if(val>=-4 && val<-2)
    return Color(0xff1E88E5);
  if(val>=-2&&val<2)
    return Color(0xff2094F3);
  if(val>=2&&val<=5)
    return Color(0xff41A4F5);


  if(val>5&&val<10)
    return Color(0xff00aeb4);
  if(val>=10&&val<15)
    return Color(0xff00c8cb);
  if(val>=15&&val<20)
    return Color(0xff71e0dd);


  if(val>=20&&val<25)
    return Color(0xffFFC100);
  if(val>=25&&val<30)
    return Color(0xffFFEE00);
  if(val>=30&&val<35)
    return Color(0xffFDF166);

  if(val>=35&&val<40)
    return Color(0xffFF8A65);
  if(val>=40&&val<45)
    return Color(0xffFF5722);
  else
    return Color(0xffE64A19);

}
