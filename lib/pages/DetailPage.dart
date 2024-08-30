import 'dart:convert';

import 'package:bhagvat_geeta/provider/LanguageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late String jsonData;
  Map? geeta;
  Map verses = {};

  loadJsonData() async {
    jsonData =
        await rootBundle.loadString("assets/Json/bhagvadgeeta_english.JSON");

    geeta = jsonDecode(jsonData);
    verses = geeta!['verses'];
    setState(() {});
  }

//////
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData();
    loadJsonDataHindi();
  }

//////
  late String jsonDataHindi;
  Map? geetaHindi;
  Map versesHindi = {};

  loadJsonDataHindi() async {
    jsonDataHindi =
        await rootBundle.loadString("assets/Json/bhagvadgeeta_hindi.JSON");

    geetaHindi = jsonDecode(jsonDataHindi);
    versesHindi = geetaHindi!['verses'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool language =
        Provider.of<LanguageProvider>(context).languageModel.isHindi == true;

    dynamic chapters = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.2,
          image: AssetImage(
            'assets/image/2.jfif',
          ),
        )),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Stack(children: [
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                opacity: 0.8,
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/image/ch.jpg',
                                ),
                              )),
                        ),
                      ),
                      Center(
                        child: (language == true)
                            ? Text(
                                'अध्याय ${chapters['chapter_number']}',
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            : Text(
                                'Chapter ${chapters['chapter_number']}',
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ]),
                    Text(
                      '${chapters['name']}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: 350,
                        height: 400,
                        child: Text(
                          '${chapters['chapter_summary']}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                  itemCount: chapters['verse_numbers'].length,
                  itemBuilder: (context, index) {
                    final chapterNumber = chapters['chapter_number'];
                    final verse = verses['$chapterNumber']['${index + 1}'];
                    return (verse == null)
                        ? const Text('No verses found')
                        : InkWell(
                            radius: 50,
                            onTap: () {
                              Navigator.of(context).pushNamed('verses',
                                  arguments: verses['$chapterNumber']
                                      ['${index + 1}']);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    (language == true)
                                        ? const Text(
                                            'श्लोका',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : const Text(
                                            'Shloka',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    (language == true)
                                        ? Text(
                                            "${versesHindi['verse_number']}",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            "${verse['verse_number']}",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ],
                                ),
                                const Divider(),
                              ],
                            ),
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
