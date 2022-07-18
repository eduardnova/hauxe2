import 'package:flutter/material.dart';
import 'package:multi_language_json/multi_language_json.dart';

class Settings extends StatefulWidget {
  @override
  const Settings({Key? key}) : super(key: key);
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final language = MultiLanguageBloc(initialLanguage: 'en_US', defaultLanguage: 'pt_BR', commonRoute: 'common', supportedLanguages: [
    'en_US',
    'pt_BR'
  ]);

  @override
  Widget build(BuildContext context) {
    return MultiLanguageStart(
        future: language.init(),
        builder: (c) => MultiStreamLanguage(
                screenRoute: [
                  'home'
                ],
                builder: (c, d) => Scaffold(
                      appBar: AppBar(
                          title: Text(d.getValue(route: [
                        'title'
                      ]))),
                      body: Center(
                        child: ElevatedButton(
                          child: Text(d.getValue(route: [
                            'btn'
                          ])),
                          onPressed: () => language.showAlertChangeLanguage(
                              context: context,
                              title: d.getValue(route: [
                                'dialog',
                                'title'
                              ], inRoute: false),
                              btnNegative: d.getValue(route: [
                                'dialog',
                                'btn_negative'
                              ], inRoute: false)),
                        ),
                      ),
                    )));
  }
}
