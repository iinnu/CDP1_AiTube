import 'package:cdp1_aitube/models/user.dart';
import 'package:cdp1_aitube/pages/find_page.dart';
import 'package:cdp1_aitube/pages/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:cdp1_aitube/pages/select_page.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  final _userEmail = TextEditingController();
  final _userPassword = TextEditingController();
  final _userId = TextEditingController();

  // void _submitData(BuildContext ctx) async {
  //   final enteredEmail = _userEmail.text;
  //   final enteredPassword = _userPassword.text;
  //   final enteredId = _userId.text;
  //   if (enteredPassword.isEmpty || enteredEmail.isEmpty) {
  //     Scaffold.of(ctx)
  //         .showSnackBar(SnackBar(content: Text('Please fill in all blanks')));
  //     return;
  //   }
  //
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(
  //             email: enteredEmail, password: enteredPassword);
  //     FirebaseAuth.instance.currentUser.updateProfile(
  //       displayName: enteredId,
  //     );
  //     Navigator.of(ctx).pushNamedAndRemoveUntil(
  //         SelectPage.routeName, (Route<dynamic> route) => false);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       Scaffold.of(ctx).showSnackBar(
  //           SnackBar(content: Text('No user found for that email.')));
  //     } else if (e.code == 'wrong-password') {
  //       Scaffold.of(ctx).showSnackBar(
  //           SnackBar(content: Text('Wrong password provided for that user.')));
  //     } else
  //       Scaffold.of(ctx).showSnackBar(SnackBar(content: Text(e.toString())));
  //   }
  // }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: Builder(
        builder: (context) => SafeArea(
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
                Container(
                  child: ListTile(
                    title: TextField(
                      style: TextStyle(color: Colors.black38),
                      controller: _userEmail,
                      onSubmitted: (_) => {},
                      //_submitData(context),
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
                ),
                Divider(
                  color: Colors.grey.shade600,
                ),
                Container(
                  child: ListTile(
                      title: TextField(
                    style: TextStyle(color: Colors.black38),
                    obscureText: true,
                    onSubmitted: (_) {},
                    //_submitData(context),
                    controller: _userPassword,
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
                ),
                Divider(
                  color: Colors.grey.shade600,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      //_submitData(context),
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
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    KakaoButton(),
                    SizedBox(
                      height: 10,
                    ),
                    GoogleLogin(),
                    SizedBox(
                      height: 10,
                    ),
                    FacebookLogin(),
                    SizedBox(
                      height: 30,
                    ),
                    LogOutButton(),
                    SignUpButton(),
                    SizedBox(
                      height: 10,
                    ),
                    FindButton(),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void _openSelect(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(SelectPage.routeName);
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

class LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            currentUser.logout();
            currentUser.logout();
          },
          child: Container(
            alignment: Alignment(0.0, 0.0),
            width: 70.0,
            height: 22.0,
            child: Text(
              'LOGOUT FROM ALL',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17.0,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black54),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            print( await currentUser.amILoggedIn());
          },
          child: Container(
            alignment: Alignment(0.0, 0.0),
            width: 70.0,
            height: 22.0,
            child: Text(
              'CHECKK',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17.0,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}

class KakaoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        bool userHadProblemsSigningIn =
            await currentUser.login(LoginMethod.KAKAO);
        if (!userHadProblemsSigningIn) {
          Navigator.of(context)
              .pushReplacementNamed(SelectPage.routeName, arguments: null);
        }
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

class GoogleLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        bool userHadProblemsSigningIn =
            await currentUser.login(LoginMethod.GOOGLE);
        if (!userHadProblemsSigningIn) {
          Navigator.of(context)
              .pushReplacementNamed(SelectPage.routeName, arguments: null);
        }
      },
      child: Container(
        width: 208.0,
        height: 57.0,
        child: Image.asset(
          'assets/images/google_logo.png',
//fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FacebookLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        bool userHadProblemsSigningIn =
            await currentUser.login(LoginMethod.FACEBOOK);
        if (!userHadProblemsSigningIn) {
          Navigator.of(context)
              .pushReplacementNamed(SelectPage.routeName, arguments: null);
        }
      },
      child: Container(
        width: 208.0,
        height: 57.0,
        child: Image.asset(
          'assets/images/facebook_logo.png',
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
