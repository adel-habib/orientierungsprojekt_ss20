import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/subscription_pages/PricingPage.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),

            child: Icon(Icons.monetization_on, size: 40,),
          ),
          ListTile(
            onTap: (){},
            title: Text('My Account '),
            leading: Icon(Icons.account_box),
          ),
          ListTile(
            title: Text('Upgrade to premium'),
            leading: Icon(Icons.shop),
            onTap: (){
              Navigator.pushNamed(context, PricingPage.id);
            },
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings_applications),
            onTap: (){}, // if you wish to provide a settings page you can navigate to it from here
          ),
          ListTile(
            onTap: (){}, //todo: Here you can implement the signing-out using firebase
            title: Text('Sign out'),
            leading: Icon(Icons.exit_to_app),
          )
        ],
      ),
    );
  }
}