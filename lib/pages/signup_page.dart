import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/signup';
  SignUpPage();

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  String _email = "";
  String _id = "";
  String _pw = "";
  String _pw_check = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                margin: EdgeInsets.only(top: 80, bottom: 50),
                alignment: Alignment.center,
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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호 확인'
                  ),
                ),
              ),
            ]
        ),
    );
  }
}

