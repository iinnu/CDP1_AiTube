import 'package:cdp1_aitube/pages/find_page.dart';
import 'package:cdp1_aitube/pages/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:cdp1_aitube/pages/select_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

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
            child: Column(children: <Widget>[
              _buildTextContainer1(),
              _buildLogoImage(),
              _buildTextContainer2(),
              //_facebookButton(),
              //_googleButton(),
              _kakaoButton(),
              _buildTextContainer3(),
            ],
            ),
          ),
        )
    );
  }

  Widget _buildTextContainer1() {
    return Container(
      margin: EdgeInsets.only(
        top: 97.0,
        bottom: 11.0,
      ),
      child: Text(
        '텍스트 편집의 시작',
        style: TextStyle(
          fontSize: 15.5,
          color: Hexcolor('#474747'),
        ),
      ),
    );
  }

  Widget _buildLogoImage() {
    return SvgPicture.asset(
        'assets/images/logo.svg',
        //width: 160,
        //height: 44,
      );
  }

  Widget _buildTextContainer2() {
    return Container(
      margin: EdgeInsets.only(
        top: 180.0,
        bottom: 20.0,
      ),
      child: Text(
        'AiTube의 서비스를 이용하시려면 로그인 해주세요.',
        style: TextStyle(
          fontSize: 14,
          color: Hexcolor('#333333'),
        ),
      ),
    );
  }

  //Widget _facebookButton() {}
  //Widget _googleButton() {}

  Widget _kakaoButton() {
    return InkWell(
        onTap: () => print("pressed"),
        child: Image.asset(
          'assets/images/kakao_login.png',
          //fit: BoxFit.cover,
        )
    );
  }

  Widget _buildTextContainer3() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 10.0,
      ),
        child: RichText(
            text: TextSpan(
                text: '회원가입 없이 이용 가능하며 로그인시 ',
                style: TextStyle(
                  fontSize: 8,
                  color: Hexcolor('#969696'),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '이용약관 ',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Hexcolor('#969696'),
                    ),
                  ),
                  TextSpan(
                    text: '및',
                    style: TextStyle(
                      fontSize:8,
                      color: Hexcolor('#969696'),
                    ),
                  ),
                  TextSpan(
                    text: '개인정보처리방침',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Hexcolor('#969696'),
                    ),
                  ),
                  TextSpan(
                    text: '에 동의한 것으로 간주합니다.',
                    style: TextStyle(
                      fontSize: 8,
                      color: Hexcolor('#969696'),
                    ),
                  )
                ]
            )
        )
    );
  }

  void _openSelect(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SelectPage.routeName);
  }
}
