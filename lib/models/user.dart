import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_kakao_login/flutter_kakao_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum LoginMethod { KAKAO, FACEBOOK, GOOGLE }

class Users {
  final FacebookLogin _facebookSignIn = new FacebookLogin();
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );
  String _userPhotoUrl;
  String _userName;
  String _userId;
  String _userEmail;
  bool _logged = false;
  LoginMethod _loginMethod;

  String getUserPhotoUrl() {
    return _userPhotoUrl;
  }

  String getUserName() {
    return _userName;
  }

  String getUserId() {
    return _userId;
  }

  String getUserEmail() {
    return _userEmail;
  }

  LoginMethod isLoggedVia() {
    return _loginMethod;
  }

  bool isLogged() {
    return _logged;
  }

  void setUserPhotoUrl(String photoUrl) {
    _userPhotoUrl = photoUrl;
  }

  void setUserName(String userName) {
    _userName = userName;
  }

  void setUserId(String userId) {
    _userId = userId;
  }

  void setUserEmail(String userEmail) {
    _userEmail = userEmail;
  }

  void setLogged(bool isLogged, LoginMethod loginMethod) {
    _logged = isLogged;
    _loginMethod = loginMethod;
  }

  Future<bool> login(LoginMethod loginMethod) async {
    switch (loginMethod) {
      case LoginMethod.KAKAO:
        {
          try {
            final FlutterKakaoLogin kakaoSignIn = new FlutterKakaoLogin();
            await kakaoSignIn.logIn();
            this.setLogged(await kakaoSignIn.isLoggedIn, loginMethod);
            final result = await kakaoSignIn.getUserMe();
            final KakaoAccountResult user = result.account;

            if (this.isLogged()) {
              this.setUserEmail(user.userEmail);
              this.setUserId(user.userDisplayID); // or userID?
              this.setUserName(user.userNickname);
              this.setUserPhotoUrl(user.userProfileImagePath);
            }
          } catch (e) {
            print("${e.code} ${e.message}");
            setLogged(false, null);
            return false;
          }
          break;
        }
      case LoginMethod.GOOGLE:
        {
          try {
            final result = await _googleSignIn.signIn();
            print(result.toString());
            if(await _googleSignIn.isSignedIn()) {
              this.setUserEmail(_googleSignIn.currentUser.email);
              this.setUserName(_googleSignIn.currentUser.displayName);
              this.setUserPhotoUrl(_googleSignIn.currentUser.photoUrl);
              this.setUserId(_googleSignIn.currentUser.id);
            } else {
              return false;
            }
          } catch (e) {
            print("${e.code} ${e.message}");
            setLogged(false, null);
            return false;
          }
          break;
        }
      case LoginMethod.FACEBOOK:
        {
          try {
            final FacebookLoginResult result =
                await _facebookSignIn.logInWithReadPermissions(['email']);

            switch (result.status) {
              case FacebookLoginStatus.loggedIn:
                final FacebookAccessToken accessToken = result.accessToken;
                final token = accessToken.token;
                print('''
                                 Logged in!
                                
                                 Token: ${accessToken.token}
                                 User id: ${accessToken.userId}
                                 Expires: ${accessToken.expires}
                                 Permissions: ${accessToken.permissions}
                                 Declined permissions: ${accessToken.declinedPermissions}
                                 ''');

                final graphResponse = await http.get(
                    'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),email&access_token=${token}');
                final profile = json.decode(graphResponse.body);
                this.setUserName(profile['name']);
                this.setUserPhotoUrl(profile['picture']['data']['url']);
                this.setUserEmail(profile['email']);
                this.setLogged(true, loginMethod);
                break;
              case FacebookLoginStatus.cancelledByUser:
                print('Login cancelled by the user.');
                break;
              case FacebookLoginStatus.error:
                print('Something went wrong with the login process.\n'
                    'Here\'s the error Facebook gave us: ${result.errorMessage}');
                break;
            }
          } catch (e) {
            print("${e.code} ${e.message}");
            return false;
          }
        }
    }
    return true;
  }

  //needs improvements, separate logout for facebook and google and a clean up
  Future<bool> logout() async {
    final loginMethod = isLoggedVia();
    switch (loginMethod) {
      case LoginMethod.KAKAO:
        {
          try {
            final FlutterKakaoLogin kakaoSignIn = new FlutterKakaoLogin();
            await kakaoSignIn.logOut();
            setLogged(false, null);
          } catch (e) {
            print("${e.code} ${e.message}");
            return false;
          }
          break;
        }
      case LoginMethod.FACEBOOK:
        {
          try {
            await _facebookSignIn.logOut();
            setLogged(false, null);
          } catch (e) {
            print("${e.code} ${e.message}");
            return false;
          }
          break;
        }
      case LoginMethod.GOOGLE:
        try {
          await _googleSignIn.signOut();
          setLogged(false, null);
        } catch (e) {
          print("${e.code} ${e.message}");
          return false;
        }
        break;
    }
    return true;
  }
}

Users currentUser = new Users();
