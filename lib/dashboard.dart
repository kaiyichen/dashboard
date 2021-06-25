import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var quote = [
    'Did you know when you dont sleep, you tend to eat more especially junk food?',
    'Exercise not just a few times a week, but every day.',
    'By moving your body in some way for 30 minutes a day will lower your risk of disease, create higher bone density and potentially increase your life span',
    'Eat the rainbow. Pick brightly-colored foods in the produce aisle. These are high in antioxidants and make a more appealing plate.',
    'sleep for at least 7 hours a day!'
  ];
  var currentHour = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/dashboard.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 1.8,
                  left: MediaQuery.of(context).size.width / 2.5,
                  child: Container(
                    child: Image.asset(
                      "assets/images/pet.gif",
                      width: 300,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 1.9,
                  right: MediaQuery.of(context).size.width / 2.5,
                  child: SvgPicture.asset('assets/images/speechbubble.svg'),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 1.85,
                  right: MediaQuery.of(context).size.width / 2.4,
                  child: Container(
                    padding: EdgeInsets.all(13),
                    height: 90,
                    width: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(236, 177, 134, 1),
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              displayQuote(),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                          repeatForever: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String displayQuote() {
    if (currentHour >= 5 && currentHour <= 11) {
      return quote[0];
    } else if (currentHour >= 12 && currentHour <= 16) {
      return quote[1];
    } else if (currentHour >= 17 && currentHour <= 7) {
      return quote[2];
    } else if (currentHour >= 8 && currentHour <= 11) {
      return quote[3];
    } else {
      return quote[4];
    }
  }
}
