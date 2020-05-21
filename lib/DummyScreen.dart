//Todo: delete this page when you are done
import 'package:flutter/material.dart';
import 'dart:math';
class TryIt extends StatefulWidget {
  static String id='dummyId';
  @override
  _TryItState createState() => _TryItState();
}

class _TryItState extends State<TryIt> {
  int n=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: CustomPaint(
              size: Size(340, 250),
              painter: PhasePainter(n),
            ),
          ),
          RaisedButton(
            child: Text('+'),
            onPressed: (){
              setState(() {
                n++;
              });
            },
          ),
          RaisedButton(
            child: Text('+'),
            onPressed: (){
              setState(() {
                n--;
              });
            },
          )
        ],
      ),
    );
  }
}
class PhasePainter extends CustomPainter{
  final int n;
  PhasePainter(this.n);



  @override void paint(Canvas canvas, Size size){
    final midY = size.height/2;
    final paint = Paint()..style = PaintingStyle.stroke
      ..color = Colors.tealAccent
      ..strokeWidth = 3;
    paint.color=Colors.white30;
    canvas.drawLine(Offset(0,midY), Offset(size.width,midY), paint);
    canvas.drawLine(Offset(size.width/2,midY-100), Offset(size.width/2,midY+100), paint);
    paint.color=Colors.yellow;
    var pt = Offset(0,midY);
    for(double i=0;i<size.width;i+=0.1){
      final npt = Offset(i,midY-sin(i/36)*100);
      canvas.drawLine(pt, npt, paint);
      pt = npt;
    }




    if(n>1){
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
        paint.color=Colors.tealAccent;
        paint.strokeWidth=4;
        var ptt = Offset(0,(midY+cos(pi)*100));
        for(double i=0;i<size.width;i+=0.1){
          final nptt = Offset(i,midY-cos(i/36)*(100));
          canvas.drawLine(ptt, nptt, paint);
          ptt = nptt;
      }

    }




  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}