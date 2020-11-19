import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cdp1_aitube/models/size_config.dart';
import 'package:cdp1_aitube/pages/dummy_page.dart';
import 'package:cdp1_aitube/pages/select_page.dart';
import 'package:cdp1_aitube/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';
import 'package:photo_manager/photo_manager.dart';

class VideoPage extends StatelessWidget {
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
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 23 * SizeConfig.heightMultiplier,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 243, 196, 1.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Gallery(),
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
        ))
      ],
    );
  }
}

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  // This will hold all the assets we fetched
  List<AssetEntity> assets = [];

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
        return AssetThumbnail(asset: assets[index]);
      },
    );
  }
}

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({
    Key key,
    @required this.asset,
  }) : super(key: key);

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  // if it's not, navigate to VideoScreen
                  return VideoScreen(videoFile: asset.file);
                }),
              );
            },
            child: Stack(
              children: [
                // Wrap the image in a Positioned.fill to fill the space
                Positioned.fill(
                  child: Image.memory(bytes, fit: BoxFit.cover),
                ),
                // Display a Play icon if the asset is a video
                if (asset.type == AssetType.video)
                  Center(
                    child: Container(
                      color: Colors.blue,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
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
  const VideoScreen({
    Key key,
    @required this.videoFile,
  }) : super(key: key);

  final Future<File> videoFile;

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _controller;
  bool initialized = false;

  @override
  void initState() {
    _initVideo();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _initVideo() async {
    final video = await widget.videoFile;
    _controller = VideoPlayerController.file(video)
      // Play the video again when it ends
      ..setLooping(true)
      // initialize the controller and notify UI when done
      ..initialize().then((_) => setState(() => initialized = true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initialized
          // If the video is initialized, display it
          ? Scaffold(
              body: Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(_controller),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // Wrap the play or pause in a call to `setState`. This ensures the
                  // correct icon is shown.
                  setState(() {
                    // If the video is playing, pause it.
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // If the video is paused, play it.
                      _controller.play();
                    }
                  });
                },
                // Display the correct icon depending on the state of the player.
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            )
          // If the video is not yet initialized, display a spinner
          : Center(child: CircularProgressIndicator()),
    );
  }
}
