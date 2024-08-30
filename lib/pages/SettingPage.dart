import 'package:bhagvat_geeta/provider/LanguageProvider.dart';
import 'package:bhagvat_geeta/provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    bool language =
        Provider.of<LanguageProvider>(context).languageModel.isHindi == true;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Text(
                'dark Mode',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Switch(
                  value: (Provider.of<ThemeProvider>(context)
                          .themeModel
                          .isThemeDark ==
                      false),
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false).theme();
                  }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Text(
                'English language',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Switch(
                  value: (Provider.of<LanguageProvider>(context)
                          .languageModel
                          .isHindi ==
                      false),
                  onChanged: (value) {
                    Provider.of<LanguageProvider>(context, listen: false)
                        .language();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
