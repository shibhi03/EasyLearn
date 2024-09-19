import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // For localization
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'VideoPlayer.dart';
import 'game.dart';
import 'homePage.dart'; // Import your HomePage

void main() {
  runApp(const EasyLearn());
}

class EasyLearn extends StatefulWidget {
  const EasyLearn({super.key});

  @override
  _EasyLearnState createState() => _EasyLearnState();
}

class _EasyLearnState extends State<EasyLearn> {
  Locale _locale = const Locale('en', ''); // Default locale is Tamil

  // Language Preferences. - Tamil / English
  // Default - Tamil.
  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en';
    setState(() {
      _locale = Locale(languageCode, '');
    });
  }

  Future<void> _switchLanguage() async {
    final newLocale =
        _locale.languageCode == 'en' ? Locale('ta', '') : Locale('en', '');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', newLocale.languageCode);

    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ta', ''),
      ],
      home: HomePage(onSwitchLanguage: _switchLanguage),
      // home: VideoPlayerScreen(),
      // home: GameScreen(),
    );
  }
}
