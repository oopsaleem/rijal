import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../app_model.dart';
import '../screens/home_screen.dart';
import '../international/my_localizations.dart';

class AppSettings extends StatelessWidget {
  static final String routeName = 'app_settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Page'),
        actions: <Widget>[
          FlatButton(
            child: Text('Back Home'),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          )
        ],
      ),
      body: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => MaterialButton(
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
      ),
    );
  }
}
