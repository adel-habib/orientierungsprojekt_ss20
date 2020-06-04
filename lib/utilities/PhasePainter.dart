import 'dart:math';
import 'package:flutter/material.dart';
class PhasePainter extends CustomPainter{
  final int n;
  PhasePainter(this.n);

  @override void paint(Canvas canvas, Size size){
    final midY = size.height/2;
    final paint = Paint()..style = PaintingStyle.stroke
      ..color = Colors.tealAccent
      ..strokeWidth = 3;

    //XY Coordinates
    paint.color=Colors.white30;
    canvas.drawLine(Offset(0,midY), Offset(size.width,midY), paint);
    canvas.drawLine(Offset(size.width/2,midY-100), Offset(size.width/2,midY+100), paint);

    // Cos/Sin waves

    paint.color=Colors.tealAccent;
    paint.strokeWidth=4;
    var ptt = Offset(0,(midY+cos(pi)*100));
    for(double i=0;i<size.width;i+=0.1){
      final nptt = Offset(i,midY-cos(i/36)*(100));
      canvas.drawLine(ptt, nptt, paint);
      ptt = nptt;
    }

    if(n>2){
      paint.color=Colors.cyan;
      paint.strokeWidth=4;
      var pttt = Offset(0,(midY-cos(pi)*100));
      for(double i=0;i<size.width;i+=0.1){
        final npttt = Offset(i,midY-cos(i/36)*(-100));
        canvas.drawLine(pttt, npttt, paint);
        pttt = npttt;
      }

    }
    if(n>2){
      paint.color=Colors.cyan;
      paint.strokeWidth=4;
      var pttt = Offset(0,(midY-cos(pi/3*2)*100));
      for(double i=0;i<size.width;i+=0.1){
        final npttt = Offset(i,midY-cos(i/36+size.width/36*120/540)*(100));
        canvas.drawLine(pttt, npttt, paint);
        pttt = npttt;
      }
      paint.color=Colors.deepOrange;
      var pt = Offset(0,(midY-cos(pi/3*2)*100));
      for(double i=0;i<size.width;i+=0.1){
        final npt = Offset(i,midY-cos(i/36+2*size.width/36*120/540)*100);
        canvas.drawLine(pt, npt, paint);
        pt = npt;
      }

    }

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
