import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orientierungsprojektss20/utilities/auth.dart';
import 'package:orientierungsprojektss20/subscription_pages/PricingPage.dart';

Widget myAppBar() {
  return AppBar(
    title: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: SvgPicture.asset(
            kHtwLogoIcon,
            height: 17,
            color: Color(0xffFAA31B),
          ),
        ),
        Text(
          'Thermal Calculator',
          style: TextStyle(fontSize: 20),
        )
      ],
    ),
  );
}
