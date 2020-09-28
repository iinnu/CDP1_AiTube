
import 'package:cdp1_aitube/pages/find_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:cdp1_aitube/pages/select_page.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 60.0,),
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
                    )),
              )),
              Divider(
                color: Colors.grey.shade600,
              ),
              ListTile(
                  title: TextField(
                    style: TextStyle(color: Colors.black38),
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
                            color:Colors.black54,
                            size: 22,
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 60,),
                  _kakaoButton(),
                  SizedBox(height: 30,),
                  _signupButton(),
                  SizedBox(height: 10,),
                  _findButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openSelect(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SelectPage.routeName);
  }
}

class _kakaoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {print('press');},
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

class _signupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
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
        ));
  }
}

class _findButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=>FindPage()),
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
        ));
  }
}
