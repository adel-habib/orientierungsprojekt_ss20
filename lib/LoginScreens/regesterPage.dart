import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:orientierungsprojektss20/LoginScreens/login_screen.dart';
import 'package:orientierungsprojektss20/gWidgets/drawer.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'regester_page_id';
  @override
  _RegistrationScreenState createState(){
    return _RegistrationScreenState();
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;




  String _email;
  String _password;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MyDrawer(),
      appBar: myAppBar(),
      body:  Container(
          padding:  EdgeInsets.all(20.0),

          child: Form(

            child:  ListView(
              children: <Widget>[
                 Container(
                    padding:  EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Hero(tag: 'logo',
                            child: SvgPicture.asset(kHtwLogoIcon, width: 150,color: Colors.white,)),
                      ],
                    )
                ),

                 Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextField(

                      onChanged: (value) {
                        _email=value;
                      },
                      keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                        decoration: new InputDecoration(
                            hintText: 'you@example.com',
                            labelText: 'E-mail Address',
                            icon: new Icon(Icons.email, color: Colors.white,)),


                    )
                ),
                 Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child:  new TextField(
                    onChanged: (value){
                      _password=value;
                    },
                    obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(

                          hintText: 'Password',
                          labelText: 'Enter your password',
                          icon: new Icon(Icons.lock, color: Colors.white,)
                      ),

                  ),
                ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Container(
                      height:50.0,
                      width: 210.0,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
                      child: new RaisedButton(
                        onPressed: () async {
                          try{
                         final newUser = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
                         if(newUser!=null){

                           Navigator.pushNamed(context, LoginPage.id);
                         }
                          }
                          catch(e){
                            print(e);
                          }

                        },
                        child: new Text(
                          'Register',
                          style: new TextStyle(
                              color: Colors.white
                          ),
                        ),

                        color: Color(0xff1A237E),
                      ),

                    ),


                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Already have an account? ', style: TextStyle(color: Colors.grey),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                        child: Text(' Sign in', style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold ),))
                  ],
                )

              ],
            ),
          )
      ),
    );
  }



  }

