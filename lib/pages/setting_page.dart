import 'package:cdp1_aitube/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingPage extends StatelessWidget {
  static const routeName = "/settings";
  String username = '홍길동';
  int voice_recognition_time = 3600;

  void openLogin(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(LoginPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left, color: Hexcolor('#de000000')),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Hexcolor('#fdfdfd'),
            title: Text('메뉴',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Hexcolor('#333333')
                )
            ),
            centerTitle: true,
            elevation: 0.0,
            actions: <Widget> [
              IconButton(
                icon: Image.asset('assets/images/ic_toolbar_setting_000000_48_dp.png'),
                onPressed: () {},
              )
            ]
        ),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  makePremium(),
                  makeProfile(),
                  makeDivider(7),
                  makeAiTubeService(),
                  makeDivider(7),
                  makeTile('공지사항'),
                  makeDivider(1),
                  makeTile('도움말'),
                  makeDivider(1),
                  makeTile('튜토리얼 동영상'),
                  makeDivider(1),
                  makeTile('문의하기'),
                  makeDivider(1),
                  makeTile('리뷰 및 별점주기'),
                  makeAppInfoSizedBox(),
                  makeVersionInfo(),
                  makeDivider(1),
                  makeTile('약관정보'),
                  makeDivider(7),
                  makeCopyrightSizedBox(),
                ]
            )
        )
    );
  }

  Widget makePremium() {
    return Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Hexcolor('#fdc23e'),
            child: InkWell(
              onTap: () {
                print('프리미엄');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child: Text(
                  '프리미엄 이용권 구독하기',
                  style: TextStyle(
                    fontSize: 14,
                    color: Hexcolor('#ffffff'),
                  ),
                ),
              ),
            ),
          )
        ]
    );
  }

  Widget makeProfile() {
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Hexcolor('#969696'),
              child: CircleAvatar(
                radius: 28,
                //backgroundImage: user image url
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                        username,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Hexcolor('#333333'),
                        )
                    )
                ),
                SizedBox(height: 5),
                Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                        '음성인식 사용 가능 시간  ${voice_recognition_time /
                            60}분 ${voice_recognition_time % 60}초',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Hexcolor('#e0e0e0'),
                        )
                    )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 18),
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              color: Hexcolor('#de000000'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
  Widget makeAiTubeService() {
    return Container(
        height: 64,
        width: double.infinity,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 12),
                child: Image.asset(
                  "assets/images/ic_menu_service_48_dp.png",
                )
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Text('AITube 서비스',
                          style: TextStyle(
                            fontSize: 14,
                            color: Hexcolor('#333333'),
                          )
                      )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 18),
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                color: Hexcolor('#de000000'),
                onPressed: () {},
              ),
            )
          ],
        )
    );
  }

  Widget makeDivider(double h) {
    return SizedBox(
        height: h,
        width: double.infinity,
        child: Container(
          color: Hexcolor('#f4f4f4'),
        )
    );
  }

  Widget makeTile(String str) {
    return Container(
        height: 64,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 24),
                      child: Text(str,
                          style: TextStyle(
                            fontSize: 14,
                            color: Hexcolor('#333333'),
                          )
                      )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 18),
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                color: Hexcolor('#de000000'),
                onPressed: () {},
              ),
            )
          ],
        )
    );
  }

  Widget makeAppInfoSizedBox() {
    return Container(
        height: 20,
        width: double.infinity,
        color: Hexcolor('#f4f4f4'),
        child: Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(left:24, bottom: 3),
          child: Text('앱 정보',
              style: TextStyle(
                fontSize: 12,
                color: Hexcolor('#61000000'),
              )
          ),
        )
    );
  }
  Widget makeVersionInfo() {
    return Container(
        height: 64,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 24),
                      child: Text('버전정보',
                          style: TextStyle(
                            fontSize: 14,
                            color: Hexcolor('#333333'),
                          )
                      )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 18),
              child: Text('현재버전 1.0.1(최신버전)',
                  style: TextStyle(
                    color: Hexcolor('#696969'),
                    fontSize: 14,
                  )
              ),
            ),
          ],
        )
    );
  }
  Widget makeCopyrightSizedBox() {
    return Container(
        height: 80,
        width: double.infinity,
        color: Hexcolor('#f4f4f4'),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 3),
          margin: EdgeInsets.only(left:24),
          child: Text('Copyrightⓒ By beanzsoft.All right reserved.',
              style: TextStyle(
                fontSize: 10,
                color: Hexcolor('#333333'),
              )
          ),
        )
    );
  }
}