import 'package:cdp1_aitube/pages/video_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditPage extends StatelessWidget {
  static const routename = '/edit';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'video edit',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: Image.asset(
                'assets/images/ic_toolbar_navigate_before_de_000000_48_dp.png'),
            onPressed: null),
        title: new IconButton(
            icon: Image.asset('assets/images/ic_mail_000000_48_dp.png'),
            onPressed: null),
        actions: <Widget>[
          IconButton(
              icon: Image.asset(
                  'assets/images/ic_popovers_trextstyle_de_000000_30_dp.png'),
              onPressed: null),
          IconButton(
              icon: Image.asset(
                  'assets/images/ic_toolbar_help_de_000000_48_dp.png'),
              onPressed: null),
          IconButton(
              icon: Image.asset(
                  'assets/images/ic_toolbar_upload_de_000000_48_dp.png'),
              onPressed: null),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 250),
            Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    icon: Image.asset(
                        'assets/images/ic_video_play_fdc_23_e_48_dp.png'),
                    onPressed: null),
                Text("00:00" + " / " + "03:20"),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                          icon: Image.asset(
                              'assets/images/ic_segment_undo_off_61000000_48_dp.png'),
                          onPressed: null),
                      IconButton(
                          icon: Image.asset(
                              'assets/images/ic_segment_redo_off_61000000_48_dp.png'),
                          onPressed: null),
                      IconButton(
                          icon:
                          Image.asset('assets/images/ic_view_up_48_dp.png'),
                          onPressed: null),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50),
                            VerticalDivider(),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                    "hello, there! nice to meet you!\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nhello"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                height: 57,
                width: 290,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: <Widget>[

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}