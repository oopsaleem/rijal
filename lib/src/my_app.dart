import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import '../src/style.dart';
import '../src/scope_model_wrapper.dart';
import '../src/international/my_localizations_delegate.dart';
import '../src/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => MaterialApp(
            locale: model.appLocal,
            localizationsDelegates: [
              const MyLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('ar', ''), // Arabic
              const Locale('en', ''), // English
            ],
            debugShowCheckedModeBanner: true,
            theme: hrTheme,
            title: "Arabic Flutter",
            home: new LoginScreen(),
      ),
    );
  }
}
