import 'dart:async';
import 'dart:convert';
import 'package:cdp1_aitube/models/size_config.dart';
import 'package:cdp1_aitube/pages/video_page.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController Contorller;

class EditPage extends StatefulWidget {
  EditPage(VideoPlayerController controller, {Key key, this.title}) : super(key: key){
    Contorller = controller;
  }

  final String title;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  StreamController<int> _controller = StreamController<int>();
  List<String> data_list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        title: TitleBar(),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: SizeConfig.heightMultiplier * 32.5,
              child: VideoPlayerScreen(),
            ),
            Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
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
                                                InkWell(
                                                  child: Text(
                                                    "  start  ",
                                                    style: new TextStyle(
                                                        fontSize: 17,
                                                        backgroundColor:
                                                            Colors.black,
                                                        color: Colors.white,
                                                        height: 2.0),
                                                  ),
                                                ),
                                                for (int i = 0;
                                                    i < data_list.length;
                                                    i++)
                                                  new InkWell(
                                                    child: Text(
                                                      data_list[i],
                                                      style: new TextStyle(
                                                          fontSize: 17,
                                                          height: 2.0),
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
                        icon: Image.asset('assets/images/rectangle.png'),
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
                        icon: Image.asset('assets/images/rectangle.png'),
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

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  FlickManager flickManager;
  @override
  void initState() {
    _controller = Contorller;
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    flickManager = FlickManager(
      videoPlayerController: _controller,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          flickManager.flickControlManager.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager.autoResume();
        }
      },
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          return(
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller), //here it is!!
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                  FlickVideoPlayer(
                    flickManager: flickManager,
                    flickVideoWithControls: FlickVideoWithControls(
                      controls: FlickPortraitControls(),
                    ),
                    flickVideoWithControlsFullscreen: FlickVideoWithControls(
                      controls: FlickLandscapeControls(),
                    ),
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}

