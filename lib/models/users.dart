import 'package:google_sign_in/google_sign_in.dart';

enum LoginMethod { GOOGLE, KAKAO, FLUTTER }

class Users {
  String _userPhotoUrl;
  String _userName;
  String _userId;
  String _userEmail;
  LoginMethod _loginMethod;

  String getName() {
    return _userName;
  }

  String getId() {
    return _userId;
  }

  String getEmail() {
    return _userEmail;
  }

  String getPhoto() {
    return _userPhotoUrl;
  }
  
  void changeLoginMethod(LoginMethod method) {
    _loginMethod = method;
  }
  
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> handleSignIn() async {
    switch (_loginMethod) {
      case LoginMethod.GOOGLE:
        {
          try {
            await _googleSignIn.signIn();
            _userId = _googleSignIn.currentUser.id;
            _userName = _googleSignIn.currentUser.displayName;
            _userEmail = _googleSignIn.currentUser.email;
            _userPhotoUrl = _googleSignIn.currentUser.photoUrl;
          } catch (error) {
            print(error);
          }
          break;
        }
      case LoginMethod.KAKAO:
        break;
      case LoginMethod.FLUTTER:
        break;
    }
  }

  Future<bool> isSignedIn() async {
    try {
      return _googleSignIn.isSignedIn();
    } catch (error) {
      print(error);
    }
  }

  void handleLogOut() {
    switch (_loginMethod) {
      case LoginMethod.GOOGLE:
        if (_googleSignIn.isSignedIn() != null) _googleSignIn.signOut();
        break;
      case LoginMethod.KAKAO:
        break;
      case LoginMethod.FLUTTER:
        break;
    }
  }
}
