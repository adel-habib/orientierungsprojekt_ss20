
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utilities/constants.dart';
import 'regesterPage.dart';
import '../gWidgets/Mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../InputScreens/OldDesign/stInputPage.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
class LoginPage extends StatefulWidget {
  static String id ='Login_screen_id';
  @override
  _LoginPage createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  final email_controller = TextEditingController();
  final passwoed_controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: Drawer(),
      //key: this.scaffoldKey,
      appBar: myAppBar(),
      body: new Container(
          padding: new EdgeInsets.all(20.0),

          child: new Form(
            child: new ListView(
              children: <Widget>[
                 Container(
                    padding: new EdgeInsets.all(20.0),
                    child:new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(kHtwLogoIcon, width: 150, color: Colors.white,
                        ),
                      ],
                    )
                ),
                 Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                      controller: email_controller,
                        keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                        decoration: new InputDecoration(
                            hintText: 'you@example.com',
                            labelText: 'E-mail Address',
                            icon: new Icon(Icons.email, color: Colors.white,)),
                        onSaved: (String value) {
                        }

                    )
                ),
                 Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child:  new TextFormField(
                    controller: passwoed_controller,
                      obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(
                          hintText: 'Password',
                          labelText: 'Enter your password',
                          icon: new Icon(Icons.lock, color: Colors.white,)

                      ),
                      onSaved: (String value) {
                      }
                  ),
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Container(
                         height:50.0,
                         width: 210.0,
                         margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
                         child:  RaisedButton(child: Text('Login'), onPressed: logIn, color: Color(0xff1A237E),)
                     ),
                   ],
                 ),

                Row(
                  children: <Widget>[
                    Text(' Don\'t have an account? ', style: TextStyle(color: Colors.grey),),
                    InkWell(
                      onTap: ()=> Navigator.pushNamed(context, RegistrationScreen.id),
                        child: Text('Regestir', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
                  ],
                )

              ],
            ),
          )
      ),
    );
  }
  void goToRegester(){
    Navigator.pushNamed(context, RegistrationScreen.id);
  }

    void logIn() async {
      _email=email_controller.text;
      _password=passwoed_controller.text;
      try{
        final user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
        if(user!=null){

          Navigator.pushNamed(context, StInputPage.id);
        }
      }
      catch(e){
        print(e);
      }

    }

}




