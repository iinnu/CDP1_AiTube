import 'package:cdp1_aitube/pages/dummy_page.dart';
import 'package:cdp1_aitube/pages/login_page.dart';
import 'package:cdp1_aitube/pages/select_page.dart';
import 'package:cdp1_aitube/pages/setting_page.dart';
import 'package:cdp1_aitube/pages/find_page.dart';
import 'package:cdp1_aitube/pages/video_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AiTube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: GoogleFonts.sacramento(),  // added those fonts just as a help to adding others
        ),
        primaryTextTheme: GoogleFonts.sacramentoTextTheme(Theme.of(context).textTheme),
        accentTextTheme: GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme),
      ),

      initialRoute: LoginPage.routeName,
      routes: {
        FindPage.routeName: (ctx) => FindPage(),
        LoginPage.routeName: (ctx) => LoginPage(), // here you simply change DummyPage() for any page you want, for example LoginPage();
        SignUpPage.routeName: (ctx) => SignUpPage(),
        SettingPage.routeName: (ctx) => SettingPage(), // this convention of 'routes' is pretty useful and very easy to use
        SelectPage.routeName: (ctx) => SelectPage(),
        VideoPage.routeName: (ctx) => VideoPage(),
      },
      onUnknownRoute: (settings) {
        return null; // potentially some kind of an error page
      },
    );
  }
}
