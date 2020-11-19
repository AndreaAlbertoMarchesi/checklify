import 'dart:convert';

import 'package:checklist_app/states/Settings.dart';
import 'package:checklist_app/utils/URL.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageDialog extends StatefulWidget {
  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    Future<List<String>> _initImages() async {
      // >> To get paths you need these 2 lines
      final manifestContent =
          await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

      final Map<String, dynamic> manifestMap =
          await json.decode(manifestContent);
      // >> To get paths you need these 2 lines

      List<String> s = manifestMap.keys
          .where((String key) => key.contains(URL.imagesFolder))
          .where((String key) => !key.contains(URL.introFolder))
          .where((String key) => key.contains('.png'))
          .toList();
      return s;
    }

    return AlertDialog(
        scrollable: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: FutureBuilder(
          future: _initImages(),
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? Container(
                    height: 400.0,
                    width: 400.0,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemExtent: 60.0,
                      padding: EdgeInsets.all(6),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            snapshot.data[index]
                                .substring(URL.imagesFolder.length, snapshot.data[index].indexOf('.'))
                                .toUpperCase(),
                            style: TextStyle(
                              fontSize: settings.getFontSizeChildren(),
                            ),
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("${snapshot.data[index]}"),
                            backgroundColor: Colors.transparent,
                            //background image
                          ),
                          onTap: () {
                            settings.modifyPhoto(snapshot.data[index]);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  )
                : new Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
