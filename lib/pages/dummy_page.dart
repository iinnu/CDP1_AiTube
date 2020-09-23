import 'package:cdp1_aitube/pages/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  void openSettings(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SettingPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy screen'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.drag_handle,
            ),
            onPressed: () => openSettings(context),
          )
        ],
      ),
    );
  }
}
