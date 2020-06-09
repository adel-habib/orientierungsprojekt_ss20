import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/InputScreens/NewDesignScreens/nBusBarsPage.dart';
import 'package:orientierungsprojektss20/subscription_pages/Page_indicator.dart';
import 'package:orientierungsprojektss20/subscription_pages/Plansmanager.dart';
import 'Priceplans.dart';
import 'dart:async';

class PricingPage extends StatefulWidget {
  static String id = 'PricingPage_id';

  @override
  _PricingPageState createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  int _actualPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_actualPage < 2) {
        _actualPage++;
      } else {
        _actualPage = 0;
      }
      _pageController.animateToPage(_actualPage,
          duration: Duration(milliseconds: 250), curve: Curves.elasticIn);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _actualPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                PageView.builder(
                  onPageChanged: _onPageChanged,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: planslist.length,
                  itemBuilder: (ctx, i) => Priceplan(i),
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for(int i=0; i<planslist.length; i++ )
                            if(i==_actualPage)
                              PageIndicator(true)
                          else
                            PageIndicator(false)
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: FlatButton(

              color: Color(0xff1A237E),
              onPressed: () =>Navigator.pushNamed(context, NBusBarsPage.id),
              child: Text('Buy now'),
            ),
          )
        ],
      ),
    );
  }
}
