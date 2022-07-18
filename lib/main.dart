import 'package:flutter/material.dart';

import 'package:hauxe/screens/intro_screen/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MyIntroPage(), supportedLocales: [
      const Locale('en', 'US'),
      const Locale('pt', 'BR')
    ]);
  }
}
