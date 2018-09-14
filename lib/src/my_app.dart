import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'style.dart';
import 'international/my_localizations_delegate.dart';
import 'app_model.dart';
import 'screens/app_settings.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

//This is wrapped in my_app.dart => ScopeModelWrapper
class MyApp extends StatelessWidget {
  final myRoutes = <String, WidgetBuilder>{
    AppSettings.routeName: (BuildContext context) => AppSettings(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => MaterialApp(
            title: 'Scoped Model MultiPage Demo',
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
            theme: hrTheme,
            home: HomeScreen(),
            routes: myRoutes,
          ),
    );
  }
}
