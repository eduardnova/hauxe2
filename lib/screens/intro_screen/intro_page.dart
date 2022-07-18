import 'package:flutter/material.dart';
import 'package:nice_intro/intro_screen.dart';
import 'package:nice_intro/intro_screens.dart';

import 'package:hauxe/screens/intro_screen/welcome_screen.dart';

class MyIntroPage extends StatefulWidget {
  const MyIntroPage({Key? key}) : super(key: key);
  @override
  MyIntroPageState createState() => MyIntroPageState();
}

class MyIntroPageState extends State<MyIntroPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var screens = IntroScreens(
      onDone: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
        ),
      ),
      onSkip: () => print('Skipping the intro slides'),
      footerBgColor: const Color(0xff145ff4),
      activeDotColor: Colors.white,

      footerRadius: 18.0,
//      indicatorType: IndicatorType.CIRCLE,
      slides: [
        IntroScreen(
          title: 'Search',
          imageAsset: 'assets/slider1.jpg',
          description: 'Quickly find all your messages',
          headerBgColor: Colors.white,
        ),
        IntroScreen(
          title: 'Focused Inbox',
          headerBgColor: Colors.white,
          imageAsset: 'assets/slider1.jpg',
          description: "We've put your most important, actionable emails here",
        ),
        IntroScreen(
          title: 'Social',
          headerBgColor: Colors.white,
          imageAsset: 'assets/slider1.jpg',
          description: "Keep talking with your mates",
        ),
      ],
    );

    return Scaffold(
      body: screens,
    );
  }
}
