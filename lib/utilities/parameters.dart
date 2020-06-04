//todo: Create a new class 'calculations' and encapsulate the parameters inside of it.
//todo: Use the provider package in order to access and retrieve the values from the individual pages.
//todo: inside of your class 'calculations' manage the calculations.


import 'CustomDrawer.dart';
import 'dart:math' as math;




  class Parameters{

    // Parameters given by the user
    int  _numberOfBars;
    int _phase;
    MaterialCA _selectedMaterial;
    int _height;
    int _width;
    int _enclosurePerimeter;
    bool _barOverlay=false;
    double _frequency;
    bool _enclosure;
    bool _insideOverlay;
    bool _outsideOverlay;
    double _ambientTemp;
    int _current;


    // Parameters we calculate
    int _area;
    double _skinFaktor;
    double _alpha;
    double _surface;
    double _thermalResistanceOfBusBars;
    double _thermalResistanceOfEnclosure;
    double _totalThermalResistance;
    double _losses;
    double _temperatureRise;
    double _finalTemperature;


    // Setters to retrieve the values from user
    void setNOB({int numberOfBusBars}) => _numberOfBars=numberOfBusBars;

    void setPhase({int phase}) => _phase=phase;

    void setMaterial({MaterialCA selectedMaterial}) => _selectedMaterial=selectedMaterial;

    void setHeight({int height}) => _height=height;

    void setWidth({int width}) => _width=width;

    void setEnclosure({bool enclosure}) => _enclosure=enclosure;

    void setIOverlay({bool insideOverlay}) => _insideOverlay=insideOverlay;

    void setOOverlay({bool outsideOverlay}) => _outsideOverlay=outsideOverlay;

    void setEnclPerimeter({int enclosurePerimeter})=> _enclosurePerimeter=enclosurePerimeter;

    void setFrequency({double frequency})=>_frequency=frequency;

    void setBOverlay({bool busBarOverlay})=>_barOverlay=busBarOverlay;

    void setATemp({double ambientTemperature}) => _ambientTemp=ambientTemperature;

    void setCurrent({int current})=>_current=current;


    //getters
    int getNoB(){return _numberOfBars;}
    int getPhase(){return _phase;}
    int getHeight(){return _height;}
    int getWidth(){return _width;}
    MaterialCA getMaterial(){return _selectedMaterial;}
    int getEnclPerimeter(){return _enclosurePerimeter;}
    bool getBOverlay(){return _barOverlay;}
    bool getEnclosure(){return _enclosure;}
    bool getIOverlay(){return _insideOverlay;}
    bool getOOverlay(){return _outsideOverlay;}
    double getFrequency(){return _frequency;}
    double getAmbTemp(){return _ambientTemp;}
    double getFinalTemp(){return _finalTemperature;}
    int getCurrent(){return _current;}
    int getArea(){return _area;}
    double getSkinFactor(){return _skinFaktor;}
    double getAlpha(){return _alpha;}
    double getSurface(){return _surface;}
    double getLosses(){return _losses;}
    double getTemperatureRise(){return _temperatureRise;}
    double getThermalResistance(){return _thermalResistanceOfBusBars;}
    double getThermalResistanceEnclosure(){return _thermalResistanceOfEnclosure;}
    double getTotalThermalResistance(){return _totalThermalResistance;}
    double getFinalTemperature(){return _finalTemperature; }


    void _calculateArea()=>_area=_height*_width;

    void _calculateSkinFactor(){

      if(_selectedMaterial==MaterialCA.aluminum){
        // SF= F/50 * (kFront* (.....+1)-kEnd )
        // kFront and kEnd change according to n of busbars
        double kFront, kEnd;
        switch(_numberOfBars){
          case 1:{kFront=1; kEnd=0;}
          break;
          case 2:{kFront=2.0798; kEnd=1.0633;}
          break;
          case 3:{kFront=3.4727; kEnd=2.4094;}
          break;
          case 4:{kFront=4.8655; kEnd=3.763;}
          break;
        }
        _skinFaktor=_frequency/50*
            (
                kFront*
                    (
                        -4.9014*math.pow(10, -19)*math.pow(_area, 5)
                            +7.255*math.pow(10, -15)*math.pow(_area, 4)
                            -4.0765*math.pow(10, -11)*math.pow(_area, 3)
                            +9.639*math.pow(10, -8)*math.pow(_area, 2)
                            +1.4749*math.pow(10, -5)*_area
                            + 1
                    )
                    -kEnd
            );



      }
      else if(_selectedMaterial==MaterialCA.copper){
        // kFront and kEnd change according to n of busbars
        double kFront, kEnd;
        switch(_numberOfBars){
          case 1:{kFront=1; kEnd=0;}
          break;
          case 2:{kFront=1.9636; kEnd=0.9324;}
          break;
          case 3:{kFront=3.4768; kEnd=2.4193;}
          break;
          case 4:{kFront=4.4276; kEnd=3.2996;}
          break;
        }
        _skinFaktor=(_frequency/50*
            ((
                kFront*
                    (
                        -9.7104*math.pow(10, -19)*math.pow(_area, 5)
                            +1.2082*math.pow(10, -14)*math.pow(_area, 4)
                            -5.7278*math.pow(10, -11)*math.pow(_area, 3)
                            +1.1125*math.pow(10, -7)*math.pow(_area, 2)
                            +7.0861*math.pow(10, -5)*_area
                            + 1
                    )
                    -kEnd)-1)+1
        );



      }
    }

    void _calculateAlpha(){
      if(_selectedMaterial==MaterialCA.aluminum){
        if(_barOverlay==false){
          _area>=500?_alpha=7.34:_alpha=(-0.0145*_area)+14.603;
        }
        else if(_barOverlay==true){
          _area>=500?_alpha=11.34:_alpha=(-0.0166 * _area)+19.643;
        }

      }
      else if(_selectedMaterial==MaterialCA.copper){
        if(_barOverlay==false){
          _area>=500?_alpha=7.4:_alpha=(-0.0116*_area)+13.216;
        }
        else if(_barOverlay==true){
          _area>=500?_alpha=10.80:_alpha=(-0.013 * _area)+17.313;
        }
      }

    }

    void _calculateSurface(){
      double kFactor;
      if(_selectedMaterial==MaterialCA.aluminum){
        if(_barOverlay==true){
          switch(_numberOfBars){
            case 1: {kFactor=1;}
            break;
            case 2: {kFactor=0.58;}
            break;
            case 3: {kFactor=0.60;}
            break;
            case 4: {kFactor=0.36;}
            break;
          }
        }
        else if(_barOverlay==false){
          switch(_numberOfBars){
            case 1: {kFactor=1;}
            break;
            case 2: {kFactor=0.57;}
            break;
            case 3: {kFactor=0.42;}
            break;
            case 4: {kFactor=0.31;}
            break;
          }
        }

      }
      else if(_selectedMaterial==MaterialCA.copper){
        if(_barOverlay==true){
          switch(_numberOfBars){
            case 1: {kFactor=1;}
            break;
            case 2: {kFactor=0.59;}
            break;
            case 3: {kFactor=0.46;}
            break;
            case 4: {kFactor=0.43;}
            break;
          }
        }
        else if(_barOverlay==false){
          switch(_numberOfBars){
            case 1: {kFactor=1;}
            break;
            case 2: {kFactor=0.52;}
            break;
            case 3: {kFactor=0.41;}
            break;
            case 4: {kFactor=0.37;}
            break;
          }
        }
      }
      _surface=_numberOfBars*_phase*((2*_height*kFactor+2*_width)/1000);
    }

    void _calculateThermalResistanceOfBusBars(){
      _thermalResistanceOfBusBars=1/(_surface*_alpha);
    }

    void _calculateThermalResistanceOfEnclosure(){
      int xIn=1; int xOut=1;
      if(_enclosure==false){
        _thermalResistanceOfEnclosure=0;
      }
      else if(_enclosure==true){
        _insideOverlay?xIn=10:xIn=16;
        _outsideOverlay?xOut=10:xOut=16;
        _thermalResistanceOfEnclosure=(1/(xOut*_enclosurePerimeter))+(1/(xIn*_enclosurePerimeter));
      }
    }

    void _calculateTotalThermalResistance(){
      _totalThermalResistance=_thermalResistanceOfEnclosure+_thermalResistanceOfBusBars;
    }

    void _calculateLosses(){
      double kFac=1;
      if(_selectedMaterial==MaterialCA.aluminum){
        kFac=0.02874;
      }
      else if(_selectedMaterial==MaterialCA.copper){
        kFac=0.0174;
      }
      _losses=(((kFac*_phase)/_numberOfBars)/(_area*_skinFaktor*math.pow(_current, 2)));

    }

    void _calculateTemperatureRise(){
      _temperatureRise=_totalThermalResistance*_losses;
    }

    void _calculateFinalTemperature(){
      _finalTemperature=_ambientTemp+_temperatureRise;
    }

    void performThermalCalculations(){
      _calculateArea();
      _calculateSkinFactor();
      _calculateAlpha();
      _calculateSurface();
      _calculateThermalResistanceOfBusBars();
      _calculateThermalResistanceOfEnclosure();
      _calculateTotalThermalResistance();
      _calculateLosses();
      _calculateTemperatureRise();
      _calculateFinalTemperature();
    }
  }


  Parameters parameters = new Parameters();
