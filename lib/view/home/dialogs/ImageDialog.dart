import 'dart:convert';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:provider/provider.dart';
import 'package:checklist_app/model/AppState.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatefulWidget {
  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    Future<List<String>> _initImages() async {
      // >> To get paths you need these 2 lines
      final manifestContent =
          await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

      final Map<String, dynamic> manifestMap =
          await json.decode(manifestContent);
      // >> To get paths you need these 2 lines

      List<String> s = manifestMap.keys
          .where((String key) => key.contains('images/'))
          .where((String key) => key.contains('.png'))
          .toList();
      return s;
    }

    return AlertDialog(
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
                              snapshot.data[index].substring(7).toUpperCase(),
                            style: TextStyle(
                              fontSize: Styles.getFontSizeChildren(appState.size),
                            ),
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("${snapshot.data[index]}"),
                            backgroundColor: Colors.transparent,
                            //background image
                          ),
                          onTap: () {
                            appState.modifyPhoto(snapshot.data[index]);
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
