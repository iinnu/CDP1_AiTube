import 'package:cdp1_aitube/models/user.dart';
import 'package:cdp1_aitube/pages/select_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Widget kakaoLoginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: InkWell(
      onTap: () async {
        bool userLoggedIn = await currentUser.login(LoginMethod.KAKAO);
        if (userLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SelectPage()));
        }
      },
      child: Container(
        height: 50,
        decoration: new BoxDecoration(
          color: Hexcolor('#f7e317'),
          borderRadius: new BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/images/ic_login_kakao.svg',
                height: 25,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                'Kakao로 계속하기',
                style: GoogleFonts.nanumGothic().copyWith(
                    fontSize: 18,
                    letterSpacing: 0.22,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Visibility(
                visible: false,
                child: SvgPicture.asset(
                  'assets/images/ic_login_kakao.svg',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget googleLoginButton(BuildContext context) {
  return InkWell(
    onTap: () async {
      bool userLoggedIn = await currentUser.login(LoginMethod.GOOGLE);
      if (userLoggedIn) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => SelectPage()));
      }
    },
    child: Container(
    height: 50,
    decoration: new BoxDecoration(
      color: Hexcolor('#c53829'),
      borderRadius: new BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SvgPicture.asset(
            'assets/images/ic_login_google.svg',
            height: 25,
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            'Google로 계속하기',
            style: GoogleFonts.nanumGothic().copyWith(
                fontSize: 18,
                letterSpacing: 0.22,
                color: Colors.white,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Visibility(
            visible: false,
            child: SvgPicture.asset(
              'assets/images/ic_login_google.svg',
            ),
          ),
        ),
      ],
    ),
  ),
  );
}

Widget facebookLoginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: InkWell(
      onTap: () async {
        bool userLoggedIn = await currentUser.login(LoginMethod.FACEBOOK);
        if (userLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SelectPage()));
        }
      },

      child: Container(
        height: 50,
        decoration: new BoxDecoration(
          color: Hexcolor('#4267b2'),
          borderRadius: new BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/images/ic_login_facebook.svg',
                height: 25,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                'Facebook으로 계속하기',
                style: GoogleFonts.nanumGothic().copyWith(
                    fontSize: 18,
                    letterSpacing: 0.22,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Visibility(
                visible: false,
                child: SvgPicture.asset(
                  'assets/images/ic_login_facebook.svg',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
