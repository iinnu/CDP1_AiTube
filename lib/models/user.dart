import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_kakao_login/flutter_kakao_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum LoginMethod { KAKAO, FACEBOOK, GOOGLE }

class Users {
  String _userPhotoUrl;
  String _userName;
  String _userId;
  String _userEmail;
  bool _logged = false;
  bool _loggedViaKakaotalk = false;

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

  bool isLoggedViaKakaotalk() {
    return _loggedViaKakaotalk;
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

  //potentially change for LoginMethod
  void setLoggedViaKakaotalk(bool isLoggedViaKakaotalk) {
    _loggedViaKakaotalk = isLoggedViaKakaotalk;
    _logged = isLoggedViaKakaotalk;
  }

  void setLogged(bool isLogged) {
    if (isLogged) {
      _logged = isLogged;
    } else {
      _loggedViaKakaotalk = isLogged;
      _logged = isLogged;
    }
  }

  Future<bool> login(LoginMethod loginMethod) async {
    switch (loginMethod) {
      case LoginMethod.KAKAO:
        {
          try {
            final FlutterKakaoLogin kakaoSignIn = new FlutterKakaoLogin();
            await kakaoSignIn.logIn();
            currentUser.setLoggedViaKakaotalk(await kakaoSignIn.isLoggedIn);
            final result = await kakaoSignIn.getUserMe();
            final KakaoAccountResult user = result.account;

            if (this.isLoggedViaKakaotalk()) {
              print(user.userNickname + " - userNickname");
              print(user.userDisplayID + " - userDisplayID");
              print(user.userID + " - userID");
              this.setUserEmail(user.userEmail);
              this.setUserId(user.userDisplayID); // or userID?
              this.setUserName(user.userNickname);
              this.setUserPhotoUrl(user.userProfileImagePath);
            }
          } catch (e) {
            print("${e.code} ${e.message}");
            return true;
          }
          break;
        }
      case LoginMethod.GOOGLE:
        {
          // Trigger the authentication flow
          final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

          if (googleUser != null) {
            // Obtain the auth details from the request
            final GoogleSignInAuthentication googleAuth =
                await googleUser.authentication;

            // Create a new credential
            final GoogleAuthCredential credential =
                GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );
            // Once signed in, return the UserCredential
            await FirebaseAuth.instance.signInWithCredential(credential);

            FirebaseAuth.instance.authStateChanges().listen((User user) {
              this.setLogged(true);
              this.setUserEmail(user.email); //
              this.setUserId(user.uid);
              this.setUserName(user.displayName);
              this.setUserPhotoUrl(user.photoURL);
            });
          } else
            return true;
          break;
        }
      case LoginMethod.FACEBOOK:
        {
          try {

            // Trigger the sign-in flow
            final LoginResult result = await FacebookAuth.instance.login();

            print(result.status.toString());
            if (result.status == FacebookAuthLoginResponse.ok) {
              // Create a credential from the access token
              final FacebookAuthCredential facebookAuthCredential =
                  FacebookAuthProvider.credential(result.accessToken.token);

              await FirebaseAuth.instance
                  .signInWithCredential(facebookAuthCredential);

              FirebaseAuth.instance.authStateChanges().listen((User user) {
                this.setLogged(true);
                this.setUserEmail(user.email);
                this.setUserId(user.uid);
                this.setUserName(user.displayName);
                this.setUserPhotoUrl(user.photoURL);
              });
            } else
              return true;
          } catch (e) {
            print("${e.code} ${e.message}");
            return true;
          }
          break;
        }
    }

    return false;
  }


  //needs improvements, separate logout for facebook and google and a clean up
  Future<bool> logout() async {
    if (_loggedViaKakaotalk) {
      try {
        final FlutterKakaoLogin kakaoSignIn = new FlutterKakaoLogin();
        await kakaoSignIn.logOut();
        setLoggedViaKakaotalk(false);
        setLogged(false);
      } catch (e) {
        print("${e.code} ${e.message}");
        return true;
      }
    } else {
      try {
        await FacebookAuth.instance.logOut();
        await FirebaseAuth.instance.signOut();
        setLogged(false);
      } catch (e) {
        print("${e.code} ${e.message}");
        return true;
      }
    }
    return false;
  }

  // to delete, just for testing
  Future<String> amILoggedIn() async {
    String result = "??";
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        return true;
      } else {
        result = "LOGGED IN FIREBASE";
      }
    });

    return result;
  }
}

Users currentUser = new Users();
