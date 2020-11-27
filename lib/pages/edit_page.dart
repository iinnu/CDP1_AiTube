import 'dart:convert';

import 'package:cdp1_aitube/models/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class EditPage extends StatefulWidget {
  EditPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  List<String> data_list = [];

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
                                child: new Container(
                                  child: FutureBuilder<List<String>>(
                                    future: parseJson(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<List<String>> snapshot) {
                                      List<Widget> children;
                                      data_list = snapshot.data;
                                      if (snapshot.hasData) {
                                        children = <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Wrap(
                                              spacing: 8,
                                              runSpacing: 4,
                                              direction: Axis.horizontal,
                                              children: <Widget>[
                                                for (int i = 0;
                                                i < data_list.length;
                                                i++)
                                                  new InkWell(
                                                    child: Text(
                                                      data_list[i],
                                                      style: new TextStyle(
                                                          fontSize: 17),
                                                    ),
                                                    onTap: null,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ];
                                      } else {
                                        children = <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Text("Awaiting result..."),
                                          )
                                        ];
                                      }
                                      return SafeArea(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: children,
                                        ),
                                      );
                                    },
                                  ),
                                ),
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
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20.0),
              height: 57,
              width: 290,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Center(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10 * SizeConfig.imageSizeMultiplier,
                      child: IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Image.asset(
                            'assets/images/ic_popovers_additional_ffffff_30_dp.png'),
                        iconSize: 10 * SizeConfig.imageSizeMultiplier,
                        onPressed: null,
                      ),
                    ),
                    SizedBox(
                      width: 5 * SizeConfig.imageSizeMultiplier,
                      child: IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Image.asset(
                            'assets/images/rectangle.png'),
                        iconSize: 5 * SizeConfig.imageSizeMultiplier,
                        onPressed: null,
                      ),
                    ),
                    SizedBox(
                      width: 10 * SizeConfig.imageSizeMultiplier,
                      child: IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Image.asset(
                            'assets/images/ic_popovers_cut_ffffff_30_dp.png'),
                        iconSize: 10 * SizeConfig.imageSizeMultiplier,
                        onPressed: null,
                      ),
                    ),
                    SizedBox(
                      width: 10 * SizeConfig.imageSizeMultiplier,
                      child: IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Image.asset(
                            'assets/images/ic_popovers_copy_ffffff_30_dp.png'),
                        iconSize: 10 * SizeConfig.imageSizeMultiplier,
                        onPressed: null,
                      ),
                    ),
                    SizedBox(
                      width: 10 * SizeConfig.imageSizeMultiplier,
                      child: IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Image.asset(
                            'assets/images/ic_popovers_paste_ffffff_30_dp.png'),
                        iconSize: 10 * SizeConfig.imageSizeMultiplier,
                        onPressed: null,
                      ),
                    ),
                    SizedBox(
                      width: 5 * SizeConfig.imageSizeMultiplier,
                      child: IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Image.asset(
                            'assets/images/rectangle.png'),
                        iconSize: 5 * SizeConfig.imageSizeMultiplier,
                        onPressed: null,
                      ),
                    ),
                    SizedBox(
                      width: 10 * SizeConfig.imageSizeMultiplier,
                      child: IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Image.asset(
                            'assets/images/ic_popovers_text_474747_30_dp.png'),
                        iconSize: 10 * SizeConfig.imageSizeMultiplier,
                        onPressed: null,
                      ),
                    ),
                    SizedBox(
                      width: 10 * SizeConfig.imageSizeMultiplier,
                      child: IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Image.asset(
                            'assets/images/ic_popovers_voice_474747_30_dp.png'),
                        iconSize: 10 * SizeConfig.imageSizeMultiplier,
                        onPressed: null,
                      ),
                    ),
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

Future<String> _loadFromAsset() async {
  return await rootBundle.loadString("assets/progress_response_j.json");
}

Future<List<String>> parseJson() async {
  String jsonString = await _loadFromAsset();
  final jsonResponse = jsonDecode(jsonString);
  final_Result r = new final_Result.fromJson(jsonResponse);
  List something = r.result;
  Result re;
  Alternative al;
  Word wd;
  List<String> final_word_list = [];
  for (int i = 0; i < something.length; i++) {
    re = something[i];
    List some = re.Alter;
    al = some[0];
    List some2 = al.words;
    for (int k = 0; k < some2.length; k++) {
      wd = some2[k];
      String last_word = wd.final_word;
      final_word_list.add(last_word);
    }
  }
  return final_word_list;
}

class Word {
  String startTime;
  String endTime;
  String final_word;

  Word(this.startTime, this.endTime, this.final_word);

  factory Word.fromJson(dynamic json) {
    return Word(json['startTime'] as String, json['endTime'] as String,
        json['word'] as String);
  }

  @override
  String toString() {
    return '${this.startTime}, ${this.endTime}, ${this.final_word}';
  }
}

class Alternative {
  String transcript;
  double confidence;
  List words;

  Alternative(this.transcript, this.confidence, [this.words]);

  factory Alternative.fromJson(dynamic json) {
    if (json['words'] != null) {
      var wordObjsJson = json['words'] as List;
      List _words =
      wordObjsJson.map((wordJson) => Word.fromJson(wordJson)).toList();

      return Alternative(
          json['transcript'] as String, json['confidence'] as double, _words);
    } else {
      return Alternative(
          json['transcript'] as String, json['confidence'] as double);
    }
  }

  String toString() {
    return '${this.transcript}, ${this.confidence}, ${this.words}';
  }
}

class Result {
  String language;
  List Alter;

  Result(this.language, [this.Alter]);

  factory Result.fromJson(dynamic json) {
    if (json['alternatives'] != null) {
      var alterObjsJson = json['alternatives'] as List;
      List _alter = alterObjsJson
          .map((alterJson) => Alternative.fromJson(alterJson))
          .toList();
      return Result(json['languageCode'] as String, _alter);
    } else {
      return Result(json['languageCode']);
    }
  }

  String toString() {
    return '${this.Alter}, ${this.language}';
  }
}

class final_Result {
  List result;

  final_Result([this.result]);

  factory final_Result.fromJson(dynamic json) {
    if (json['results'] != null) {
      var resultObjsJson = json['results'] as List;
      List _result = resultObjsJson
          .map((resultJson) => Result.fromJson(resultJson))
          .toList();

      return final_Result(_result);
    } else {
      return null;
    }
  }
}
