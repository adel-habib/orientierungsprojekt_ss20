import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/gWidgets/drawer.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:orientierungsprojektss20/ResultsScreens/ResultPage.dart';
import 'package:orientierungsprojektss20/gWidgets/ProgressIndicator.dart';
import 'package:orientierungsprojektss20/utilities/parameters.dart' as tCalculator;
class RdInputPage extends StatefulWidget {
  static String id='LastInputPage';

  @override
  _RdInputPageState createState() => _RdInputPageState();
}

class _RdInputPageState extends State<RdInputPage> {
  final _formKey = GlobalKey<FormState>();
  final _2formKey = GlobalKey<FormState>();

  bool check = true;
  int current=1000;
  int enteredTemp=65;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
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
          bottom: TabBar(
            tabs: [
              Tab(text: 'Calculate Temprature', icon: Icon(Icons.whatshot, ),),
              Tab(text: 'Calculate Current',icon: Icon(Icons.offline_bolt,),),
            ],
          ),
        ),
        body: TabBarView(
      children: [
        //here Give current and get temp
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 40,),
              Center(child: Container(
                color: kInactiveCardColour,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('Current', style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
              ),),
              Center(child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    initialValue: '1000',
                    keyboardType: TextInputType.number,
                    inputFormatters:[
                      LengthLimitingTextInputFormatter(5),WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 18),
                      helperStyle: TextStyle(fontSize: 15, color: Colors.white),
                      labelStyle: TextStyle(fontSize: 20,),
                      suffixStyle: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 20),
                      suffixText: 'A',
                      labelText: 'The Current in A',
                      helperText: '0... 10000 A',
                    ),
                    onSaved: (value) => setState(()=>
                    current=int.parse(value)),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (checkCurrent(value)) {
                        return 'Invalid Current Value';
                      }
                      return null;
                    },
                  ),
                ),
              ),),
              SizedBox(height: 150,),
              ProgressIdicator(currentStep: 9,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text('Back'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    color: kInactiveCardColour,
                  ),
                  FlatButton(
                    child: Text('Next'),
                    onPressed: (){
                      _formKey.currentState.validate();
                      _formKey.currentState.save();
                      if(!checkCurrent(current.toString()))
                        {
                          // Navigate only if the value of the current is valid
                          print('The current is: $current');
                          tCalculator.parameters.setCurrent(current: current);
                          //Here Implement the Calculations
                          tCalculator.parameters.performThermalCalculations();


                          Navigator.pushNamed(context, ResultsPage.id);
                        }

                      else
                        current=current;

                    },
                    color: kInactiveCardColour,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
        //here give Temp and get current
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40,),
                Center(child: Container(
                  color: kInactiveCardColour,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text('Temperature', style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                ),),
                Center(child: Form(
                  key: _2formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: TextFormField(
                      initialValue: '65',
                      keyboardType: TextInputType.number,
                      inputFormatters:[
                        LengthLimitingTextInputFormatter(3)
                      ],
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 18),
                        helperStyle: TextStyle(fontSize: 15, color: Colors.white),
                        labelStyle: TextStyle(fontSize: 20,),
                        suffixStyle: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 20),
                        suffixText: '°C',
                        labelText: 'The Temperature in °C',
                        helperText: '-10... 120 °C',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (checkTemp(value)) {
                          return 'Invalid Temperature Value';
                        }
                        return null;
                      },
                      onSaved: (value) => setState(()=>
                      enteredTemp=int.parse(value)),
                    ),
                  ),
                ),),
                SizedBox(height: 150,),
                ProgressIdicator(currentStep: 9,),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Back'),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      color: kInactiveCardColour,
                    ),
                    FlatButton(
                      child: Text('Next'),
                      //here we should perform the calculations
                      onPressed: (){
                        _2formKey.currentState.validate();
                        _2formKey.currentState.save();

                        if(!checkTemp(enteredTemp.toString())) //we chick here if the current input is valid
                          {

                            //Here Implement the Calculations
                          tCalculator.parameters.performCurrentCalculations();
                          // display the calculations
                            Navigator.pushNamed(context, ResultsPage.id,);
                          }
                        else
                          enteredTemp=enteredTemp;

                      },
                      color: kInactiveCardColour,
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ],
    ),


      ),
    );
  }
  bool checkCurrent(String val){
    if(val.isEmpty||int.parse(val)>10000||int.parse(val)<=0)
      return true;
    else
      return false;
  }
  bool checkTemp(String val){
    if(val.isEmpty||int.parse(val)>120||int.parse(val)<=-10)
      return true;
    else
      return false;
  }

}
