import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orientierungsprojektss20/InputScreens/NewDesignScreens/nBusBarsPage.dart';
import 'package:orientierungsprojektss20/InputScreens/OldDesign/stInputPage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:orientierungsprojektss20/LoginScreens/login_screen.dart';

import 'utilities/constants.dart'; // Save all the Constants we use in one file
class LandingPage extends StatelessWidget {
  static String id = 'landing_page_id';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(),
      body: InkWell(
        onTap: (){Navigator.pushNamed(context, NBusBarsPage.id);

        },
        child: Padding(// Padding is like margins
          padding: EdgeInsets.all(20), // Margins of 10 from all sides
          child: Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.end, // aligns the Column from bottom to top
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: TypewriterAnimatedTextKit(
                          totalRepeatCount: 1,
                          speed: Duration(milliseconds: 2000),
                            onTap: () {
                              print("Tap Event");
                            },
                            text: [
                              "Welcome!",

                            ],
                            textStyle: TextStyle(
                                fontSize: 40.0,
                                fontFamily: "Agne"
                            ),
                            textAlign: TextAlign.start,
                            alignment: AlignmentDirectional.topStart,
                          // or Alignment.topLeft
                        ),

                      ),
                    ),

                  ],
                ),
                SizedBox(height: 70,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        kFrauIcon, // The address of the SVG icon stored in String
                        height: 120,
                      ),
                      SvgPicture.asset(
                        kMannIcon, // The address of the SVG icon stored in String
                        height: 120,
                      ),
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    kwelcomeText,
                    style: kLabelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Touch The Screen To continue!'),
                ),


                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Hero(tag: 'logo',
                      child: SvgPicture.asset(kHtwLogoIcon, color: Colors.white,height: 45,)),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
