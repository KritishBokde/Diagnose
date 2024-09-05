import 'package:diagnose/language_provider.dart';
import 'package:diagnose/screens/controllerscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => LanguageProvider(),
    child: const Diagnose(),
  ));
}

class Diagnose extends StatelessWidget {
  const Diagnose({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      locale: context.watch<LanguageProvider>().selectedLocale,
      title: "Diagnose",
      theme: ThemeData(fontFamily: "FontMain"),
      home: const Controllerscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
