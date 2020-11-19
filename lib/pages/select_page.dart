import 'package:cdp1_aitube/pages/dummy_page.dart';
import 'package:cdp1_aitube/pages/edit_page.dart';
import 'package:cdp1_aitube/pages/setting_page.dart';
import 'package:cdp1_aitube/pages/signup_page.dart';
import 'package:cdp1_aitube/pages/video_page.dart';
import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  static const routeName = "/select";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Select'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => //누르면 SettingPage로 넘어가고 뒤로가기 버튼을 누르면 다시 돌아옴.
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SettingPage(),
              ),
            ),
          ),
        ],
      ),
      body: Column(children: <Widget>[
        Container(
            width: 200,
            height: 120,
            margin: EdgeInsets.only(left: 100, top: 110),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.black38)),
              color: Colors.lightGreen,
              textColor: Colors.white,
              child: Text('VIDEO EDIT', style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPage()),
                );
              },
            )),
        Container(
          width: 200,
          height: 120,
          margin: EdgeInsets.only(
            left: 100,
            top: 30,
          ),
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.black38)),
              color: Colors.redAccent,
              textColor: Colors.white,
              child: Text('STORE', style: TextStyle(fontSize: 24)),
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text("Preparing"),
                  backgroundColor: Colors.deepOrange,
                ));
              }),
        ),
        Container(
            margin: EdgeInsets.only(left: 100, top: 30),
            child: InkWell(
              child: Text('How to use?',
                  style: TextStyle(
                      fontSize: 20, decoration: TextDecoration.underline)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DummyPage()),
                );
              },
            )),
      ]),
    );
  }
}
