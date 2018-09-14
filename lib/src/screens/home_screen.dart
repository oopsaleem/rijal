import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../international/my_localizations.dart';
import '../screens/app_settings.dart';
import '../screens/login_screen.dart';
import '../app_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(context),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: <Widget>[
          Container(child: Text('Home page content here!')),
          RaisedButton(
            child: Text('Add Item'),
            onPressed: () {
              print('add item clicked');
            },
          ),
          RaisedButton(
            child: Text('Display Page'),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      ),
    );
  }

  Widget myDrawer(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Text(MyLocalizations.of(context).appTitle)),
          MaterialButton(
            onPressed: () {
              model.changeDirection();
            },
            height: 60.0,
            color: const Color.fromRGBO(119, 31, 17, 1.0),
            child: new Text(
              MyLocalizations.of(context).language,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.3,
              ),
            ),
          ),
          FlatButton.icon(
              label: Text('Settings'),
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AppSettings()));
              }),
          FlatButton.icon(
              label: Text('Login'),
              icon: Icon(Icons.security),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
        ],
      ),
    ));
  }
}
