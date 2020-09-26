import 'package:cdp1_aitube/pages/dummy_page.dart';
import 'package:cdp1_aitube/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'setting_page.dart';

class SelectPage extends StatelessWidget {
  static const routeName = "/select";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          title: Text('Select'),
          actions : <Widget>[
            IconButton(
              icon : Icon(Icons.menu),
              onPressed : () { //누르면 SettingPage로 넘어가고 뒤로가기 버튼을 누르면 다시 돌아옴.
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>SettingPage()
                ),
                );
              },
            )
          ]
      ),
      body :
      Column(
          children : <Widget>[
            Container(
              width : 200,
              height : 120,
              margin : EdgeInsets.only(
                  left : 100,
                  top : 110
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black38)
                ),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                    '영상편집',
                    style: TextStyle(
                        fontSize:24)
                ),
                onPressed: () => SignUpPage(),
              ),
            ),
            Container(
              width : 200,
              height : 120,
              margin : EdgeInsets.only(
                left : 100,
                top : 30,
              ),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.black38)
                  ),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text(
                      '상점',
                      style: TextStyle(
                          fontSize:24)
                  ),
                  onPressed: () {
                    scaffoldKey.currentState
                        .showSnackBar(SnackBar(content : Text("준비중")));
                  }
              ),
            ),
            Container(
                margin : EdgeInsets.only(
                    left : 100,
                    top : 30
                ),
                child:InkWell(
                  child : Text(
                      'How to use?',
                      style: TextStyle(
                          fontSize:20,
                          decoration : TextDecoration.underline
                      )
                  ),
                  onTap : () {},
                )
            ),
          ]
      ),
    );
  }
}