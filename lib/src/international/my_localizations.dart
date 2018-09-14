/* Commands to generate and link .arb files
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/src/international/l10n \ --no-use-deferred-loading lib/src/international/my_localizations.dart lib/src/international/l10n/intl_*.arb
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/src/international/l10n lib/src/international/my_localizations.dart
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart';

class MyLocalizations {

  static Future<MyLocalizations> load(Locale locale) {
    final String name =
        (locale.countryCode != null && locale.countryCode.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((dynamic _) {
      Intl.defaultLocale = localeName;
      return new MyLocalizations();
    });
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  String get appTitle {
    return Intl.message(
      'Dallal',
      name: 'appTitle',
    );
  }

  String get language {
    return Intl.message(
      'عربي',
      name: 'language',
    );
  }

  String get username {
    return Intl.message(
      'Username',
      name: 'username',
    );
  }

  String get password {
    return Intl.message(
      'Password',
      name: 'password',
    );
  }

  String get login {
    return Intl.message(
      'Login',
      name: 'login',
    );
  }

  String get notValidUsername {
    return Intl.message(
      'Not Valid Username',
      name: 'notValidUsername',
    );
  }
  
  String get passwordIsTooShort {
    return Intl.message(
      'password is too short',
      name: 'passwordIsTooShort',
    );
  }
}
