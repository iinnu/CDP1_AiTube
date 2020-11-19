import 'package:cdp1_aitube/models/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EditPage extends StatefulWidget {
  EditPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 0.0,
          automaticallyImplyLeading: false,
          title: TitleBar(),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: SizeConfig.heightMultiplier * 32.5),
            Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Transform.scale(
                  scale: 0.5 * SizeConfig.imageSizeMultiplier,
                  child: IconButton(
                      icon: Image.asset(
                          'assets/images/ic_video_play_fdc_23_e_48_dp.png'),
                      onPressed: null),
                ),
                Text(
                  "00:00",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: Hexcolor('fdc23e'),
                  ),
                ),
                Text(
                  " / " + "03:20",
                  style: TextStyle(fontSize: SizeConfig.textMultiplier * 2),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                          icon: Image.asset(
                              'assets/images/ic_segment_undo_off_61000000_48_dp.png'),
                          iconSize: 10 * SizeConfig.imageSizeMultiplier,
                          onPressed: null),
                      IconButton(
                          icon: Image.asset(
                              'assets/images/ic_segment_redo_off_61000000_48_dp.png'),
                          iconSize: 10 * SizeConfig.imageSizeMultiplier,
                          onPressed: null),
                      SizedBox(
                        width: SizeConfig.imageSizeMultiplier * 3,
                      ),
                      IconButton(
                          icon:
                              Image.asset('assets/images/ic_view_up_48_dp.png'),
                          iconSize: 10 * SizeConfig.imageSizeMultiplier,
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
                      IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: SizeConfig.imageSizeMultiplier * 13),
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
            Container(
              margin: const EdgeInsets.all(20.0),
              height: 57,
              width: 290,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              IconButton(
                icon: Image.asset(
                    'assets/images/ic_toolbar_navigate_before_de_000000_48_dp.png'),
                iconSize: 11.7 * SizeConfig.imageSizeMultiplier,
                onPressed: () => Navigator.pop(context),
              ),
              Positioned(
                right: SizeConfig.imageSizeMultiplier * 8,
                child: IconButton(
                  icon: Image.asset('assets/images/ic_mail_000000_48_dp.png'),
                  iconSize: 11.7 * SizeConfig.imageSizeMultiplier,
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Positioned(
                  child: IconButton(
                      icon: Image.asset(
                          'assets/images/ic_popovers_trextstyle_de_000000_30_dp.png'),
                      iconSize: 11.7 * SizeConfig.imageSizeMultiplier,
                      onPressed: null),
                  right: SizeConfig.imageSizeMultiplier * 18,
                ),
                Positioned(
                  right: SizeConfig.imageSizeMultiplier * 9,
                  child: IconButton(
                      icon: Image.asset(
                          'assets/images/ic_toolbar_help_de_000000_48_dp.png'),
                      iconSize: 11.7 * SizeConfig.imageSizeMultiplier,
                      onPressed: null),
                ),
                IconButton(
                    icon: Image.asset(
                        'assets/images/ic_toolbar_upload_de_000000_48_dp.png'),
                    iconSize: 11.7 * SizeConfig.imageSizeMultiplier,
                    onPressed: null),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
