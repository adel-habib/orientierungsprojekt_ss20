import 'package:flutter/material.dart';
class PageIndicator extends StatelessWidget {
  bool isActualPage;
  PageIndicator(this.isActualPage);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActualPage ? 12:8,
      width: isActualPage ? 12:8,
      decoration: BoxDecoration(
        color: isActualPage? Color(0xff5c6bc0):Color(0xffc5cae9),
          borderRadius: BorderRadius.all(Radius.circular(12),),),
    );
  }
}
