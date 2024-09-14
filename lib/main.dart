import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', '');

  void _switchLanguage(String langCode) {
    setState(() {
      _locale = Locale(langCode, '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyLearn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('ta', ''), // Tamil
      ],
      home: LanguageSwitcherScreen(onLocaleChange: _switchLanguage),
    );
  }
}

class LanguageSwitcherScreen extends StatefulWidget {
  final Function(String) onLocaleChange;

  const LanguageSwitcherScreen({super.key, required this.onLocaleChange});

  @override
  _LanguageSwitcherScreenState createState() => _LanguageSwitcherScreenState();
}

class _LanguageSwitcherScreenState extends State<LanguageSwitcherScreen> {
  String _selectedLanguage = 'en';

  void _handleLanguageChange(String? value) {
    setState(() {
      _selectedLanguage = value!;
    });
  }

  void _applyLanguageChange() {
    widget.onLocaleChange(_selectedLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyLearn'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.greetings),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'en',
                  groupValue: _selectedLanguage,
                  onChanged: _handleLanguageChange,
                ),
                const Text('English'),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'ta',
                  groupValue: _selectedLanguage,
                  onChanged: _handleLanguageChange,
                ),
                const Text('தமிழ்'),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _applyLanguageChange,
              child: const Text('Next ->'),
            ),
          ],
        ),
      ),
    );
  }
}
