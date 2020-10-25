import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';


class VideoPage extends StatelessWidget {
  static const routeName = "/video";
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    final title = 'Grid List';

    return Scaffold(
        appBar: AppBar(
            leading : IconButton(
                icon : Image.asset('assets/images/ic_main_toolbar_store_48_dp.png'),
                onPressed: null,
            ),
        centerTitle: true,
        title : IconButton(
              icon : Image.asset('assets/images/ic_toolbar_logo_120_dp_48_dp.png'),
            ),
            actions: <Widget>[

              IconButton(
              icon : Image.asset('assets/images/ic_mail_000000_48_dp.png'),
                onPressed: null,
              ),
              IconButton(
                icon : Image.asset('assets/images/ic_main_toolbar_menu_de_000000_48_dp.png'),
                onPressed: null,
              ),

            ],

            backgroundColor: Hexcolor('#fdfdfd'),
        ),
        body: SafeArea(
          child : Column(
            children: <Widget>[
              SizedBox(
                  width:deviceWidth,
                  height:179,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(16.0),
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    children: List.generate(20,(index){
                      return Stack(
                        children:<Widget>[
                          Container(
                            color: Colors.lightGreen,
                          ),
                          Positioned(
                            child: Container(
                              margin: const EdgeInsets.only(left: 78.0, top: 98.0),
                              child: Text("00:00",
                              style: TextStyle(fontSize: 12,
                                  color: Colors.black),
                              ),
                            ),
                          )
                        ]
                      );
                    })
                )
              ),
              Positioned(
                  child: Container(
                    height: 36,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255,255,255,8.0),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text(
                        "앨범",
                        style: TextStyle(
                          color: Hexcolor('#333333'), fontSize: 14,
                        )
                    ),
                  )
              ),
          ],
        )
        )
    );
  }
}