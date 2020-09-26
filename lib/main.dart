import 'package:cdp1_aitube/pages/dummy_page.dart';
import 'package:cdp1_aitube/pages/login_page.dart';
import 'package:cdp1_aitube/pages/setting_page.dart';
import 'package:cdp1_aitube/pages/find_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AiTube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //fontFamily:,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Quicksand',
          ),
          subtitle2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Quicksand',
          ),
        ),
      ),
      home: FindPage(),
      //initialRoute: LoginPage.routeName,
      routes: {
        FindPage.routeName: (ctx) => FindPage(),
        /*LoginPage.routeName: (ctx) => DummyPage(),  // here you simply change DummyPage() for any page you want, for example LoginPage();
        SettingPage.routeName: (ctx) => SettingPage(),  // this convention of 'routes' is pretty useful and very easy to use*/
      },
      onUnknownRoute: (settings) {
        return null; // potentially some kind of an error page
      },
    );
  }
}
