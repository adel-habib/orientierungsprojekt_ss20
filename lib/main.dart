import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/InputScreens/NewDesignScreens/Enclosure.dart';
import 'package:orientierungsprojektss20/InputScreens/NewDesignScreens/sMaterialPage.dart';
import 'package:orientierungsprojektss20/subscription_pages/PricingPage.dart';
import 'landing_page.dart';
import 'LoginScreens/regesterPage.dart';
import 'LoginScreens/login_screen.dart';
import 'subscription_pages/PricingPage.dart';
import 'InputScreens/OldDesign/stInputPage.dart';
import 'InputScreens/OldDesign/ndInputPage.dart';
import 'InputScreens/NewDesignScreens/LastInputPage.dart';
import 'ResultsScreens/ResultPage.dart';
import 'ResultsScreens/ResultsPreview.dart';
import 'InputScreens/NewDesignScreens/frequencyPage.dart';
import 'InputScreens/NewDesignScreens/nBusBarsPage.dart';
import 'InputScreens/NewDesignScreens/WidthHeightPage.dart';
import 'InputScreens/NewDesignScreens/NPhaseSystem.dart';
import 'InputScreens/NewDesignScreens/IsPaintedPage.dart';
import 'InputScreens/NewDesignScreens/Enclosure.dart';
import 'InputScreens/NewDesignScreens/CircumferencePage.dart';
import 'InputScreens/NewDesignScreens/AmbientTemperaturePage.dart';
import 'DummyScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor:Color(0xff121530),
        scaffoldBackgroundColor: Color(0xff090F31), // Choose the background color Color(0xffHEX)

      ),
      initialRoute: LandingPage.id,
      routes: {
        PricingPage.id: (context) => PricingPage(),
        LandingPage.id: (context) => LandingPage(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginPage.id : (context) => LoginPage(),
        StInputPage.id: (context) => StInputPage(),
        NdInputPage.id: (context) => NdInputPage(),
        RdInputPage.id: (context)=> RdInputPage(),
        ResultsPage.id: (context)=> ResultsPage(),
        PdfPreview.id: (context)=>PdfPreview(),
        FrequencyPage.id: (context)=>FrequencyPage(),
        NBusBarsPage.id: (context)=>NBusBarsPage(),
        NPhasePage.id:(context)=>NPhasePage(),
        SMaterialPage.id: (context)=>SMaterialPage(),
        WidthHeightPage.id: (context)=>WidthHeightPage(),
        IsPaintedPage.id: (context)=>IsPaintedPage(),
        EnclosurePage.id: (context)=>EnclosurePage(),
        EnclosurePerimeterPage.id:(context)=>EnclosurePerimeterPage(),
        AmbientTemperaturePage.id:(context)=>AmbientTemperaturePage(),

      },
    );
  }
}

