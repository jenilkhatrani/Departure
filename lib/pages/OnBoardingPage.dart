import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  final int numPages = 3;

  void onPageChanged(int index) {}

  List<String> image = [
    'assets/image/on1.jfif',
    'assets/image/on2.jpg',
    'assets/image/on3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: numPages,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  image[index],
                  height: 300,
                  width: 300,
                ),
                const SizedBox(height: 24),
                Text(
                  [
                    ' message of the Bhagavad Gita',
                    '5 rules of Bhagwat Geeta',
                    'Let`   s read'
                  ][index],
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    [
                      'In the Bhagavadgita, Krishna teaches that one can kill only the body; the soul is immortal',
                      'Ishvara – The Supreme Lord.\n Jiva  The Living Entity.\nPrakruti – The Material Nature.\nKala – Time and.\nKarma – Activities',
                      ''
                    ][index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                const Spacer(),
                index == numPages - 1
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: const Text('Get Started'),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text('Next'),
                      ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}
