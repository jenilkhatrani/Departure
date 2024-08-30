import 'package:bhagvat_geeta/pages/DetailPage.dart';
import 'package:bhagvat_geeta/pages/HomePage.dart';
import 'package:bhagvat_geeta/pages/OnBoardingPage.dart';
import 'package:bhagvat_geeta/pages/SettingPage.dart';
import 'package:bhagvat_geeta/pages/SplashPage.dart';
import 'package:bhagvat_geeta/pages/verse.dart';
import 'package:bhagvat_geeta/provider/LanguageProvider.dart';
import 'package:bhagvat_geeta/provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => LanguageProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: (Provider.of<ThemeProvider>(context).themeModel.isThemeDark)
          ? ThemeMode.light
          : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        '/': (context) => Homepage(),
        'splash': (context) => OnboardingScreen(),
        'details': (context) => DetailPage(),
        'verses': (context) => Verses(),
        'setting': (context) => SettingPage(),
      },
    );
  }
}
