import 'package:orientierungsprojektss20/InputScreens/OldDesign/stInputPage.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Todo: Redesign the class using the flutter CustomPainter class to avoid using pictures
//  and for having a more low-level control over the visual representations
enum MaterialCA {copper, aluminum}

class CustomDrawer{
  MaterialCA _selected=MaterialCA.copper;


  int _nPhase=1;
  int _nBusBars=1;

  // Drawing the BusBars

  String displayBusBars(){
    if(_nBusBars==1)
      return k1BusBar;
    if(_nBusBars==2)
      return k2BusBar;
    if(_nBusBars==3)
      return k3BusBar;
    else
      return k4BusBar;
  }
  String displayBusBarsWithArgument(int n){
    if(n==1)
      return k1BusBar;
    if(n==2)
      return k2BusBar;
    if(n==3)
      return k3BusBar;
    else
      return k4BusBar;
  }

  void increaseBusBars (){
    if (_nBusBars<4)
      _nBusBars++;
  }
  void decreaseBusBars(){
    if(_nBusBars>1)
      _nBusBars--;
  }


  void selectCopper(){
    _selected=MaterialCA.copper;
  }
  void selectAluminum(){
    _selected=MaterialCA.aluminum;
  }
  MaterialCA getSelectedMaterial(){
    return _selected;
  }
  int getNumberOfBusBars(){
    return _nBusBars;
  }
  int getNumberOfPhase(){
    return _nPhase;
  }

  // Drawing the Phase System

  void increasePhase(){
    if(_nPhase<3)
      _nPhase++;
  }
  void decreasePhase(){
    if(_nPhase>1)
      _nPhase--;
  }




}