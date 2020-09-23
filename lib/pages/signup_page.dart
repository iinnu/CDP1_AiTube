import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/signup';
  SignUpPage();

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _email = "";
  String _id = "";
  String _pw = "";
  String _pw_check = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          title: Text('회원가입'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }
              )
      ),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Container(// Our logo
                margin: EdgeInsets.symmetric(vertical: 50),
                //alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150,
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  //alignment: Alignment.center,
                  child: TextField(
                      onChanged: (text) => _email = text,
                      maxLength: 30,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '이메일'
                      ),
                  ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  //alignment: Alignment.center,
                  child: TextField(
                      onChanged: (text) => _id = text,
                      maxLength: 20,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '아이디'
                      ),
                  ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                //alignment: Alignment.center,
                child: TextField(
                  onChanged: (text) => _pw = text,
                  maxLength: 20,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호'
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                //alignment: Alignment.center,
                child: TextField(
                  onChanged: (text) => _pw_check = text,
                  maxLength: 20,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호 확인'
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                //alignment: Alignment.center,
                child:
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.lightBlue[900]),
                  ),
                  onPressed: () {
                    if(_id == "" || _email == "" || _pw == "" || _pw_check == "") {
                      scaffoldKey.currentState
                          .showSnackBar(SnackBar(content: Text("모든 칸을 채워주세요.")));
                    }
                    if(_pw != _pw_check) {
                      scaffoldKey.currentState
                        .showSnackBar(SnackBar(content: Text("비밀번호가 일치하지 않습니다.")));
                    }
                  },
                  color: Colors.lightBlue[900],
                  textColor: Colors.white,
                  child: Text('회원가입', style: TextStyle(fontSize:20)),
                )
              ),
            ]
        ),
    );
  }
}

