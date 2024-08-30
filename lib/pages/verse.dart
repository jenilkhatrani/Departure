import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Verses extends StatefulWidget {
  const Verses({super.key});

  @override
  State<Verses> createState() => _VersesState();
}

class _VersesState extends State<Verses> {
  @override
  Widget build(BuildContext context) {
    dynamic verses = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.2,
          image: AssetImage(
            'assets/image/2.jfif',
          ),
        )),
        child: Center(
          child: Column(
            children: [
              Text(
                'Shloka ${verses['verse_number']}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                ' ${verses['text']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Meaning ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 350,
                child: Text(
                  ' ${verses['meaning']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                ' Word Meaning ',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 350,
                child: Text(
                  ' ${verses['word_meanings']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
