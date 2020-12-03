import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cdp1_aitube/models/size_config.dart';
import 'package:cdp1_aitube/pages/select_page.dart';
import 'package:cdp1_aitube/pages/setting_page.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';
import 'package:photo_manager/photo_manager.dart';

Future<File> videoFile;

class VideoPage extends StatelessWidget {
  StreamController<int> _controller = StreamController<int>();

  Function initVideo() {
    _controller.add(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        title: TitleBar(),
        backgroundColor: Hexcolor('#fdfdfd'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 28.8 * SizeConfig.heightMultiplier,
              child: VideoScreen(
                stream: _controller.stream,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Gallery(
                notifyParent: initVideo,
              ),
            ),
          ),
        ],
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
          child: Container(
            child: IconButton(
              icon:
              Image.asset('assets/images/ic_main_toolbar_store_48_dp.png'),
              iconSize: 11.7 * SizeConfig.imageSizeMultiplier,
              onPressed: null,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: IconButton(
              icon:
              Image.asset("assets/images/ic_toolbar_logo_120_dp_48_dp.png"),
              iconSize: 30 * SizeConfig.imageSizeMultiplier,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SelectPage(),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Positioned(
                  child: IconButton(
                    icon: Image.asset('assets/images/ic_mail_000000_48_dp.png'),
                    iconSize: 11.7 * SizeConfig.imageSizeMultiplier,
                    onPressed: null,
                  ),
                  right: 10 * SizeConfig.imageSizeMultiplier,
                ),
                Positioned(
                  child: IconButton(
                    icon: Image.asset(
                        'assets/images/ic_main_toolbar_menu_de_000000_48_dp.png'),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SettingPage(),
                      ),
                    ),
                    iconSize: 11.7 * SizeConfig.imageSizeMultiplier,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
  final Function() notifyParent;

  Gallery({Key key, @required this.notifyParent}) : super(key: key);
}

class _GalleryState extends State<Gallery> {
  // This will hold all the assets we fetched
  List<AssetEntity> assets = [];
  refresh() {
    widget.notifyParent();
  }

  @override
  void initState() {
    _fetchAssets();
    super.initState();
  }

  _fetchAssets() async {
    // Set onlyAll to true, to fetch only the 'Recent' album
    // which contains all the photos/videos in the storage
    final albums = await PhotoManager.getAssetPathList(
        onlyAll: true, type: RequestType.video);
    final recentAlbum = albums.first;

    // Now that we got the album, fetch all the assets it contains
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );

    // Update the state and notify UI
    setState(() => assets = recentAssets);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // A grid view with 3 items per row
        crossAxisCount: 3,
      ),
      itemCount: assets.length,
      itemBuilder: (_, index) {
        return AssetThumbnail(
          asset: assets[index],
          notifyParent: refresh,
        );
      },
    );
  }
}

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({
    @required this.notifyParent,
    Key key,
    @required this.asset,
  }) : super(key: key);

  final Function() notifyParent;
  final AssetEntity asset;

  @override
  Widget build(BuildContext context) {
    // We're using a FutureBuilder since thumbData is a future
    return FutureBuilder<Uint8List>(
      future: asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        // If we have no data, display a spinner
        if (bytes == null) return CircularProgressIndicator();
        // If there's data, display it as an image
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: InkWell(
            onTap: () {
              videoFile = asset.file;
              notifyParent();
            },
            child: Stack(
              children: [
                // Wrap the image in a Positioned.fill to fill the space
                Positioned.fill(
                  child: Image.memory(bytes, fit: BoxFit.cover),
                ),
                // Display a Play icon if the asset is a video
                if (asset.type == AssetType.video)
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right : 1.2 * SizeConfig.heightMultiplier, bottom: 1.2 * SizeConfig.heightMultiplier),
                    child: Text(
                      asset.videoDuration.inMinutes.remainder(60).toString().padLeft(2, '0')
                          +":"+asset.videoDuration.inSeconds.remainder(60).toString().padLeft(2,'0'),
                      style: TextStyle(
                        fontSize: 12,
                        color: Hexcolor('ffffff'),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class VideoScreen extends StatefulWidget {
  final Stream<int> stream;

  const VideoScreen({
    this.stream,
    Key key,
  }) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _controller;
  bool initialized = false;
  FlickManager flickManager;

  @override
  void initState() {
    _initVideo();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    flickManager.dispose();
    super.dispose();
  }

  _initVideo() async {
    widget.stream.listen((event) {
      setState(() async {
        final video = await videoFile;
        _controller = VideoPlayerController.file(video)
        // Play the video again when it ends
          ..setLooping(true)
        // initialize the controller and notify UI when done
          ..initialize().then((_) => setState(() => initialized = true));

        flickManager = FlickManager(
          videoPlayerController:
          VideoPlayerController.file(video),
        );
      });
    });
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
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 28.5 * SizeConfig.heightMultiplier,
            child: initialized
            // If the video is initialized, display it
                ? InkWell(
              child: Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
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
                  ),
                ),
              ),
            )
            // If the video is not yet initialized, display a spinner
                : Center(child: WhenTheContentIsNull()),
          ),

        ]

    ),
    );

  }

}

class WhenTheContentIsNull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              '편집할 영상을 선택 하세요!',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2.1,
                color: Hexcolor('#333333'),
              ),

            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              '영상을 선택하시면 미리보기로 확인하실 수 있습니다',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 1.5,
                color: Hexcolor('#333333'),
              ),
            ),
          ),
        ],
      ),

    );

  }
}