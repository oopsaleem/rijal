import 'package:flutter/material.dart';

import '../international/my_localizations.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = "login-screen";

  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String emailValue = '';
  String passwValue = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        //color: Colors.white,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 180.0),
              buildEmailField(
                MyLocalizations.of(context).username,
                MyLocalizations.of(context).notValidUsername,
              ),
              const SizedBox(height: 25.0),
              buildPasswordField(
                MyLocalizations.of(context).password,
                MyLocalizations.of(context).passwordIsTooShort,
              ),
              Container(margin: EdgeInsets.only(top: 20.0)),
              submitButton(MyLocalizations.of(context).login),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailField(String caption, String errorMessage) {
    return TextFormField(
      onSaved: (value) => emailValue = value,
      decoration: InputDecoration(
        labelText: caption,
        hintText: "user@test.com",
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (val) => !val.contains("@") ? errorMessage : null,
    );
  }

  Widget buildPasswordField(String caption, String errorMessage) {
    return TextFormField(
      onSaved: (value) => passwValue = value,
      scrollPadding: EdgeInsets.all(40.0),
      decoration: InputDecoration(
        labelText: caption,
      ),
      obscureText: true,
      validator: (val) => val.length < 8 ? errorMessage : null,
    );
  }

  Widget submitButton(String caption) {
    return RaisedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Login as email: $emailValue and Passwd: $passwValue');
        }
      },
      color: Colors.blue,
      child: Text(
        caption,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
