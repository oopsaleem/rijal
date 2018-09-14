import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scope_model_wrapper.dart';
import '../international/my_localizations.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
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
              const SizedBox(height: 25.0),
              changeLanguageButton(),
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
      validator: (value) => validateEmail(value, errorMessage),
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
      validator: (value) => validatePassword(value, errorMessage),
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

  Widget changeLanguageButton() {
    return ScopedModelDescendant<AppModel>(
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
    );
  }
}
