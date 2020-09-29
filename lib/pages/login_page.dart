import 'package:cdp1_aitube/models/users.dart';
import 'package:cdp1_aitube/pages/find_page.dart';
import 'package:cdp1_aitube/pages/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:cdp1_aitube/pages/select_page.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  final Users currentUser = new Users();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            width: double.infinity,
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 60.0,
                ),
                height: 120.0,
                width: 120.0,
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              ListTile(
                title: TextField(
                  style: TextStyle(color: Colors.black38),
                  decoration: InputDecoration(
                    hintText: "ID",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 17.0,
                    ),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.email,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade600,
              ),
              ListTile(
                  title: TextField(
                style: TextStyle(color: Colors.black38),
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 17.0,
                    ),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.black38,
                    )),
              )),
              Divider(
                color: Colors.grey.shade600,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () => _openSelect(context),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(3, 3, 0, 0),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black54,
                            size: 22,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      KakaoButton(currentUser),
                      SizedBox(
                        height: 30,
                      ),
                      SignUpButton(),
                      SizedBox(
                        height: 10,
                      ),
                      FindButton(),
                      GoogleLogin(currentUser),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _openSelect(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SelectPage.routeName);
  }
}

class KakaoButton extends StatelessWidget {
  final Users currentUser;

  KakaoButton(this.currentUser);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        currentUser.changeLoginMethod(LoginMethod.KAKAO);
        currentUser.handleSignIn();
      },
      child: Container(
        width: 200.0,
        height: 50.0,
        child: Image.asset(
          'assets/images/kakao.png',
          //fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(SignUpPage.routeName),
      child: Container(
        alignment: Alignment(0.0, 0.0),
        width: 70.0,
        height: 22.0,
        child: Text(
          'Sign up',
          style: TextStyle(
              color: Colors.black54,
              fontSize: 17.0,
              decoration: TextDecoration.underline,
              decorationColor: Colors.black54),
        ),
      ),
    );
  }
}

class GoogleLogin extends StatelessWidget {
  final Users currentUser;

  GoogleLogin(this.currentUser);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        currentUser.changeLoginMethod(LoginMethod.GOOGLE);
        currentUser.handleSignIn();
        if (currentUser.isSignedIn() != null) {
          Navigator.of(context)
              .pushNamed(SelectPage.routeName, arguments: currentUser);
        }
      },
      child: Container(
        width: 200.0,
        height: 50.0,
        child: Image.asset(
          'assets/images/google_logo.png',
//fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FindButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FindPage()),
        );
      },
      child: Container(
        alignment: Alignment(0.0, 0.0),
        width: 230.0,
        height: 22.0,
        child: Text(
          'Forgot your ID or Password?',
          style: TextStyle(
              color: Colors.black54,
              fontSize: 17.0,
              decoration: TextDecoration.underline,
              decorationColor: Colors.black54),
        ),
      ),
    );
  }
}
