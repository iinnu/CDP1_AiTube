
import 'package:cdp1_aitube/pages/edit_page.dart';
import 'package:cdp1_aitube/pages/select_page.dart';
import 'package:cdp1_aitube/pages/setting_page.dart';
import 'package:cdp1_aitube/pages/video_page.dart';
import 'package:flutter/material.dart';
import 'package:cdp1_aitube/pages/login_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:core';
import 'dart:async';
//import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()));
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Hexcolor('#fdc23e'),
        body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 242,),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(top: 8.0, bottom: 269.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '텍스트 편집의 시작',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Image.asset('assets/images/splash_logo.png'),
                        ],
                      )
                    ),
                  ),
                  Text(
                    'Copyright ⓒ By beanzsoft.All right reserved.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.0,
                    ),
                  ),
                  SizedBox(height: 34,),
                ],
              ),
            )
        )
    );
  }
}