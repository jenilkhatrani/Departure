import 'dart:convert';
import 'package:bhagvat_geeta/provider/LanguageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String jsonData;
  Map? geeta;
  Map bhagvadgeeta = {};

  loadJsonData() async {
    jsonData =
        await rootBundle.loadString("assets/Json/bhagvadgeeta_english.JSON");

    geeta = jsonDecode(jsonData);

    bhagvadgeeta = geeta!['chapters'];
    // bhagvadgeeta = geeta!['verses'];

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData();
    loadJsonDataHindi();
  }

  late String jsonDataHindi;
  Map? geetaHindi;
  Map bhagvadgeetaHindi = {};

  loadJsonDataHindi() async {
    jsonDataHindi =
        await rootBundle.loadString("assets/Json/bhagvadgeeta_hindi.JSON");
    geetaHindi = jsonDecode(jsonDataHindi);
    bhagvadgeetaHindi = geetaHindi!['chapters'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool language =
        Provider.of<LanguageProvider>(context).languageModel.isHindi == true;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'setting');
              },
              icon: Icon(Icons.settings))
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
        title: (language == true)
            ? Text(
                'श्री मद भगवद गीता',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            : Text(
                'Shrimad Bhagavad Gita',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.2,
          image: AssetImage(
            'assets/image/2.jfif',
          ),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 6,
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/image/geeta.avif',
                      ),
                    )),
              ),
            ),
            Expanded(
              flex: 5,
              child: (bhagvadgeeta.isEmpty)
                  ? const Center(
                      child: Text('No Data Yet...'),
                    )
                  : ListView.builder(
                      itemCount: bhagvadgeeta.length,
                      itemBuilder: (context, i) {
                        return Card(
                          color: Colors.white30,
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                                child: (language == true)
                                    ? bhagvadgeetaHindi == null
                                        ? CircularProgressIndicator()
                                        : Text(
                                            '${bhagvadgeetaHindi['${i + 1}']['chapter_number']}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          )
                                    : Text(
                                        '${bhagvadgeeta['${i + 1}']['chapter_number']}',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )),
                            title: (language == true)
                                ? Text(
                                    '${bhagvadgeetaHindi['${i + 1}']['name']}')
                                : Text('${bhagvadgeeta['${i + 1}']['name']}'),
                            subtitle: (language == true)
                                ? Text(
                                    'श्लोका  ${bhagvadgeetaHindi['${i + 1}']['verses_count']}')
                                : Text(
                                    'Shlokas  ${bhagvadgeeta['${i + 1}']['verses_count']}'),
                            onTap: () {
                              (language == true)
                                  ? Navigator.of(context).pushNamed('details',
                                      arguments: bhagvadgeetaHindi['${i + 1}'])
                                  : Navigator.of(context).pushNamed('details',
                                      arguments: bhagvadgeeta['${i + 1}']);
                            },
                            trailing: Icon(Icons.next_plan_outlined),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
