
import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/InputScreens/NewDesignScreens/IsPaintedPage.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
import '../Widgets/entry_card.dart';
import 'package:orientierungsprojektss20/gWidgets/ProgressIndicator.dart';
import 'package:flutter/services.dart';
import 'package:orientierungsprojektss20/utilities/parameters.dart' as tCalculator;
import 'package:orientierungsprojektss20/gWidgets/drawer.dart';

class WidthHeightPage extends StatefulWidget {
  static String id = 'HWPid';
  @override
  _WidthHeightPageState createState() => _WidthHeightPageState();
}

class _WidthHeightPageState extends State<WidthHeightPage> {
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int width = 10;
  int height = 100;
  bool validateHeight(String val) {return !(val.isEmpty || int.parse(val) < 10 || int.parse(val) > 200);}
  bool validateWidth(String val) {return !(val.isEmpty || int.parse(val) < 5 || int.parse(val) > 15);}

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    heightController.dispose();
    widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: myAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              color: kInactiveCardColour,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text('Height and Width', style: TextStyle(color: Colors.white, fontSize: 25),),
              ),
            ),
          ),

          Expanded(
            child: Padding(
                padding: EdgeInsets.only(top:15.0, right: 15, left: 15, bottom: 5),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 25),
                        child: Form(
                          key: _formKey,
                          autovalidate: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 60, right: 60),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: heightController,
                                        autovalidate: false,
                                        decoration: InputDecoration(
                                          errorStyle: TextStyle(fontSize: 18),
                                          helperStyle: TextStyle(fontSize: 15, color: Colors.white),
                                          labelStyle: TextStyle(fontSize: 20,),
                                          suffixStyle: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 20),
                                          labelText: 'Height',
                                          suffixText: 'mm',
                                          helperText: '10... 200 mm',
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          // Allowing the user to only input max 3 digits
                                          LengthLimitingTextInputFormatter(3),
                                          WhitelistingTextInputFormatter.digitsOnly
                                        ],
                                        validator: (value) {
                                          if (!validateHeight(value))
                                            return 'Invalid Height, 10... 200 mm';
                                        },
                                        onSaved: (value) => setState(() =>
                                        validateHeight(value)
                                            ? height = int.parse(value)
                                            : value = value),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.only(left: 60, right: 60),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: widthController,
                                        autovalidate: false,
                                        decoration: InputDecoration(
                                          errorStyle: TextStyle(fontSize: 18),
                                          helperStyle: TextStyle(fontSize: 15, color: Colors.white),
                                          labelStyle: TextStyle(fontSize: 20,),
                                          suffixStyle: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 20),
                                          suffixText: 'mm',
                                          labelText: 'Width',
                                          helperText: '5... 15 mm',
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(2),
                                          WhitelistingTextInputFormatter.digitsOnly
                                        ],
                                        validator: (value) {
                                          if (!validateWidth(value))
                                            return 'Invalid Width, 5... 15 mm';
                                        },
                                        onSaved: (value) => setState(() =>
                                        validateWidth(value)
                                            ? width = int.parse(value)
                                            : value = value),
                                      ),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),

                      Center(

                        child: Padding(
                          padding: EdgeInsets.only(top:170.0,),
                          child: ProgressIdicator(currentStep: 3,),

                        ),
                      ),
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
                              if (validateHeight(heightController.text) &&
                                  validateWidth(widthController.text)) {
                                print('Height of the Busbar: $height cm');
                                print('Width of the Busbar: $width cm');
                                tCalculator.parameters.setHeight(height: height);
                                tCalculator.parameters.setWidth(width: width);
                                Navigator.pushNamed(context, IsPaintedPage.id);
                              }
                              else{
                                print('Invalid Input');
                              }
                            },
                            color: kInactiveCardColour,
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),

          )
        ],
      ),
    );
  }
}
